<?php
$router->group(['prefix' => 'order'], function ($router) {
    $router->get('/', 'ShopOrderController@index')->name('admin_order.index');
    $router->get('/detail/{id}', 'ShopOrderController@detail')->name('admin_order.detail');
    $router->get('create', 'ShopOrderController@create')->name('admin_order.create');
    $router->post('/create', 'ShopOrderController@postCreate')->name('admin_order.create');
    $router->post('/add_item', 'ShopOrderController@postAddItem')->name('admin_order.add_item');
    $router->post('/edit_item', 'ShopOrderController@postEditItem')->name('admin_order.edit_item');
    $router->post('/delete_item', 'ShopOrderController@postDeleteItem')->name('admin_order.delete_item');
    $router->post('/update', 'ShopOrderController@postOrderUpdate')->name('admin_order.update');
    $router->post('/delete', 'ShopOrderController@deleteList')->name('admin_order.delete');
    $router->get('/product_info', 'ShopOrderController@getInfoProduct')->name('admin_order.product_info');
    $router->get('/user_info', 'ShopOrderController@getInfoUser')->name('admin_order.user_info');
    $router->get('/export_detail', 'ShopOrderController@exportDetail')->name('admin_order.export_detail');
    $router->post('/change_status', 'ShopOrderController@changeStatus')->name('admin_order.change_status');
    $router->get('/show/{id}', 'ShopOrderController@showOrder')->name('admin_order.show_order');
    $router->post('/change_status_provider_order', 'ShopOrderController@changeStatusProviderOrder')->name('admin_order.change_status_provider_order');
    $router->post('/add_item_payment', 'ShopOrderController@postAddItemPayment')->name('admin_order.add_item_payment');
    $router->post('/delete_item_payment', 'ShopOrderController@postDeleteItemPayment')->name('admin_order.delete_item_payment');

});
