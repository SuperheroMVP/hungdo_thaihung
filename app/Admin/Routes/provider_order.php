<?php
$router->group(['prefix' => 'provider_order'], function ($router) {
    $router->get('/', 'ShopProviderOrderController@index')->name('provider_order.index');
    $router->get('/show/{id}', 'ShopProviderOrderController@show')->name('provider_order.show');
    $router->get('/detail/{id}', 'ShopProviderOrderController@detail')->name('provider_order.detail');
    $router->get('create', 'ShopProviderOrderController@create')->name('provider_order.create');
    $router->post('/create', 'ShopProviderOrderController@postCreate')->name('provider_order.create');
    $router->post('/add_item', 'ShopProviderOrderController@postAddItem')->name('provider_order.add_item');
    $router->post('/edit_item', 'ShopProviderOrderController@postEditItem')->name('provider_order.edit_item');
    $router->post('/delete_item', 'ShopProviderOrderController@postDeleteItem')->name('provider_order.delete_item');
    $router->post('/update', 'ShopProviderOrderController@postOrderUpdate')->name('provider_order.update');
    $router->post('/delete', 'ShopProviderOrderController@deleteList')->name('provider_order.delete');
    $router->get('/product_info', 'ShopProviderOrderController@getInfoProduct')->name('provider_order.product_info');
    $router->get('/user_info', 'ShopProviderOrderController@getInfoUser')->name('provider_order.user_info');
    $router->get('/export_detail', 'ShopProviderOrderController@exportDetail')->name('provider_order.export_detail');
    $router->get('/list_provider_order', 'ShopProviderOrderController@listProviderOrder')->name('provider_order.list_provider_order');
    $router->post('/change_status', 'ShopProviderOrderController@changeStatusProviderOrder')->name('provider_order.change_status');
});
