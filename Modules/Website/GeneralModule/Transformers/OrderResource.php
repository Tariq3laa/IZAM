<?php

namespace Modules\Website\GeneralModule\Transformers;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'                => $this->id,
            'total'             => $this->total,
            'buyer'             => new UserResource($this->buyer),
            'products'          => ProductResource::collection($this->products)
        ];
    }
}
