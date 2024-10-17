<?php

namespace Modules\Website\GeneralModule\Filters;

use Closure;

class PriceRangePipeline
{
    public function handle($request, Closure $next)
    {
        if (!request()->has('min_price') && !request()->has('max_price')) {
            return $next($request);
        }

        return $next($request)->when(request('min_price'), function ($query1) {
            return $query1->where('price', '>=', request('min_price'));
        })->when(request('max_price'), function ($query2) {
            return $query2->where('price', '<=', request('max_price'));
        });
    }
}
