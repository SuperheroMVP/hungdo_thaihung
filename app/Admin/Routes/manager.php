<?php
$router->group(['prefix' => 'manager', 'as' => 'manager.'], function ($router) {
    $router->resource('confirm','ManagerConfirmController' );// route: manager.confirm.index
});
$router->get('/manager/provider_order/confirm/{id}', 'ManagerConfirmController@showProviderOrder')->name('manager.provider_order');
$router->post('/manager/provider_order/confirm/manager_check', 'ManagerConfirmController@managerCheckProviderOrder')->name('manager.provider_order.check');