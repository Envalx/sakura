<?php

use Illuminate\Support\Facades\Route;
use Sakura\Admin\Http\Controllers\DashboardController;
use Sakura\Admin\Http\Controllers\DataGrid\DataGridController;
use Sakura\Admin\Http\Controllers\TinyMCEController;
use Sakura\Admin\Http\Controllers\User\AccountController;
use Sakura\Admin\Http\Controllers\User\SessionController;

/**
 * Extra routes.
 */
Route::group(['middleware' => ['admin'], 'prefix' => config('app.admin_url')], function () {
    /**
     * Dashboard routes.
     */
    Route::controller(DashboardController::class)->prefix('dashboard')->group(function () {
        Route::get('', 'index')->name('admin.dashboard.index');

        Route::get('stats', 'stats')->name('admin.dashboard.stats');
    });

    /**
     * Datagrid routes.
     */
    Route::controller(DataGridController::class)->prefix('datagrid')->group(function () {
        Route::get('look-up', 'lookUp')->name('admin.datagrid.look_up');
    });

    /**
     * Tinymce file upload handler.
     */
    Route::post('tinymce/upload', [TinyMCEController::class, 'upload'])->name('admin.tinymce.upload');

    /**
     * Admin profile routes.
     */
    Route::controller(AccountController::class)->prefix('account')->group(function () {
        Route::get('', 'edit')->name('admin.account.edit');

        Route::put('', 'update')->name('admin.account.update');
    });

    Route::delete('logout', [SessionController::class, 'destroy'])->name('admin.session.destroy');
});
