<?php

namespace Modules\Website\GeneralModule\Http\Controllers;

use Modules\Website\GeneralModule\Services\OrderService;
use Modules\Website\GeneralModule\Http\Requests\OrderRequest;

class OrderController
{
    private $service;

    public function __construct(OrderService $service)
    {
        $this->service = $service;
    }

    public function show($id)
    {
        return $this->service->show($id);
    }

    public function store(OrderRequest $request)
    {
        return $this->service->store($request);
    }
}
