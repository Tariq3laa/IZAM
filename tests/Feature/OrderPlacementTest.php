<?php

namespace Tests\Feature;

use Tests\TestCase;
use Modules\Website\GeneralModule\Entities\User;
use Modules\Website\GeneralModule\Entities\Order;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Modules\Website\GeneralModule\Entities\Product;

class OrderPlacementTest  extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function place_an_order()
    {
        // Create a buyer
        $buyer = User::factory()->create();
        $this->actingAs($buyer);

        // Create a product
        $product = Product::create([
            'title'         => 'Sample Product',
            'description'   => 'This is a sample product description.',
            'price'         => 99.99,
            'quantity'      => 10,
        ]);

        // Simulate order data
        $orderData = [
            'products' => [
                [
                    'product_id'    => $product->id,
                    'quantity'      => 2,
                    'price'         => 200
                ]
            ]
        ];

        // Send a POST request to the API endpoint and Place the order
        $response = $this->postJson(route('orders.store'), $orderData);

        // Assert the response status is 201 (created)
        $response->assertStatus(201);

        // Assert that the order was created successfully
        $this->assertDatabaseHas('orders', [
            'total' => 400,
            'buyer_id' => $buyer->id,
        ]);

        // Assert that the stock is reduced appropriately
        $this->assertEquals(8, $product->fresh()->quantity);
    }
}
