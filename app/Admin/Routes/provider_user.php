<?php
$router->group(['prefix' => 'provider-user'], function ($router) {
    $router->get('/', 'ShopProviderUsersController@index')->name('admin_provider_user.index');
    $router->get('create', 'ShopProviderUsersController@create')->name('admin_provider_user.create');
    $router->post('/create', 'ShopProviderUsersController@postCreate')->name('admin_provider_user.create');
    $router->get('/edit/{id}', 'ShopProviderUsersController@edit')->name('admin_provider_user.edit');
    $router->post('/edit/{id}', 'ShopProviderUsersController@postEdit')->name('admin_provider_user.edit');
    $router->post('/delete', 'ShopProviderUsersController@deleteList')->name('admin_provider_user.delete');
});
