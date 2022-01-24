<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Colorway extends Model
{
    use HasFactory;
    protected $table = "colorways";
	public $timestamps = false;
	public $incrementing = false;

	public function shoes()
    {
        return $this->belongsTo('App\Models\Shoes');
    }

    public function sizes()
    {
        return $this->hasMany('App\Models\Size', 'id_colorway');
    }

    public function images()
    {
        return $this->hasMany('App\Models\Image', 'id_colorway');
    }
}
