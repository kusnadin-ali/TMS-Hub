<?php

namespace App\Http\Controllers;

use App\Models\Cuti;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Exception;

class CutiController extends Controller {
  public function findByUser($userId)
  {
    $cuti = Cuti::addSelect(['admin' => User::select('nama_user')
      ->whereColumn('id_user', 'cuti.id_admin')
      ->limit(1)]
      )->where('id_user', $userId)->get();

      foreach($cuti as $data){
        if(!$data['admin']){
          $data['admin'] = "-";
        }
      };

      return response()->json($cuti, 200);
  }

  public function getDetailCuti($cutiId)
  {
    $cuti = Cuti::find($cutiId);
    if(Cuti::find($cutiId)->admin == null){
      $cuti['admin'] = "-";
    }else{
      $cuti['admin'] = Cuti::find($cutiId)->admin->nama_user;
    }
    return response()->json($cuti, 200);
  }

  // public function getAddData($userId)
  // {
  //   $cuti = Cuti::find($userId)->latest('tgl_mulai')->first();
  //   error_log($cuti);
  //   $user = Cuti::find($userId)->user;
  //   $sisa_cuti = $cuti->sisa_cuti - 1;
  //   if(Carbon::parse($cuti->tgl_mulai)->year != Carbon::now()->year)
  //     $sisa_cuti = 10;

  //   return response()->json([
  //     'sisa_cuti' => $sisa_cuti,
  //     'nama_user' => $user->nama_user
  //   ]);
  // }
  public function getAddData($userId)
{
    // Find the Cuti record with the given $userId
    $cuti = Cuti::find($userId);
    $user = User::find($userId);
    // Check if the $cuti is null
    if ($cuti === null) {
        // Handle the case where no record is found (you may want to return an error response or handle it according to your application logic)
        return response()->json([
          'sisa_cuti' => 10,
          'nama_user' => $user->nama_user
      ]);
    }

    // Use optional() to prevent calling latest() on null
    $latestCuti = optional($cuti)->latest('tgl_mulai')->first();

    // Check if the $latestCuti is null
    if ($latestCuti === null) {
        // Handle the case where no Cuti record is found for the user
        return response()->json(['error' => 'No Cuti record found for the user'], 404);
    }

    // Continue with the rest of your logic
    $user = $cuti->user;
    $sisa_cuti = $latestCuti->sisa_cuti - 1;

    if (Carbon::parse($latestCuti->tgl_mulai)->year != Carbon::now()->year) {
        $sisa_cuti = 10;
    }

    return response()->json([
        'sisa_cuti' => $sisa_cuti,
        'nama_user' => $user->nama_user
    ]);
}


  public function addCuti(Request $request)
  {
    $validate = $request->validate([
      'id_user' => 'required|integer',
      'tgl_mulai'=> 'required|date',
      'tgl_akhir' => 'required|date',
      'jenis_cuti' => 'required',
      'keterangan' => 'required',
    ]);
    
    $cuti = Cuti::where('id_user', $request->id_user)->latest('tgl_mulai')->first();
    $sisa_cuti = $cuti->sisa_cuti - 1;
    if(Carbon::parse($cuti->tgl_mulai)->year != Carbon::now()->year)
      $sisa_cuti = 10;

    if($sisa_cuti < 0){
      return response()->json(["message" => "Sisa cuti habis"], Response::HTTP_BAD_REQUEST);
    }

    try {
      $newCuti = Cuti::create([
        'id_user' => $request->id_user,
        'tgl_mulai' => $request->tgl_mulai,
        'tgl_akhir' => $request->tgl_akhir,
        'jenis_cuti' => $request->jenis_cuti,
        'keterangan' => $request->keterangan,
        'sisa_cuti' => $sisa_cuti,
        'status_cuti' => 'PENDING',
      ]);
      $newCuti['message'] = "Berhasil menambahkan cuti";
      return response()->json($newCuti, 201);
    }catch(Exception $ex){
      return response()->json(["message" => $ex->getMessage()], Response::HTTP_BAD_REQUEST);
    }
  }
}