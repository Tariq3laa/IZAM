<?php

namespace Modules\Website\GeneralModule\Http\Requests\Auth;

use Modules\Website\GeneralModule\Http\Requests\ResponseShape;

class LoginRequest extends ResponseShape
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'email'         => 'required|email:rfc,dns|exists:users,email',
            'password'      => 'required|min:6'
        ];
    }
}
