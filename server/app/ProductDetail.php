<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class ProductDetail extends Model
{
    
    // relation between the produuctDetails and  feedback
    public function Feedback(){
        return $this->hasMany(Feedback::class);
    }


}
