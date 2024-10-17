<?php

namespace Modules\Website\GeneralModule\Database\Factories;

use Modules\Website\GeneralModule\Entities\Media;
use Modules\Website\GeneralModule\Entities\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [ 
            'description'   => $this->faker->paragraph(1),
            'title'         => $this->faker->unique()->words(rand(1, 3), true),
            'quantity'      => $this->faker->numberBetween($min = 10, $max = 500),
            'price'         => $this->faker->numberBetween($min = 10, $max = 1000),
        ];
    }
}
