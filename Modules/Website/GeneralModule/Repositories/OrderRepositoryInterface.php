<?php

namespace Modules\Website\GeneralModule\Repositories;

interface OrderRepositoryInterface 
{
    public function show($order);
    public function store($request);
}