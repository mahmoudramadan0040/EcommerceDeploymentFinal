<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Order;
use App\OrderItem;
use App\PaymentType;
use App\PaymentCard;
use App\ProductDetail;
use App\Coupon;
use Validator;
use App\Http\Controllers\BaseController as BaseController;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use Elibyy\TCPDF\Facades\TCPDF;

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
            // 'order_payment_type_id' => 'required|integer',
            // 'order_visa_card_id' => 'required|integer',
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

        $orderCustomer = Customer::where('user_id', '=', $request['order_user_id'])->get()->first();
        $orderCustomerName = $orderCustomer['name'];
        $orderCustomerEmail = $orderCustomer['email'];


        if (!empty($request['coupon_code'])) {
            $order_coupon = Coupon::where('code', '=', $request['coupon_code'])->get()->first();


            if (!empty($order_coupon)) {
                $coupone_disc = $order_coupon['discount'];
                $new_order_price =  $request['total_price'] - ($request['total_price'] * ($coupone_disc / 100));

                $order = Order::create([
                    'duration' => $request['duration'],
                    'total_price' => $new_order_price,
                    'tax' => $request['tax'],
                    'coupon_code' => $request['coupon_code'],
                    'order_states_id' => $request['order_states_id'],
                    'order_payment_type_id' => $request['order_payment_type_id'],
                    'order_visa_card_id' => $request['order_visa_card_id'],
                    'order_user_id' => $request['order_user_id']
                ]);
            } else {

                $response =  $this->getResponse(0, "coupon expired:" . $request['coupon_code']);
                return $response;
            }
        } else {
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
        }


        foreach ($request['order_items'] as $order_item) {
            $product_item = ProductDetail::where('id', '=', $order_item['id'])->get()->first();
            $item_qty = $product_item['qty'];

            if (($item_qty - $order_item['qty']) > 0) {
                $new_qty = $item_qty - $order_item['qty'];
                ProductDetail::where('id', '=', $order_item['id'])->update(array(
                    'qty'      => $new_qty,
                ));

                OrderItem::create([
                    'order_id' => $order->id,
                    'qty' => $order_item['qty'],
                    'price' => $order_item['price'],
                    'name' => $order_item['name'],
                    'sku' => $order_item['sku'],
                    'color' => $order_item['color'],
                    'size' => $order_item['size'],
                ]);
                $itemsContent = "
                        <tr>
                            <td>" . $order_item['name'] . "</td>
                            <td>" . $order_item['sku'] . "</td>
                            <td>" . $order_item['color'] . "</td>
                            <td>" . $order_item['size'] . " h</td>
                            <td>" . $order_item['qty'] . "</td>
                            <td>" . $order_item['price'] . "</td>
                            <td>" . $order_item['qty'] * $order_item['price'] . "</td>
                        </tr>
                        ";
            } else if (($item_qty - $order_item['qty']) == 0) {

                $new_qty = $item_qty - $order_item['qty'];
                ProductDetail::where('id', '=', $order_item['id'])->update(array(
                    'qty'      => $new_qty,
                    'stock_status' => 'out-stock'
                ));

                OrderItem::create([
                    'order_id' => $order->id,
                    'qty' => $order_item['qty'],
                    'price' => $order_item['price'],
                    'name' => $order_item['name'],
                    'sku' => $order_item['sku'],
                    'color' => $order_item['color'],
                    'size' => $order_item['size'],
                ]);
                $itemsContent = "
                        <tr>
                            <td>" . $order_item['name'] . "</td>
                            <td>" . $order_item['sku'] . "</td>
                            <td>" . $order_item['color'] . "</td>
                            <td>" . $order_item['size'] . " h</td>
                            <td>" . $order_item['qty'] . "</td>
                            <td>" . $order_item['price'] . "</td>
                            <td>" . $order_item['qty'] * $order_item['price'] . "</td>
                        </tr>
                        ";
            } else {
                $response =  $this->getResponse(0, "qty_available:" . $item_qty, $order_item);
                $order->delete();
                return $response;
                break;
            }

            // var_dump($item_qty);
            // die();

            // ProductDetail::where('id','=',$order_item['id'])->update( array(
            //     'qty'      => $edit['username'],
            // ));

            // OrderItem::create([
            //     'order_id' => $order->id,
            //     'qty' => $order_item['qty'],
            //     'price' => $order_item['price'],
            //     'name' => $order_item['name'],
            //     'sku' => $order_item['sku'],
            //     'color' => $order_item['color'],
            //     'size' => $order_item['size'],
            // ]);
        }

        //above

        $htmlContent = "
        <html>
            <head>
                <style>
                    .tableStyle{
                        margin : auto;
                        background-color:'#eee';
                        border : 2px solid #333;
                    }
                    .headStyle{
                        text-align:center;
                        color:'#333';
                        border : 2px solid #333;
                    }
                    .bodyStyle{
                        text-align:center;
                        color:'#333';
                        border : 2px solid #333;
                    }
                    th{
                        text-align:center;
                        color:'#333';
                        border : 2px solid #333;
                        font-size:18px;
                        font-weight:bold;
                        padding: 7px;
                    }
                    td{
                        text-align:center;
                        color:'#333';
                        border : 2px solid #333;
                        font-size:18px;
                        padding: 7px;
                    }
                    heading{
                        margin:auto;
                        text-align:center;
                        font-weight:bold;
                        font-size:20px;
                    }
                </style>
            </head>
            <body>
                <div>
                    <h2>Hello ".$orderCustomerName." , check your Order Detials From Dolce</h2>
                    <h3>Date : " . date("Y/m/d") . " ------ Time : " . date("h:i:s") . "</h3>
                </div>
                <div>
                    <table class ='tableStyle'>
                        <thead class ='headStyle'>
                            <th>Total Price</th>
                            <th>Tax</th>                            
                            <th>Coupon Code</th>
                            <th>Delivery Duration</th>
                        </thead>
                        <tbody class ='bodyStyle'>
                            <td>" . $request['total_price'] . "</td>
                            <td>" . $request['tax'] . "</td>
                            <td>" . $request['coupon_code'] . "</td>
                            <td>" . $request['duration'] . " h</td>
                        </tbody>
                    </table>
                    <hr>
                    <div class='heading'>
                        <h3>Order Details</h3>
                    </div>
                    
                    <table class ='tableStyle'>
                    <thead class ='headStyle'>
                        <th>item name</th>
                        <th>sku</th>                            
                        <th>color</th>
                        <th>size</th>
                        <th>qty</th>
                        <th>price</th>
                        <th>total item price</th>
                    </thead>
                    <tbody class ='bodyStyle'>
                        " . $itemsContent . "
                    </tbody>
                </table>
                </div>
            </body>
        </html>
        ";

        $mail = new PHPMailer(true);     // Passing `true` enables exceptions

        $mail->IsSMTP();
        $mail->SMTPDebug = true;
        $mail->SMTPAuth = true;
        $mail->Host = 'smtp.gmail.com';

        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;


        $mail->Username = 'ecommshop20@gmail.com';
        $mail->Password = 'gzrwtokczgeyisrc';


        $mail->From = 'ecommshop20@gmail.com';
        $mail->FromName = 'Dolce Shop'; // frome name
        $mail->AddAddress($orderCustomerEmail, $orderCustomerName);  // Add a recipient  to name


        $mail->Subject = 'Dolce Order';
        $mail->Body    = $htmlContent;
        $mail->AltBody = 'Check Your Dolce Order Details';

        $mail->IsHTML(true); // Set email format to HTML


        if (!$mail->Send()) {
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
            $response =  $this->getResponse(0, $mail->ErrorInfo);
            exit;
        } else {
            echo 'Message of Send email using Yahoo SMTP server has been sent';
            $response =  $this->getResponse(1, 'Message of Send email using Yahoo SMTP server has been sent');
        }


        //$response =  $this->getResponse(1, "created");
        return $response;
    }

    // show all order fro cutomer 
    public function showAllOrder($id)
    {
        $validator = Validator::make(['id' => $id], [
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
        $validator = Validator::make(['id' => $id], [
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
        $validator = Validator::make(['id' => $id], [
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
