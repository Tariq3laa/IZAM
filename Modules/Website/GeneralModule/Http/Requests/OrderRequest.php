<?php

namespace Modules\Website\GeneralModule\Http\Requests;

class OrderRequest extends ResponseShape
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'products'                      => 'required|array',
            'products.*.product_id'         => 'required|exists:products,id',
            'products.*.quantity'           => 'required|integer|min:1',
            'products.*.price'              => 'required|numeric|min:1'
        ];
    }

    public function messages()
    {
        return [
            'products.*.product_id.required'    => 'The product ID is required.',
            'products.*.product_id.exists'      => 'The selected product does not exist.',
            'products.*.quantity.required'      => 'The quantity is required.',
            'products.*.quantity.integer'       => 'The quantity must be an integer.',
            'products.*.quantity.min'           => 'The quantity must be at least 1.',
            'products.*.price.required'         => 'The price is required.',
            'products.*.price.integer'          => 'The price must be numeric value.',
            'products.*.price.min'              => 'The price must be at least 1.',
        ];
    }
}
