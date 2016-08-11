<?php

class RolesController extends BaseController {

	public function __construct()
	{
		$this->beforeFilter('auth'); // bloqueo de acceso
	}

	public function postCargar()
	{
		if(Request::ajax())
		{
			$Roles=	DB::table('roles')
						->select('id','descripcion','estado')
						->orderBy('id', 'desc')
						->get();
			return Response::json(array('rst'=>1,'datos'=>$Roles));
		}
	}

	public function postCrear()
	{
		if(Request::ajax())
		{
			$reglas = array(
				'descripcion' 		=> 'required|regex:/^([a-zA-Z .,ñÑÁÉÍÓÚáéíóú]{2,60})$/i',
			);

			$mensaje= array(
				'required'	=> ':attribute Es requerido',
				'regex'		=> ':attribute Solo debe ser Texto',
			);

	    	$validator = Validator::make(Input::all(), $reglas,$mensaje);

		    if ($validator->fails())
		    {
		        return Response::json(array(
						'rst'=>2,
						'msj'=>$validator->messages(),
				));	        
		    }

			$roles = new Rol;
		    $roles->descripcion = Input::get('descripcion');
	        $roles->estado = Input::get('estado');
	        $roles->save();

	        	return Response::json(array(
						'rst'=>1,
						'msj'=>'Registro realizado correctamente',
				));	
		}

	}

	public function postEditar()
	{
		if(Request::ajax())
		{
			$reglas = array(
				'descripcion' 		=> 'required|regex:/^([a-zA-Z .,ñÑÁÉÍÓÚáéíóú]{2,60})$/i',
			);

			$mensaje= array(
				'required'	=> ':attribute Es requerido',
				'regex'		=> ':attribute Solo debe ser Texto',
			);

	    	$validator = Validator::make(Input::all(), $reglas,$mensaje);

		    if ($validator->fails())
		    {
		        return Response::json(array(
						'rst'=>2,
						'msj'=>$validator->messages(),
				));	        
		    }
		    
			$roles = Rol::find(Input::get('id'));
		    $roles->descripcion = Input::get('descripcion');
	        $roles->estado = Input::get('estado');
	        $roles->save();	        

	        	return Response::json(array(
						'rst'=>1,
						'msj'=>'Registro actualizado correctamente',
				));	
		}
	}

	public function postEliminar()
	{
		if(Request::ajax())
		{		    
			$roles = Rol::find(Input::get('id'));
		    $roles->delete();	        

	        	return Response::json(array(
						'rst'=>1,
						'msj'=>'Registro eliminado correctamente',
				));	
		}
	}
}
?>