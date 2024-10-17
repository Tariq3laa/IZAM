<?php

namespace Modules\Website\GeneralModule\Services;

use Modules\Website\GeneralModule\Repositories\OrderRepository;
use Modules\Website\GeneralModule\Http\Controllers\InitController;

class OrderService extends InitController
{
    private $repository;

    public function __construct(OrderRepository $repository)
    {
        $this->repository = $repository;
    }

    public function show($id)
    {
        try {
            return $this->respondWithSuccess($this->repository->show($id));
        } catch (\Exception $e) {
            $code = $e->getCode();
            $message = $e->getMessage();
            return response()->json(["message" => $message], $code);
        }
    }

    public function store($request)
    {
        try {
            return $this->respondCreated([$this->repository->store($request)]);
        } catch (\Exception $e) {
            DB::rollBack();
            $code = $e->getCode();
            $message = $e->getMessage();
            return response()->json(["message" => $message], $code);
        }
    }
}