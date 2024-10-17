<?php

namespace Modules\Website\GeneralModule\Repositories;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Modules\Website\GeneralModule\Entities\User;
use Modules\Website\GeneralModule\Transformers\UserResource;
use Modules\Website\GeneralModule\Repositories\AuthRepositoryInterface;

class AuthRepository implements AuthRepositoryInterface
{
    public function login($request)
    {
        $credentials = $request->only(['email', 'password']);
        $item = User::query()->where('email', $credentials['email'])->first();
        if (!$item['access_token'] = Auth::attempt($credentials, true)) throw new \Exception('The email or password you entered is invalid.', 401);
        return new UserResource($item);
    }

    public function register($request)
    {
        DB::beginTransaction();
        $model = User::query()->create($request->validated());
        DB::commit();
        return 'Account created successfully';
    }
}