<?php

namespace Modules\Website\GeneralModule\Repositories;

interface AuthRepositoryInterface 
{
    public function login($request);
    public function register($request);
}