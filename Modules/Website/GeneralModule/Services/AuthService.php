<?php

namespace Modules\Website\GeneralModule\Services;

use Illuminate\Support\Facades\DB;
use Modules\Website\GeneralModule\Repositories\AuthRepository;
use Modules\Website\GeneralModule\Http\Controllers\InitController;

class AuthService extends InitController
{
    private $repository;

    public function __construct(AuthRepository $repository)
    {
        $this->repository = $repository;
    }

    public function login($request)
    {
        try {
            return $this->respondWithSuccess($this->repository->login($request));
        } catch (\Exception $e) {
            $code = $e->getCode();
            $message = $e->getMessage();
            return response()->json(["message" => $message], $code);
        }
    }

    public function register($request)
    {
        try {
            return $this->respondCreated([$this->repository->register($request)]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->respondError($e->getMessage());
        }
    }
}