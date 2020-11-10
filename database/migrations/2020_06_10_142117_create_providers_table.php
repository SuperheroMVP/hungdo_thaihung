<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProvidersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(SC_DB_PREFIX.'shop_providers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('alias', 120)->unique();
            $table->string('email', 150)->nullable();
            $table->string('phone', 20)->nullable();
            $table->string('avatar', 255)->nullable();
            $table->string('cover', 255)->nullable();
            $table->string('address', 100)->nullable();
            $table->string('ward', 100)->nullable();
            $table->string('district', 100)->nullable();
            $table->string('province', 100)->nullable();
            $table->string('products', 255)->nullable();  //cac san pham dai ly ban
            $table->string('debt', 255)->nullable();  //tổng công nợ
            $table->string('total_sale', 255)->nullable();   //tổng bán
            $table->string('lat', 255)->nullable();   //vĩ độ
            $table->string('log', 255)->nullable();   //Kinh độ
            $table->integer('type')->default(0)->comment('0 : Agency; 1 : SubCompany');
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'provider_products', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('provider_id')->index();
            $table->integer('product_id')->index();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shop_providers');
        Schema::dropIfExists('provider_products');
    }
}
