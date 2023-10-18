<?php

use App\Http\Controllers\PerusahaanController;
use App\Http\Controllers\PresensiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Presensi
Route::get('/presensi', [PresensiController::class, 'index']);
Route::get('/presensi/user/{userId}', [PresensiController::class, 'byUser']);

// Perusahaan
Route::get('/perusahaan', [PerusahaanController::class, 'index']);
