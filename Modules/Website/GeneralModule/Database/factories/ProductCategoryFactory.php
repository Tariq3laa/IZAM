<?php

namespace Modules\Website\GeneralModule\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Modules\Website\GeneralModule\Entities\Product;
use Modules\Website\GeneralModule\Entities\Category;
use Modules\Website\GeneralModule\Entities\ProductCategory;

class ProductCategoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ProductCategory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'product_id' => Product::all()->random()->id,
            'category_id' => Category::all()->random()->id,
        ];
    }
}
