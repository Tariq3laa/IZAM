<?php

namespace Modules\Website\GeneralModule\Transformers;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    public function toArray($request)
    {
        $method = request()->route()->getActionMethod();
        $result = [
            'id'            => $this->id,
            'name'          => $this->name,
            'email'         => $this->email,
        ];
        if ($method == 'login' || $method == 'resetPassword') $result['access_token'] = $this->access_token;
        return $result;
    }
}
