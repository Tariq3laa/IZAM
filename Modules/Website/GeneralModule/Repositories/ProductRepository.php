<?php

namespace Modules\Website\GeneralModule\Repositories;

use Illuminate\Pipeline\Pipeline;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use Modules\Website\GeneralModule\Entities\Product;
use Modules\Website\GeneralModule\Helpers\Traits\ApiPaginator;
use Modules\Website\GeneralModule\Transformers\ProductResource;
use Modules\Website\GeneralModule\Repositories\ProductRepositoryInterface;

class ProductRepository implements ProductRepositoryInterface
{
    use ApiPaginator;

    private $cacheKey = 'all_products';

    public function index()
    {
        if(request('filtering_searching')) {
            $data = app(Pipeline::class)
                ->send(Product::query())
                ->through([
                    \Modules\Website\GeneralModule\Filters\PaginationPipeline::class,
                    \Modules\Website\GeneralModule\Filters\RelationPipeline::class,
                    \Modules\Website\GeneralModule\Filters\PriceRangePipeline::class,
                    \Modules\Website\GeneralModule\Filters\KeySearchPipeline::class,
                ])
                ->thenReturn();
            $collection = ProductResource::collection($data);
            return $this->getPaginatedResponse($data, $collection);
        } else {
            if($products = Cache::get($this->cacheKey)) {
                return $products;
            } else {
                $data = app(Pipeline::class)
                    ->send(Product::query())
                    ->through([
                        \Modules\Website\GeneralModule\Filters\PaginationPipeline::class,
                    ])
                    ->thenReturn();
                $collection = ProductResource::collection($data);
                $products = $this->getPaginatedResponse($data, $collection);
                Cache::forever($this->cacheKey, $products);
                return $products;
            }
        }
    }

    public function store($request)
    {
        DB::beginTransaction();
        $model = Product::query()->create($request->validated());
        if($request->categories_ids) $model->categories()->attach($request->categories_ids);
        DB::commit();
        Cache::forget($this->cacheKey);
        return ['id' => $model->id];
    }

    public function update($request)
    {
        DB::beginTransaction();
        $model = Product::query()->find($request->product);
        $model->update($request->validated());
        if($request->categories_ids) $model->categories()->sync($request->categories_ids);
        DB::commit();
        Cache::forget($this->cacheKey);
        return 'Product updated successfully.';
    }
}