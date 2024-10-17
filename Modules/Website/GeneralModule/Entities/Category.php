<?php

namespace Modules\Website\GeneralModule\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Website\GeneralModule\Entities\Media;
use Modules\Website\GeneralModule\Entities\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Website\GeneralModule\Database\Factories\CategoryFactory;

class Category extends Model
{
    use HasFactory;
    
    protected $guarded = ['id'];

    protected static function newFactory()
    {
        return CategoryFactory::new();
    }

    public function media()
    {
        return $this->belongsTo(Media::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_categories', 'category_id', 'product_id');
    }
}
