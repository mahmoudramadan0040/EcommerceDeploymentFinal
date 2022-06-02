<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\ProductDetail;
use App\Feedback;
use Validator;
class FeedbackController extends Controller
{
    // store feedback
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'feedback' => 'required|string',
            'user_id' => 'required|integer',
            'item_id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        Feedback::create([
            'feedback' => $request['feedback'],
            'user_id' => $request['user_id'],
            'item_id' => $request['item_id'],
        ]);
        return response(['success' => 'Feedback added successfully'], 200);
    }
    // show the all feedback for one item with customer data 

    public function showFeedbacks_With_users($id){
        $validator = Validator::make(['id'=>$id], [
            'id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $feedbacks = Feedback::where('item_id',$id)->Select('feedback','created_at','user_id')->get();
        
        if(!count($feedbacks)){
            $response = ["message" => 'feedbacks is empty for this item'];
            return response($response, 422);
        }
        // looping for customer using feedback user_id
        foreach($feedbacks as $feedback){
            $customer = Customer::where('user_id',$feedback->user_id)->Select('name','email','image')->first();
            $feedback->customer = $customer;
        }
        return response($feedbacks,200);
    }
    
    
}
