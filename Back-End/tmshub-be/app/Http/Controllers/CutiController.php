<?php

namespace App\Http\Controllers;

use App\Models\Cuti;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Date;

class CutiController extends Controller {
  public function findByUser($userId)
  {
    $cuti = Cuti::select('id_cuti', 'tgl_mulai', 'status_cuti')->where('id_user', $userId)->get();
    return response()->json($cuti);
  }

  public function getDetailCuti($cutiId)
  {
    $cuti = Cuti::find($cutiId);
    $user = Cuti::find($cutiId)->user;
    $admin = Cuti::find($cutiId)->admin;
    return response()->json([$cuti, $user, $admin]);
  }

  public function getAddData($userId)
  {
    $cuti = Cuti::find($userId)->latest('tgl_mulai')->first();
    $user = Cuti::find($userId)->user;
    $sisa_cuti = $cuti->sisa_cuti - 1;
    if(Carbon::parse($cuti->tgl_mulai)->year != Carbon::now()->year)
      $sisa_cuti = 10;

    return response()->json([
      'sisa_cuti' => $sisa_cuti,
      'nama_user' => $user->nama_user
    ]);
  }

  public function store(Request $request)
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
      $sisa_cuti = 10 - 1;

    $newCuti = Cuti::create([
      'id_user' => $request->id_user,
      'tgl_mulai' => $request->tgl_mulai,
      'tgl_akhir' => $request->tgl_akhir,
      'jenis_cuti' => $request->jenis_cuti,
      'keterangan' => $request->keterangan,
      'sisa_cuti' => $sisa_cuti,
      'status_cuti' => 'PENDING',
      'id_admin' => 2,
    ]);

    return response()->json($newCuti);
  }

  // public function update($request)
  // {
  // }
}