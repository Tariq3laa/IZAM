<?php

namespace Modules\Website\GeneralModule\Transformers;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'                => $this->id,
            'title'             => $this->title,
            'price'             => $this->price,
            'quantity'          => $this->quantity,
            'description'       => $this->description,
            'categories'        => CategoryResource::collection($this->categories)
        ];
    }
}
