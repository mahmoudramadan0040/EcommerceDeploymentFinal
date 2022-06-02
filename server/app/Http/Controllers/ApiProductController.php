<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Product;
use App\ProductDetail;

class ApiProductController extends Controller
{
    public function getCategories()
    {
        $categories = Category::get();

        if (!empty($categories)) {
            $data = [];
            foreach ($categories as $category) {
                $data[] = [
                    'id' => $category->id,
                    'category_name' => $category->category_name,
                ];
            }
            $response =  $this->getResponse(1, '', $data);
        } else {
            $response =  $this->getResponse(1, 'notFound');
        }
        return response($response)->header('Content-Type', 'application/json');
    }

    
    public function getProductsByCategory($category_id)
    {
        $category = Category::where('id', $category_id)->first();

        if ($category && $category->id) {
            $products = Product::where('category_id', $category_id)->get();
            if (empty($products)) {
                $response =  $this->getResponse(0, 'noProducts');
            } else {
                $data = [];
                foreach ($products as $product) {
                    $productitems = [];
                    foreach ($product->productItems as $item) {
                        if (!empty($product->productItems)) {
                            $productitems[] = [
                                'id' => $item->id,
                                'color' => $item->color,
                                'price' => $item->price,
                                'qty' => $item->qty,
                                'sku' => $item->sku,
                                'stock_status' => $item->stock_status,
                                'image1' => $item->image1,
                                'image2' => $item->image2,
                                'image3' => $item->image3,
                                'image4' => $item->image4,
                                'image5' => $item->image5,
                            ];
                        }
                    }
                    $data[] = [
                        'id' => $product->id,
                        'name' => $product->name,
                        'product_disc' => $product->product_disc,
                        'items' => $productitems
                    ];
                }
                $response =  $this->getResponse(1, '', $data);
            }
        } else {
            $response =  $this->getResponse(0, 'noProducts');
        }
        return response($response)->header('Content-Type', 'application/json');
    }

    public function getAllProducts()
    {
        $products = Product::get();
        if (empty($products)) {
            $response =  $this->getResponse(0, 'noProducts');
        } else {
            $data = [];
            foreach ($products as $product) {
                $productitems = [];
                foreach ($product->productItems as $item) {
                    if (!empty($product->productItems)) {
                        $productitems[] = [
                            'id' => $item->id,
                            'color' => $item->color,
                            'price' => $item->price,
                            'qty' => $item->qty,
                            'sku' => $item->sku,
                            'stock_status' => $item->stock_status,
                            'image1' => $item->image1,
                            'image2' => $item->image2,
                            'image3' => $item->image3,
                            'image4' => $item->image4,
                            'image5' => $item->image5,
                        ];
                    }
                }
                $data[] = [
                    'id' => $product->id,
                    'name' => $product->name,
                    'product_disc' => $product->product_disc,
                    'items' => $productitems
                ];
            }
            $response =  $this->getResponse(1, '', $data);
        }
        return response($response)->header('Content-Type', 'application/json');
    }
}
