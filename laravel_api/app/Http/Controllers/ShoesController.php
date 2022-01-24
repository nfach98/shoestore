<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Shoes;
use Validator;

class ShoesController extends Controller
{
    public function get_all(Request $req) {
    	$page = is_null($req->page) ? 1 : $req->page;
    	$limit = 12;
    	$sort = is_null($req->sort) ? "shoes.created_at" : $req->sort;

    	$shoes = Shoes::select("shoes.id", "shoes.id_category", "categories.name AS name_category", "shoes.title", "shoes.subtitle", "shoes.price", "shoes.discount", "shoes.description", DB::raw("(SELECT image FROM images WHERE shoes.id = images.id_shoes LIMIT 1) AS image"), "shoes.created_at")
    	->join('categories', 'shoes.id_category', '=', 'categories.id')
        ->with('colorways', 'colorways.sizes', 'colorways.images')
        ->with('sizes', 'images')
    	->skip(($page - 1) * $limit)
    	->take($limit)
    	->orderByRaw($sort)
    	->get();

    	return $shoes;
    }

    public function get_detail(Request $req) {
    	$validator = Validator::make($req->all(), [
            'id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);            
        }

		$id = $req->id;

    	$shoes = Shoes::select("shoes.id", "shoes.id_category", "categories.name AS name_category", "shoes.title", "shoes.subtitle", "shoes.price", "shoes.discount", "shoes.description", "shoes.created_at")
    	->join('categories', 'shoes.id_category', '=', 'categories.id')
    	->where('shoes.id', $id)
    	->with('colorways', 'colorways.sizes', 'colorways.images')
    	->with('sizes', 'images')
    	->first();

    	return $shoes;
    }
}
