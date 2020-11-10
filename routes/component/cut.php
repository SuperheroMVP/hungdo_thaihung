<?php
$prefixCategory = 'cat-thep';

Route::group(['prefix' => $prefixCategory], function ($router) use($suffix) {
    $router->get('/', 'ShopCart@getCatThep')->name('get.catthep');
    $router->post('/add'.$suffix, 'ShopCart@postCatThep')
        ->name('post.catthep');
});