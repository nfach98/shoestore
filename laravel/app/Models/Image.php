<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;
    protected $table = "images";
	public $timestamps = false;

    public function colorway()
    {
        return $this->belongsTo('App\Models\Colorway');
    }
}
