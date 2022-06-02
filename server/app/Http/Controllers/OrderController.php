<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Order;
use App\OrderItem;
use App\PaymentType;
use App\PaymentCard;
use Validator;
use App\Http\Controllers\BaseController as BaseController;

class OrderController extends BaseController
{
    // store order with order item 
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'duration' => 'required|string',
            'total_price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'tax' => 'regex:/^\d+(\.\d{1,2})?$/',
            'coupon_code' => 'required|string',
            'order_states_id' => 'required|integer',
            'order_payment_type_id' => 'required|integer',
            'order_visa_card_id' => 'required|integer',
            'order_user_id' => 'required|integer',

            // order item validation 
            'order_items' => 'required|array',
            'order_items.*.qty' => 'required|integer',
            'order_items.*.price' => 'required|integer',
            'order_items.*.name' => 'required|string',
            'order_items.*.sku' => 'required|string',
            'order_items.*.color' => 'required|string',
            'order_items.*.size' => 'required|regex:/^\d+(\.\d{1,2})?$/',

        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $order = Order::create([
            'duration' => $request['duration'],
            'total_price' => $request['total_price'],
            'tax' => $request['tax'],
            'coupon_code' => $request['coupon_code'],
            'order_states_id' => $request['order_states_id'],
            'order_payment_type_id' => $request['order_payment_type_id'],
            'order_visa_card_id' => $request['order_visa_card_id'],
            'order_user_id' => $request['order_user_id']
        ]);
        foreach ($request['order_items'] as $order_item) {
            OrderItem::create([
                'order_id' => $order->id,
                'qty' => $order_item['qty'],
                'price' => $order_item['price'],
                'name' => $order_item['name'],
                'sku' => $order_item['sku'],
                'color' => $order_item['color'],
                'size' => $order_item['size'],
            ]);
        }

        return response(['success' => 'Order created successfully'], 200);
    }

    // show all order fro cutomer 
    public function showAllOrder($id)
    {
        $validator = Validator::make(['id'=>$id], [
            'id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $order = Order::where('order_user_id', $id)->get();
        // loop for order and get order id 
        foreach ($order as $key => $value) {
            $order_item = OrderItem::where('order_id', $value->id)->get();
            $order[$key]['order_item'] = $order_item;
        }
        if (!Order::where('order_user_id', $id)->exists()) {
            $response = ["message" => 'Order does not exist'];
            return response($response, 422);
        }
        return response($order, 200);
    }
    // show all order item for order using order id 
    public function showOrderItems($id)
    {
        $validator = Validator::make(['id'=>$id], [
            'id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $order = Order::find($id);
        if (!$order) {
            $response = ["message" => 'Order does not exist'];
            return response($response, 422);
        }
        $order_items = OrderItem::where('order_id', $order->id)->get();
        return response([$order, "order_item" => $order_items], 200);
    }

    // delete one order with all related order item
    public function deleteOrder($id)
    {
        $validator = Validator::make(['id'=>$id], [
            'id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $order = Order::find($id);
        if (!$order) {
            $response = ["message" => 'Order does not exist'];
            return response($response, 422);
        }
        $orderItems = OrderItem::where('order_id', $id)->delete();
        
        $order->delete();
        return response(['success' => 'Order deleted successfully'], 200);
    }

    // show all payment Types 
    public function showAllPaymentTypes()
    {
        $paymentTypes = PaymentType::get();
        if (!empty($paymentTypes)) {
            $data = [];
            foreach ($paymentTypes as $payment_type) {
                $data[] = [
                    'id' => $payment_type->id,
                    'payment_type' => $payment_type->pay_type,
                ];
            }
            $response =  $this->getResponse(1, '', $data);
        } else {
            $response =  $this->getResponse(1, 'notFound');
        }
        return response($response)->header('Content-Type', 'application/json');
    }


    // show all visa cards 
    public function showAllVisaCards()
    {
        $visaCards = PaymentCard::get();
        if (!empty($visaCards)) {
            $data = [];
            foreach ($visaCards as $card) {
                $data[] = [
                    'id' => $card->id,
                    'card_name' => $card->crd_name,
                ];
            }
            $response =  $this->getResponse(1, '', $data);
        } else {
            $response =  $this->getResponse(1, 'notFound');
        }
        return response($response)->header('Content-Type', 'application/json');
    }
}
