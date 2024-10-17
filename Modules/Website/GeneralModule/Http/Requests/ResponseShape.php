<?php

namespace Modules\Website\GeneralModule\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Validation\ValidationException;
use F9Web\ApiResponseHelpers;

class ResponseShape extends FormRequest
{
    use ApiResponseHelpers;

    public function __construct()
    {
        $this->setDefaultSuccessResponse([]);
    }
    protected function failedValidation(Validator $validator)
    {
        if (request()->wantsJson()) {
            $response = $this->respondFailedValidation($validator->errors()->first());
            throw (new ValidationException($validator, $response))->status(422);
        } else {
            throw (new ValidationException($validator))->errorBag($this->errorBag);
        }
    }

    public function getModelId($id = 4)
    {
        return $this->segment($id);
    }
}
