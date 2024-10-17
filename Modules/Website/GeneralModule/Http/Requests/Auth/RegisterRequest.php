<?php

namespace Modules\Website\GeneralModule\Http\Requests\Auth;

use Modules\Website\GeneralModule\Http\Requests\ResponseShape;

class RegisterRequest extends ResponseShape
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'name'          => 'required|min:2',
            'email'         => 'required|email:rfc,dns|unique:users,email',
            'password'      => 'required|confirmed|min:6',
        ];
    }
}
