<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Order;

class OrderItem extends Model
{
    protected $fillable = [
        'order_id',
        'qty',
        'price',
        'name',
        'sku',
        'color',
        'size',
    ];



    // relationship between order and order item
    public function order(){
        return $this->belongsTo(Order::class);
    }
}
