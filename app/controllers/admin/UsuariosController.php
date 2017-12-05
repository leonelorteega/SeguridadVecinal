<?php
class UsuariosController extends \BaseController {

  
    //aca hacemos el metodo para listar usuarios
    
    public function getlist() {
        //

        $usuarios = Usuario::paginate(20);
        $data = [
            'usuarios' => $usuarios,
        ];

        return View::make('admin/usuarios_list', $data);
    }

    
       //para buscar usuarios
    public function getFind() {
        //
        $valor= Input::get('usu_valor');
        $usuarios = Usuario::find_all($valor);
        $data = [

            'usuarios' => $usuarios,
        ];

         return View::make('admin/usuarios_list', $data);
    }    
   
    //para crear usuarios
    
    public function getcreate() {
        
       // $rows = DB::select("");
        
        
        return View::make('admin/usuarios_create');
    }

    
    //para insertar valores a la db usuarios
    
    public function poststore() {
        //
        $rules = array(
            'usu_nombre' => 'required:usuarios,usu_nombre',
            'usu_apellido' => 'required:usuarios,usu_apellido',
            'usu_celular' => 'required| numeric:usuarios,usu_celular', 
            'usu_zona' => 'required:usuarios,usu_zona', 
            'usu_username' => 'required:usuarios,usu_username',
            'usu_clave' => 'required',
            'usu_email' => 'unique:usuarios,usu_email|email',
        );

        $attributes = array(
            'usu_nombre' => 'nombre',
            'usu_apellido' => 'apellido',
            'usu_celular' => 'celular',
            'uso_zona' => 'zona',
            'usu_username' => 'nombre de usuario',
            'usu_clave' => 'clave',
            'usu_email' => 'correo'
        );
        $validator = Validator::make(Input::all(), $rules);
        $validator->setAttributeNames($attributes);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('usuarios/create')
                            ->withErrors($validator)->withInput(Input::all());
        }

        //Se crea una instancia de objeto para ingresar los valores
        //y se guarda
        $usuario = new Usuario();
        $usuario->usu_nombre = Input::get('usu_nombre');
        $usuario->usu_apellido = Input::get('usu_apellido'); 
        $usuario->usu_celular = Input::get('usu_celular');  
        $usuario->usu_zona = Input::get('usu_zona');  
        $usuario->usu_username = Input::get('usu_username');
        $usuario->usu_clave = Input::get('usu_clave');
        $usuario->usu_email = Input::get('usu_email');
      
      
   
        $usuario->save();

        //Se envia un mensaje de tipo flash solo se muestra una vez redireccionado
        //en el caso de actualizar la pagina desaparece
        Session::flash('message','El usuario se guardo correctamente');

        //Si todos se cumplio correctamente redirecciona
        return Redirect::to('usuarios');
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function getedit($id) {
        //
                //Se busca el id y se lo agrega a un objeto
        $usuario = Usuario::find($id);

        $data = [
            'usuario' => $usuario,

        ];
        //Llama a la vista y envia el objeto
        
        
        return View::make('admin/usuarios_edit',$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    
    //para actualizar
    
    public function putUpdate($id) {
        
             $rules = array(
            'usu_nombre' => 'required | unique:usuarios,usu_nombre',
            'usu_apellido' => 'required | unique:usuarios,usu_apellido',
            'usu_celular' => 'required | numeric:usuarios,usu_celular', 
            'usu_zona' => 'required | unique:usuarios,usu_zona', 
            'usu_username' => 'required | unique:usuarios,usu_username',
            'usu_clave' => 'required',
            'usu_email' => 'unique:usuarios,usu_email|email',
        );

        $attributes = array(
            'usu_nombre' => 'nombre',
            'usu_apellido' => 'apellido',
            'usu_celular' => 'celular',
            'uso_zona' => 'zona',
            'usu_username' => 'nombre de usuario',
            'usu_clave' => 'clave',
            'usu_email' => 'correo'
        );
        
        $validator = Validator::make(Input::all(), $rules);
        $validator->setAttributeNames($attributes);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('usuarios/create')
                            ->withErrors($validator)->withInput(Input::all());
        }

        
        $usuario = Usuario::find($id);
        $usuario->usu_nombre = Input::get('usu_nombre');
        $usuario->usu_apellido = Input::get('usu_apellido');
        $usuario->usu_celular = Input::get('usu_celular');
        $usuario->usu_zona = Input::get('usu_zona');
        $usuario->usu_username = Input::get('usu_username');
        $usuario->usu_clave = Input::get('usu_clave');
        $usuario->usu_email = Input::get('usu_email');
       
        $usuario->save();

        //Se envia un mensaje de tipo flash solo se muestra una vez redireccionado
        //en el caso de actualizar la pagina desaparece
        Session::flash('message', 'El usuario se actualizo correctamente');
        //Si todos se cumplio correctamente redirecciona
        return Redirect::to('usuarios');
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function deleteDestroy($id) {
        //
             //Se crea una instalncia del objeto con el id
        //y se elimina
        $usuario = Usuario::find($id);
        $usuario->delete();
        //Se envia un mensaje de tipo flash solo se muestra una vez redireccionado
        //en el caso de actualizar la pagina desaparece
        Session::flash('message','El usuario se elimino correctamente' );
        //Si todos se cumplio correctamente redirecciona
        return Redirect::to('usuarios');
        
    }

}