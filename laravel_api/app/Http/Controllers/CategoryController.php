<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function get_all(Request $req) {
    	$categories = Category::all();
    	return $categories;
    }
}
