<?php

namespace Modules\Website\GeneralModule\Http\Controllers;

use Modules\Website\GeneralModule\Services\ProductService;
use Modules\Website\GeneralModule\Http\Requests\ProductRequest;

class ProductController
{
    private $service;

    public function __construct(ProductService $service)
    {
        $this->service = $service;
    }

    public function index()
    {
        return $this->service->index();
    }

    public function store(ProductRequest $request)
    {
        return $this->service->store($request);
    }

    public function update(ProductRequest $request)
    {
        return $this->service->update($request);
    }
}
