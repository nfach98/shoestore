<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shoes extends Model
{
    use HasFactory;
    protected $table = "shoes";
	public $timestamps = false;
	public $incrementing = false;

	public function colorways()
    {
        return $this->hasMany('App\Models\Colorway', 'id_shoes');
    }

    public function sizes()
    {
        return $this->hasMany('App\Models\Size', 'id_shoes');
    }

    public function images()
    {
        return $this->hasMany('App\Models\Image', 'id_shoes');
    }
}
