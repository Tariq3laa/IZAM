<?php

namespace Modules\Website\GeneralModule\Repositories;

use App\Events\OrderPlaced;
use Illuminate\Support\Facades\DB;
use Modules\Website\GeneralModule\Entities\Order;
use Modules\Website\GeneralModule\Transformers\OrderResource;
use Modules\Website\GeneralModule\Repositories\OrderRepositoryInterface;

class OrderRepository implements OrderRepositoryInterface
{
    public function show($id)
    {
        $order = Order::find($id);
        if($order) return new OrderResource($order);
        else throw new \Exception("Order not found.", 404);
    }

    public function store($request)
    {
        DB::beginTransaction();

        $validatedData = $request->validated();

        $order = new Order();

        // Calculate the order total
        $total = $order->calculateTotal($validatedData['products']);
        $order->total = $total;

        // Update product quantities
        $order->updateProductsQuantities($validatedData['products']);

        $order->buyer_id = auth()->user()->id;
        $order->save();

        // Attach products to the order using the new method
        $order->attachProducts($validatedData['products']);

        // Fire event to notify the admin
        event(new OrderPlaced($order)); 

        DB::commit();

        return ['id' => $order->id];
    }
}