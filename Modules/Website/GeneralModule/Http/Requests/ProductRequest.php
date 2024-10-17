<?php

namespace Modules\Website\GeneralModule\Http\Requests;

class ProductRequest extends ResponseShape
{
    public function all($keys = null)
    {
        $data = parent::all($keys);
        $data['product'] =  $this->route('product');
        return $data;
    }

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'product'               => 'nullable|exists:products,id',
            'title'                 => 'required|string|min:2|max:255',
            'description'           => 'nullable|string|min:2',
            'price'                 => 'required|numeric|min:1',
            'quantity'              => 'required|numeric|min:1',
            'categories_ids'        => 'nullable|array',
            'categories_ids.*'      => 'nullable|exists:categories,id'
        ];
    }
}
