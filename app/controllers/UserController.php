<?php
class UserController extends BaseController {
 public function creararticulo()
    {
        return View::make('UserController.creararticulo');
    }
public function verarticulos()
    {
        $conn = DB::connection("mysql");
        if (isset($_GET["buscar"]))
        {
         $buscar = htmlspecialchars(Input::get("buscar"));
         $paginacion = $conn
                 ->table("blog")
                 ->where("titulo", "LIKE", '%'.$buscar.'%')
                 ->orwhere("descripcion", "LIKE", '%'.$buscar.'%')
                 ->whereIn("ide_usuario", array(Auth::user()->get()->id))
                 ->orderby("id", "desc")
                 ->paginate(5);
        }
        else
        {
        $paginacion = $conn
                ->table("blog")
                ->whereIn("ide_usuario", array(Auth::user()->get()->ide_usuario))
                ->orderby("ide_usuario", "desc")
                ->paginate(5);
        }
        return View::make('UserController.verarticulos', array('paginacion' => $paginacion));
    }
/*public function editararticulo($id)
    {

        $conn = DB::connection("mysql");
        $sql = "SELECT * FROM blog WHERE id=? AND ide_usuario=?";
        $ide_usuario = Auth::user()->get()->ide_usuario;
        $fila = $conn->select($sql, array($id , $ide_usuario));
        return View::make('UserController.editararticulo', array('fila' => $fila, 'id' => $id));
    }
public function eliminararticulo($id)
    {
        $conn = DB::connection("mysql");
        $sql = "SELECT id, titulo FROM blog WHERE id=? AND ide_usuario=?";
        $fila = $conn->select($sql, array($id, Auth::user()->get()->ide_usuario));
        return View::make('UserController.eliminararticulo', array('fila' => $fila));
    }*/

    public function getEditBlog($id) {
      $blogs = Blog::find($id);
      $data = [
        'blog' => $blogs,
      ];

      return View::make('UserController/editararticulo', $data);
    }

    public function putUpdateBlog($id) {

      $rules = array(
        'titulo' => 'required:blog,titulo',
        'descripcion' => 'required:blog,descripcion',
        'src' => 'required:blog,src',
        'href' => 'required:blog,href',
        'ide_usuario' => 'required:blog,ide_usuario',

      );

      $attributes = array(
        'titulo' => 'titulo',
        'descripcion' => 'descripcion',
        'src' => 'src',
        'href' => 'href',
        'ide_usuario' => 'ide_usuario',
      );

      $validator = Validator::make(Input::all(), $rules);
      $validator->setAttributeNames($attributes);

      $blogs = Blog::find($id);
      $blogs->titulo = Input::get('titulo');
      $blogs->descripcion = Input::get('descripcion');
      $blogs->src = Input::get('src');
      $blogs->href = Input::get('href');
      $blogs->ide_usuario = Input::get('ide_usuario');

      //actualizad base de dato
      $blogs->save();
      Session::flash('message', 'El articulo se actualizo correctamente');
      //Si todos se cumplio correctamente redirecciona
      return Redirect::to('verarticulos');

    }
    public function deleteBlog($id) {
      $blogs = Blog::find($id);
      $blogs->delete();
      Session::flash('message','El articulo se elimino correctamente' );
      //Si todos se cumplio correctamente redirecciona
      return Redirect::to('verarticulos');
    }
}
