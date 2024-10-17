<?php

namespace Modules\Website\GeneralModule\Http\Controllers;

use Modules\Website\GeneralModule\Entities\Brand;
use Modules\Website\GeneralModule\Entities\Product;
use Modules\Website\GeneralModule\Entities\Category;

class HomeController
{
    public function index()
    {
        $brands = Brand::all()->random(15);
        $categories = Category::all()->random(9);
        $promotedProducts = Product::promoted()->get();
        $mostViewedProducts = Product::mostViewed()->get();
        $bestSellingProducts = Product::bestSelling()->get();
        $justArrivedProducts = Product::justArrived()->get();

        return view('website::index', [
            'brands' => $brands,
            'categories' => $categories,
            'promotedProducts' => $promotedProducts,
            'mostViewedProducts' => $mostViewedProducts,
            'bestSellingProducts' => $bestSellingProducts,
            'justArrivedProducts' => $justArrivedProducts,
        ]);
    }
}
