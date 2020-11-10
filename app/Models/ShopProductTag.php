<?php
#app/Models/ShopCategory.php
namespace App\Models;

use Cache;
use Illuminate\Database\Eloquent\Model;

class ShopProductTag extends Model
{
    use ModelTrait;

    public $timestamps = false;
    public $table = SC_DB_PREFIX . 'product_tag';
    protected $guarded = [];
    protected $connection = SC_CONNECTION;
}
