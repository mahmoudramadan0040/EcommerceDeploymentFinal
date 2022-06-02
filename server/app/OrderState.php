<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Order;

class OrderState extends Model
{
    // relationship between order and order state
    public function orders(){
        return $this->belongsTo(Order::class);
    }
}
