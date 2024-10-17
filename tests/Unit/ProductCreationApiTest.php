<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ProductCreationApiTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function create_product()
    {
        // Define the product data
        $productData = [
            'title'         => 'Sample Product',
            'description'   => 'This is a sample product description.',
            'price'         => 99.99,
            'quantity'      => 10,
        ];

        // Send a POST request to the API endpoint
        $response = $this->postJson(route('products.store'), $productData);

        // Assert the response status is 201 (created)
        $response->assertStatus(201);

        // Assert the product was created in the database
        $this->assertDatabaseHas('products', [
            'title'         => 'Sample Product',
            'description'   => 'This is a sample product description.',
            'price'         => 99.99,
            'quantity'      => 10,
        ]);
    }

    /** @test */
    public function requires_title()
    {
        $response = $this->postJson(route('products.store'), [
            'description'   => 'This is a sample product description.',
            'price'         => 99.99,
            'quantity'      => 10,
        ]);

        // Assert validation error for title
        $response->assertStatus(422);
    }

    /** @test */
    public function requires_price()
    {
        $response = $this->postJson(route('products.store'), [
            'title'         => 'Sample Product',
            'description'   => 'This is a sample product description.',
            'quantity'      => 10,
        ]);

        // Assert validation error for price
        $response->assertStatus(422);
    }
}
