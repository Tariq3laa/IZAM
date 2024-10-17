<?php

use Illuminate\Support\Facades\Route;
use Modules\Website\GeneralModule\Http\Controllers\AuthController;

Route::group([
    'prefix' => 'website',
], function () {
    Route::group([
        'prefix' => 'user',
    ], function () {
        Route::post('login', [AuthController::class, 'login'])->name('user.login');
        Route::post('register', [AuthController::class, 'register'])->name('user.register');
    });

    Route::apiResource('products', ProductController::class)->only(['index', 'store', 'update']);

    Route::group([
        'middleware' => 'auth:user'
    ], function () {
        Route::apiResource('orders', OrderController::class)->only(['show', 'store']);
    });
});