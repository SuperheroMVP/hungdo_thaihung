<?php
$router->group(['prefix' => 'debt_user'], function ($router) {
    $router->get('/', 'ShopDebtUserController@index')->name('admin_user_debt.index');
    $router->get('/detail_user_debt/{id}', 'ShopDebtUserController@detail_user_debt')->name('admin_user_debt.detail_user_debt');
    $router->get('create', 'ShopDebtUserController@create')->name('admin_user_debt.create');
    $router->post('/create', 'ShopDebtUserController@postCreate')->name('admin_user_debt.create');
    $router->get('/edit/{id}', 'ShopDebtUserController@edit')->name('admin_user_debt.edit');
    $router->post('/edit/{id}', 'ShopDebtUserController@postEdit')->name('admin_user_debt.edit');
    $router->get('/delete/{id}', 'ShopDebtUserController@deleteList')->name('admin_user_debt.delete');
    $router->get('/show/{id}', 'ShopDebtUserController@show')->name('admin_user_debt.show');
    $router->get('/show_user_debt_order/{id}', 'ShopDebtUserController@show_order');
    $router->post('/show/{id}', 'ShopDebtUserController@postShow')->name('admin_user_debt.show');

    $router->post('/create_debt_user', 'ShopDebtUserController@postShow')->name('admin_user_debt.show');
});