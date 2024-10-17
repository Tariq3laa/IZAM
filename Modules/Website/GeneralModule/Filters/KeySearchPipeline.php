<?php

namespace Modules\Website\GeneralModule\Filters;

use Closure;

class KeySearchPipeline
{
    public function handle($request, Closure $next)
    {
        if (!request()->has('keyword')) {
            return $next($request);
        }
        $query = $next($request);
        $fields = $query->getModel()->search;
        $keyword = request()->keyword;
        if ($fields && count($fields) && $fields[0]) {
            return $query->orWhere(function ($q) use ($fields, $keyword) {
                $q->where($fields[0], 'LIKE', '%' . $keyword . '%');
                for ($i = 1; $i < count($fields); $i++) {
                    $q->orWhere($fields[$i], 'LIKE', '%' . $keyword . '%');
                }
            });
        } else {
            return $query;
        }
    }
}
