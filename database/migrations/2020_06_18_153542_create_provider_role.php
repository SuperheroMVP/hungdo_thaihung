<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProviderRole extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(SC_DB_PREFIX.'provider_role', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50)->unique();
            $table->string('slug', 50)->unique();
            $table->timestamps();
        });
        Schema::create(SC_DB_PREFIX.'provider_role_order', function (Blueprint $table) {
            $table->integer('role_id');
            $table->integer('order_id');
            $table->index(['role_id', 'order_id']);
            $table->timestamps();
            $table->primary(['role_id', 'order_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists(SC_DB_PREFIX.'provider_role');
        Schema::dropIfExists(SC_DB_PREFIX.'provider_role_order');
    }
}
