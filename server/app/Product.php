<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    public function productItems()
    {
        return $this->hasMany(ProductDetail::class, 'product_id', 'id');
    }
}
