<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProviderRoleOrder extends Model
{
    public $table = SC_DB_PREFIX.'provider_role_order';
    protected $fillable = ['role_id', 'order_id'];

    public function orderStatus()
    {
        return $this->belongsTo(ShopOrderStatus::class,'order_status_id');
    }
}
