<?php

namespace Modules\Website\GeneralModule\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Website\GeneralModule\Entities\User;
use Modules\Website\GeneralModule\Entities\Product;

class Order extends Model
{
    protected $guarded = ['id'];

    /**
     * Gets all Order Products 
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function products()
    {
        return $this->belongsToMany(Product::class, 'order_items', 'order_id', 'product_id')->withPivot('price', 'quantity');
    }

    /**
     * Gets the Order Buyer
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function buyer()
    {
        return $this->belongsTo(User::class, 'buyer_id');
    }

    /**
     * Update the products quantities when an order is placed.
     *
     * @param array $products
     * @return void
     * @throws \ValidationException
     */
    public function updateProductsQuantities(array $products)
    {
        foreach ($products as $productData) {
            $product = Product::find($productData['product_id']);
            $quantity = $productData['quantity'];

            if (!$product->isInStock($quantity)) {
                throw new \Exception("Not enough stock available for product: {$product->title}.", 422);
            }

            // Update the product quantity
            $product->updateQuantity($quantity);
        }
    }

    /**
     * Calculate the total for the order.
     *
     * @param array $products
     * @return float
     */
    public function calculateTotal(array $products): float
    {
        $total = 0.0;

        foreach ($products as $productData) {
            $product = Product::find($productData['product_id']);

            if ($product) {
                $total += $productData['price'] * $productData['quantity'];
            }
        }

        return $total;
    }

    /**
     * Attach multiple products to the order.
     *
     * @param array $products
     * @return void
     */
    public function attachProducts(array $products)
    {
        foreach ($products as $productData) {
            $this->products()->attach($productData['product_id'], ['price' => $productData['price'], 'quantity' => $productData['quantity']]);
        }
    }
}
