<?php
$router->group(['prefix' => 'debt'], function ($router) {
    $router->get('/', 'ShopDebtProviderController@index')->name('admin_provider_debt.index');
    $router->get('/detail_provider_debt/{id}', 'ShopDebtProviderController@detail_provider_debt')->name('admin_provider_debt.detail_provider_debt');
    $router->get('create', 'ShopDebtProviderController@create')->name('admin_provider_debt.create');
    $router->post('/create', 'ShopDebtProviderController@postCreate')->name('admin_provider_debt.create');
    $router->get('/edit/{id}', 'ShopDebtProviderController@edit')->name('admin_provider_debt.edit');
    $router->post('/edit/{id}', 'ShopDebtProviderController@postEdit')->name('admin_provider_debt.edit');
    $router->get('/delete/{id}', 'ShopDebtProviderController@deleteList')->name('admin_provider_debt.delete');
    $router->get('/show/{id}', 'ShopDebtProviderController@show')->name('admin_provider_debt.show');
    $router->post('/show/{id}', 'ShopDebtProviderController@postShow')->name('admin_provider_debt.show');

    $router->post('/create_debt_provider', 'ShopDebtProviderController@postShow')->name('admin_provider_debt.show');
});