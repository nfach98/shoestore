<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Shoes;

class ShoesController extends Controller
{
    public function get_shoes(Request $request) {
        $shoes = Shoes::select("shoes.id", "shoes.id_category", "categories.name AS name_category", "shoes.title", "shoes.subtitle", "shoes.price", "shoes.discount", "shoes.description", DB::raw("(SELECT image FROM images WHERE shoes.id = images.id_shoes LIMIT 1) AS image"), "shoes.created_at")
    	->join('categories', 'shoes.id_category', '=', 'categories.id')
        ->with('colorways', 'colorways.sizes', 'colorways.images')
        ->with('sizes', 'images');

        if ($request->get('search')) {
            $shoes = $shoes->where('title', 'like', '%' . $request->get('search') . '%');
        }

        return response()->json([
            'shoes' => $shoes->paginate(12)
        ]);
    }

    public function get_shoes_detail(Request $request) {
        if ($request->get('id')) {
            $shoes = Shoes::select("shoes.id", "shoes.id_category", "categories.name AS name_category", "shoes.title", "shoes.subtitle", "shoes.price", "shoes.discount", "shoes.description", "shoes.created_at")
            ->where('shoes.id', $request->get('id'))
            ->join('categories', 'shoes.id_category', '=', 'categories.id')
            ->with('colorways', 'colorways.sizes', 'colorways.images')
            ->with('sizes', 'images')
            ->first();

            return response()->json([
                'shoes' => $shoes,
                'message' => 'success'
            ], 200);
        }

        return response()->json([
            'message' => 'error: id is empty'
        ], 500);
    }
}
