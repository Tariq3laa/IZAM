<?php

namespace Modules\Website\GeneralModule\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Website\GeneralModule\Entities\Order;
use Modules\Website\GeneralModule\Entities\Category;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Website\GeneralModule\Database\Factories\ProductFactory;

class Product extends Model
{
    use HasFactory;
    
    protected $guarded = ['id'];

    public $search = ['title'];

    protected static function newFactory()
    {
        return ProductFactory::new();
    }

    /**
     * Gets all Product Categories
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function categories()
    {
        return $this->belongsToMany(Category::class, 'product_categories', 'product_id', 'category_id');
    }

    /**
     * Gets all Product Orders
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function orders()
    {
        return $this->belongsToMany(Order::class, 'order_items', 'product_id', 'order_id')->withPivot('price', 'quantity');
    }

    /**
     * Check if the product is in stock.
     *
     * @return bool
     */
    public function isInStock($amount = 1): bool
    {
        return $this->quantity >= $amount;
    }

    /**
     * Update the product quantity when an order is placed.
     *
     * @param int $amount
     * @return bool
     */
    public function updateQuantity(int $amount): bool
    {
        $this->quantity -= $amount;

        return $this->save();
    }
}
