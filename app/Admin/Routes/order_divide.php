<?php
$router->group(['prefix' => 'order_divide'], function ($router) {
    $router->get('/', 'ShopOrderDivideController@index')->name('order_divide.index');
//    $router->get('/detail/{id}', 'ShopOrderDivideController@detail')->name('order_divide.detail');
    $router->get('create', 'ShopOrderDivideController@create')->name('order_divide.create');
    $router->post('/create', 'ShopOrderDivideController@store')->name('order_divide.save');
    $router->post('/add_item', 'ShopOrderDivideController@postAddItem')->name('order_divide.add_item');
    $router->post('/edit_item', 'ShopOrderDivideController@postEditItem')->name('order_divide.edit_item');
    $router->post('/delete_item', 'ShopOrderDivideController@postDeleteItem')->name('order_divide.delete_item');
    $router->post('/update', 'ShopOrderDivideController@postOrderUpdate')->name('order_divide.update');
    $router->post('/delete', 'ShopOrderDivideController@destroy')->name('order_divide.delete');
//    $router->get('/product_info', 'ShopOrderDivideController@getInfoProduct')->name('order_divide.product_info');
//    $router->get('/user_info', 'ShopOrderDivideController@getInfoUser')->name('order_divide.user_info');
//    $router->get('/export_detail', 'ShopOrderDivideController@exportDetail')->name('order_divide.export_detail');
//    $router->post('/change_status', 'ShopOrderDivideController@changeStatus')->name('order_divide.change_status');
//    $router->get('/show/{id}', 'ShopOrderDivideController@showOrder')->name('order_divide.show_order');
//    $router->post('/change_status_provider_order', 'ShopOrderDivideController@changeStatusProviderOrder')->name('order_divide.change_status_provider_order');
//    $router->post('/add_item_payment', 'ShopOrderDivideController@postAddItemPayment')->name('order_divide.add_item_payment');
//    $router->post('/delete_item_payment', 'ShopOrderDivideController@postDeleteItemPayment')->name('order_divide.delete_item_payment');

});
