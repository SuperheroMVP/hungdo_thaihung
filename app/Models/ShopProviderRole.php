<?php

namespace App\Models;

use App\Admin\Admin;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Http\Request;

class ShopProviderRole extends Model
{
    public $table = SC_DB_PREFIX.'provider_role';
    protected $fillable = ['name', 'slug'];
    public $timestamps = true;

    /**
     * Permission belongs to many roles.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function roleOrder()
    {
        $tableProviderRoleOrder = (new ShopProviderRoleOrder)->getTable();
        $tableOrderStatus = (new ShopOrderStatus)->getTable();
        return $this->hasMany(ShopProviderRoleOrder::class,'role_id')
            ->with('orderStatus');
    }


    /**
     * Detach models from the relationship.
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();

//        static::deleting(function ($model) {
//            $model->roleOrder()->detach();
//        });
    }

/**
 * Update info
 * @param  [array] $dataUpdate
 * @param  [int] $id
 */
    public static function updateInfo($dataUpdate, $id)
    {
        $dataUpdate = sc_clean($dataUpdate);
        $obj = self::find($id);
        return $obj->update($dataUpdate);
    }

    /**
     * Create new permission
     * @return [type] [description]
     */
    public static function createPermission($dataInsert)
    {
        $dataUpdate = sc_clean($dataInsert);
        return self::create($dataUpdate);
    }

}
