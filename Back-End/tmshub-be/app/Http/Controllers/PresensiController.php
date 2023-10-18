<?php

namespace App\Http\Controllers;

use App\Models\Presensi;

class PresensiController extends Controller
{
    public function index(){
        $presensi = Presensi::all();
        return response()->json($presensi);
    }

    public function byUser($userId){
        $presensi = Presensi::where('id_user', $userId)->get();

        return response()->json($presensi);
    }
}
