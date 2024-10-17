<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Modules\Website\GeneralModule\Entities\User;
use Modules\Website\GeneralModule\Entities\Brand;
use Modules\Website\GeneralModule\Entities\Order;
use Modules\Website\GeneralModule\Entities\Product;
use Modules\Website\GeneralModule\Entities\Category;
use Modules\Website\GeneralModule\Entities\Wishlist;
use Modules\Website\GeneralModule\Entities\OrderItem;
use Modules\Website\GeneralModule\Entities\ProductCategory;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::factory(20)->create();
        Category::factory(20)->create();
        Product::factory(50)->create();
        ProductCategory::factory(50)->create();
    }
}
