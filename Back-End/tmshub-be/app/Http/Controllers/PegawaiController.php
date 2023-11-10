<?php

namespace App\Http\Controllers;

use App\Models\Divisi;
use App\Models\Pegawai;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use function PHPUnit\Framework\isEmpty;

class PegawaiController extends Controller
{

    public function getPegawai($userId)
    {
        $pegawai = Pegawai::where('id_user', $userId)->first();
        error_log($pegawai['alamat_pegawai']);

        if ($pegawai) {
            if ($pegawai['id_divisi'] != null) {
                $divisi = Divisi::find($pegawai['id_divisi']);
                $pegawai['divisi'] = $divisi['nama_divisi'];
                error_log($divisi);
            } else {
                $pegawai['divisi'] = '-';
            }
            $pegawai['foto_profil'] = '/pegawai/image/'.$pegawai['id_pegawai'];
            return response()->json($pegawai, 200);
        } else {
            return response()->json(['message' => 'User tidak ditemukan.'], 404);
        }
    }

    public function getPhotoByPegawaiId($pegawaiId)
    {
        $pegawai = Pegawai::find($pegawaiId);

        if ($pegawai) {
            $fotoBlob = $pegawai->foto_profil;

            if ($fotoBlob) {
                header('Content-Type: image/jpeg');

                echo $fotoBlob;
            } else {
                $defaultImage = public_path('image/no_pict.png');
                if (file_exists($defaultImage)) {
                    header('Content-Type: image/jpeg');
                    readfile($defaultImage);
                }
            }
        }
    }

    // public function updateProfilePicture(Request $request, $userId)
    // {
    //     $this->validate($request, [
    //         'foto_profil' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
    //     ]);
    //     $pegawai = Pegawai::where('id_user', $userId)->first();
    //     error_log($request);

    //     if (!$pegawai) {
    //         return response()->json(['message' => 'Pegawai tidak ditemukan'], 404);
    //     }

    //     if ($request->hasFile('foto_profil')) {
    //         $fotoProfil = $request->file('foto_profil');
    //         $fotoProfilData = file_get_contents($fotoProfil->getRealPath());

    //         $pegawai->foto_profil = $fotoProfilData;
    //         $pegawai->save();

    //         return response()->json(['message' => 'Foto profil pegawai berhasil diperbarui'], 200);
    //     }

    //     return response()->json(['message' => 'Foto profil tidak ditemukan'], 400);
    // }
    public function imageStore(Request $request)
    {

        try {
            $this->validate($request, [
                'id_pegawai' => 'required|integer',
                'image' => 'required|file|mimes:jpg,png,jpeg,gif,svg|max:2048',
            ]);

            $image = $request->file('image');
            //saya ingin image diubah ke type data blob lalu nanti disimpan ke database Pegawai dengan index 1 
            $imageData = file_get_contents($image->getRealPath());

            // Simpan BLOB ke kolom 'foto_profil' di tabel 'Pegawai' dengan ID 1
            DB::table('pegawai')
                ->where('id_pegawai', $request['id_pegawai']) // ID Pegawai yang sesuai (ID 1)
                ->update(['foto_profil' => $imageData]);

            // // Menyimpan gambar di direktori public
            // $image_path = $image->store('public/image');

            // // Mengganti awalan 'public/' menjadi 'storage/'
            // $image_path = str_replace('public/', 'storage/', $image_path);

            // $data = Image::create([
            //     'image' => $image_path,
            // ]);

            return response("Berhasil", Response::HTTP_CREATED);
        } catch (Exception $e) {
            // Tangani pengecualian jika berkas tidak sesuai format
            return response("Gagal: " . $e->getMessage(), Response::HTTP_BAD_REQUEST);
        }
    }

    public function updateProfile(Request $request){
        $data = $request->validate([
            'id_user' => 'required|integer',
            'alamat_pegawai' => 'required',
            'email_user'=> 'required|email',
            'nohp_pegawai' => 'required',
        ]);
        
        try {
            $pegawai = Pegawai::where('id_user', $data['id_user'])->update([
                'alamat_pegawai' => $data['alamat_pegawai'],
                'nohp_pegawai' => $data['nohp_pegawai'],
            ]);
            $user = User::where('id_user', $data['id_user'])->update([
                'email_user' => $data['email_user']
            ]);

            return response()->json(["message" => "Berhasil menyimpan profil"],200);
        } catch (Exception $ex){
            return response("Gagal: ".$ex->getMessage(), Response::HTTP_BAD_REQUEST);
        }
    }
}

