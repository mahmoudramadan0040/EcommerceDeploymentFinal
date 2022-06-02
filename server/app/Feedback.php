<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Customer;

class Feedback extends Model
{
    
    protected $fillable = [
        'feedback',
        'user_id',
        'item_id'
    ];
    // relation between the cutomer and feedback
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
    // relation between the productDetails and feedback
    public function productDetail()
    {
        return $this->belongsTo(ProductDetail::class);
    }
}
