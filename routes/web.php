<?php
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

/*
 Home
*/
Route::get('/', 'ShopFront@index')->name('home');
Route::get('index.html', 'ShopFront@index');

$suffix = sc_config('SUFFIX_URL')??'';

/*
 Auth
*/
require_once 'component/auth.php';


/*
 Member
*/
require_once 'component/member.php';

/*
 Cart
*/
require_once 'component/cart.php';

/*
 Category
*/
require_once 'component/category.php';

/*
 Brand
*/
require_once 'component/brand.php';

/*
 Supplier
*/
require_once 'component/supplier.php';

/*
 Product
*/
require_once 'component/product.php';

/*
 Content
*/
require_once 'component/content.php';

/*
 Cat thep
*/
require_once 'component/cut.php';

//Language
Route::get('locale/{code}', function ($code) {
    session(['locale' => $code]);
    return back();
})->name('locale');

//Currency
Route::get('currency/{code}', function ($code) {
    session(['currency' => $code]);
    return back();
});

$router->get('products', 'ShopFront@getListProduct')->name('products.all');


Route::post('save-location', function (\Illuminate\Http\Request $request) {
    session(['guestLocation' => $request->province]);
    return back();
})->name('save-location');

Route::get('agency', 'ShopFront@listAgency')->name('agency.list');
Route::get('agency/{alias}', 'ShopFront@agency')->name('agency.show');

//Process click banner
Route::get('/banner/{id}', 'ShopFront@clickBanner')
->name('banner.click');    

//--Please keep 2 lines route (pages + pageNotFound) at the bottom
Route::get('/{alias}'.$suffix, 'ShopFront@pageDetail')->name('page.detail');
// Route::fallback('ShopFront@pageNotFound')->name('pageNotFound'); //Make sure before using this route. There will be disadvantages when detecting 404 errors for static files like images, scripts ..
//--end keep

//get 5 provider
Route::get('/getfiveprovider', 'ShopCart@getfiveprovider')->name('cart.getfiveprovider');

//=======End Front
Route::get('test', function (){
    return view('admin.layouts.content');
});