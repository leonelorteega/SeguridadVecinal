<?php
use Illuminate\Support\Facades\Paginator;


class Blog extends Eloquent{

    protected $table = 'blog';
  
    public $timestamps = false;

}
