<?php
$router->group(['prefix' => 'tags'], function ($router) {
    $router->get('/', 'ShopTagController@index')->name('admin_tag.index');
    $router->get('create', 'ShopTagController@create')->name('admin_tag.create');
    $router->post('/create', 'ShopTagController@postCreate')->name('admin_tag.create');
    $router->get('/edit/{id}', 'ShopTagController@edit')->name('admin_tag.edit');
    $router->post('/edit/{id}', 'ShopTagController@postEdit')->name('admin_tag.edit');
    $router->post('/delete', 'ShopTagController@deleteList')->name('admin_tag.delete');
});
