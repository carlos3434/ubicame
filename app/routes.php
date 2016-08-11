<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/
Route::get('/', function()
{
	return View::make('login');
});

Route::controller('check','LoginController');

Route::controller('package','PackageController');

Route::get('admin', function()
{
	return View::make('admin/admin');	
});

Route::get('salir',function()
{
	Auth::logout();	
	return Redirect::to('/');
});


Route::get('crear',function()
{
		$user = Usuario::find(1);
        $user->password = Hash::make('123');
	    // guardamos
	    $user->save();

	return Redirect::to('/');
});

Route::controller('roles','RolesController');