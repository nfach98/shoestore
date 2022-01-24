<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('shoes/all', [App\Http\Controllers\ShoesController::class, 'get_all']);
Route::post('shoes/detail', [App\Http\Controllers\ShoesController::class, 'get_detail']);

Route::post('categories/all', [App\Http\Controllers\CategoryController::class, 'get_all']);