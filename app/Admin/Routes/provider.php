<?php
$router->group(['prefix' => 'provider'], function ($router) {
    $router->get('/', 'ShopProviderController@index')->name('admin_provider.index');
    $router->get('create', 'ShopProviderController@create')->name('admin_provider.create');
    $router->post('/create', 'ShopProviderController@postCreate')->name('admin_provider.create');
    $router->get('/edit/{id}', 'ShopProviderController@edit')->name('admin_provider.edit');
    $router->post('/edit/{id}', 'ShopProviderController@postEdit')->name('admin_provider.edit');
    $router->post('/delete', 'ShopProviderController@deleteList')->name('admin_provider.delete');
    $router->get('/show/{id}', 'ShopProviderController@show')->name('admin_provider.show');
    $router->post('/show/{id}', 'ShopProviderController@postShow')->name('admin_provider.show');
});
