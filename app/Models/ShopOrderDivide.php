<?php
#app/Models/ShopOrderHistory.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopOrderDivide extends Model
{
    public $table = SC_DB_PREFIX.'shop_order_divide';

    public function divide_product(){
        return $this->hasMany('App\Models\ShopOrderDivideProduct', 'divide_id', 'id');
    }
}