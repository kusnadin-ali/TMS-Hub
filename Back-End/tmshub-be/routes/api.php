<?php

use App\Http\Controllers\PerusahaanController;
use App\Http\Controllers\PresensiController;
use App\Http\Controllers\UserController;
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

// User
Route::get('/users', [UserController::class, 'index']);
Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);

// Presensi
Route::get('/presensi', [PresensiController::class, 'index']);
Route::get('/presensi/user/{userId}', [PresensiController::class, 'byUser']);
Route::get('/presensi-today/user/{userId}', [PresensiController::class, 'getPresensiToday']);
Route::post('/presensi/attend', [PresensiController::class, 'presensi']);

// Perusahaan
Route::get('/perusahaan', [PerusahaanController::class, 'index']);
