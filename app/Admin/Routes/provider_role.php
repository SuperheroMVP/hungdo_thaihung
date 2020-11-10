<?php
$router->group(['prefix' => 'provider-role'], function ($router) {
    $router->get('/', 'ShopProviderRoleController@index')->name('provider_role.index');
    $router->get('create', 'ShopProviderRoleController@create')->name('provider_role.create');
    $router->post('/create', 'ShopProviderRoleController@postCreate')->name('provider_role.create');
    $router->get('/edit/{id}', 'ShopProviderRoleController@edit')->name('provider_role.edit');
    $router->post('/edit/{id}', 'ShopProviderRoleController@postEdit')->name('provider_role.edit');
    $router->post('/delete', 'ShopProviderRoleController@deleteList')->name('provider_role.delete');
});
