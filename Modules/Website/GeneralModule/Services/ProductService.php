<?php

namespace Modules\Website\GeneralModule\Services;

use Modules\Website\GeneralModule\Http\Controllers\InitController;
use Modules\Website\GeneralModule\Repositories\ProductRepositoryInterface;

class ProductService extends InitController
{
    private $repository;

    public function __construct(ProductRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function index()
    {
        try {
            return $this->respondWithSuccess($this->repository->index());
        } catch (\Exception $e) {
            return $this->respondError($e->getMessage());
        }
    }

    public function store($request)
    {
        try {
            return $this->respondCreated([$this->repository->store($request)]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->respondError($e->getMessage());
        }
    }

    public function update($request)
    {
        try {
            return $this->respondOk($this->repository->update($request));
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->respondError($e->getMessage());
        }
    }
}