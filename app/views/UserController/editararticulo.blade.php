@extends('layouts/admin')

@section('head')
<title>Editar Historia</title>
<meta name='description' content='Editar Historia'>
<meta name='keywords' content='palabras, clave'>
<meta name='robots' content='noindex,nofollow'>
@stop

@section('content')

<h1>Bienvenido {{Auth::user()->get()->nombre}}</h1>

{{Session::get("message")}}

<h3>Editar artículo - </h3>
{{ Form::model($blog,array('url' => '/updatearticulo/'.$blog->id, 'method' => 'PUT', 'class' => 'form-horizontal'))}}

            <div class="form-group">
                {{Form::label("Título:")}}
                 {{ Form::text('titulo', Input::old('titulo'), array('class' => 'form-control', 'placeholder'=>'Titulo', 'id' =>'titulo')) }}
                <div class="bg-danger">{{$errors->first('titulo')}}</div>
            </div>

            <div class="form-group">
                {{Form::label("Descripción:")}}
                {{ Form::textarea('descripcion', Input::old('descripcion'), array('class' => 'form-control', 'placeholder'=>'Descripcion', 'id' =>'descripcion')) }}
                <div class="bg-danger">{{$errors->first('descripcion')}}</div>
            </div>

            <div class="form-group">

                {{Form::label("Nueva imagen:")}}
                {{Form::file("src")}}
                <div class="bg-danger">{{$errors->first('src')}}</div>
            </div>

             <div class="form-group">
                {{Form::label("Direccion de correo para contactarte:")}}
                {{ Form::input('href', Input::old('href'), array('class' => 'form-control', 'placeholder'=>'Direccion de contacto', 'id' =>'href')) }}
                <div class="bg-danger">{{$errors->first('href')}}</div>
            </div>

            <!--botones-->
              <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                      <div class="pull-right">
                          <button type="submit" class="btn btn-success">Guardar</button>
                          <a class="btn btn-danger" href="{{ URL::to('verarticulos')}}">Cancelar</a>
                      </div>
                  </div>
              </div>

{{Form::close()}}
@stop
