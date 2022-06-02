<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Customer;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Http\Controllers\BaseController as BaseController;
class ApiAuthController extends BaseController
{
    public function register (Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            // customer data attribute check validation
            'phone'=>'required|string',
            'billing_address'=>'required|string',
            'shipping_address'=>'required|string',
            //'image'=>'required|image:jpeg,png,jpg,gif,svg|max:2048'
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $request['password']=Hash::make($request['password']);
        $request['remember_token'] = Str::random(10);
        $user = User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => $request['password'],
            'remember_token' => $request['remember_token'],
        ]);
        
        $cutomer = Customer::create([
            'name' => $request['name'],
            'user_id'=>$user->id,
            'phone'=>$request['phone'],
            'billing_address'=>$request['billing_address'],
            'shipping_address'=>$request['shipping_address'],
            'email'=>$request['email'],
        ]);
        // to update customer with image url
        if($request->file('image')){
            $file= $request->file('image');
            $filename= date('YmdHi').$file->getClientOriginalName();
            $file-> move(public_path('public/Image'), $filename);
            $cutomer-> update(['image'=>$filename]);
        }
        $token = $user->createToken('Laravel Password Grant Client')->accessToken;
        $response = ['token' => $token,'user_id'=>$user->id,'name'=>$user->name,'email'=>$user->email];
        return  $this->sendResponse($response, 'User register successfully.');
    }
    public function login (Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $user = User::where('email', $request->email)->first();
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $token = $user->createToken('Laravel Password Grant Client')->accessToken;
                $response = ['user_id'=> $user->id,'token' => $token];
                // return response($response, 200);
                return $this->sendResponse($response, 'User login successfully.');
            } else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        } else {
            $response = ["message" =>'User does not exist'];
            return response($response, 422);
        }
    }
    public function logout (Request $request) {
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }
}
