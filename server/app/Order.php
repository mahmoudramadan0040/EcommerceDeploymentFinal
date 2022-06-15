<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Cutomer;
use App\OrderItem;
use App\OrderState;
class Order extends Model
{


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'duration',
        'total_price',
        'tax',
        'coupon_code',
        'order_states_id',
        'order_payment_type_id',
        'order_visa_card_id',
        'order_user_id',
        'card_number',
        'customer_phone',
        'billing_address',
        'shipping_address'
    ];
    // relations between order and customer
    public function customer(){
        return $this->belongsTo(Customer::class);
    }

    // relationship between order and order item
    public function orderItems(){
        return $this->hasMany(OrderItem::class);
    }

    // relation ship between order and order status 
    public function orderState(){
        return $this->hasOne(OrderState::class);
    }
}
