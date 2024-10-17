<?php

namespace Modules\Website\GeneralModule\Repositories;

interface ProductRepositoryInterface 
{
    public function index();
    public function store($request);
    public function update($request);
}