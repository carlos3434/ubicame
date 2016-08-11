<?php

class LoginController extends BaseController {

	public function postLogin()
	{
		if(Request::ajax())
		{

		$userdata= array(
			'email' => Input::get('email'),
			'password' => Input::get('password'),
		);

			if( Auth::attempt($userdata, Input::get('remember',0)) )
			{
				return Response::json(array(
					'rst'=>'1',
					'estado'=>Auth::user()->estado,
					'msj'=>'Favor de validar su <strong>Email</strong>; Revise su correo Electrónico.',
				));
			}
			else
			{
				return Response::json(array(
					'rst'=>'2',
					'msj'=>'El <strong>Email</strong> y/o la <strong>contraseña</strong> son incorrectos.',
				));
			}

		}

	}

	public function postTipousuario()
	{
		if(Request::ajax())
		{
			$TipoUsuario=	DB::table('tipos_usuarios')
							->select('id','descripcion as nombre')
							->orderBy('descripcion', 'asc')
							->get();
			return Response::json(array('rst'=>1,'datos'=>$TipoUsuario));
		}
	}

	public function postCreate()
	{
		if(Request::ajax())
		{

			$reglas = array(
				'email' 		=> 'required|email|unique:usuarios',
				'password' 		=> 'required|min:6',
			);

			$mensaje= array(
				'required'	=> ':attribute Es requerido',
				'email' 	=> ':attribute No es válido',
				'unique' 	=> ':attribute Existente',
				'min' 		=> ':attribute Debe ser un minimo de :min'
			);

	    	$validator = Validator::make(Input::all(), $reglas,$mensaje);

		    if ($validator->fails())
		    {
		        return Response::json(array(
						'rst'=>2,
						'msj'=>$validator->messages(),
				));	        
		    }

			//si todo esta bien guardamos
			$password = Input::get('password');

			DB::beginTransaction();
			$url_validacion=Hash::make( Input::get('email').$password );

			$usuario = new Usuario;
		    $usuario->email = Input::get('email');
	        $usuario->password = Hash::make($password);
	        $usuario->tipo_usuario_id = Input::get('slct_tipo_usuario');
	        $usuario->estado = 0;
	        $usuario->url_validacion=$url_validacion;
		    $usuario->save();


		    $parametros=array(
		    	'email'		=> Input::get('email'),
		    	'hash'		=> $url_validacion,
		    );

		    try{
		    	Mail::send('emails', $parametros , 
					function($message){
			        $message->to(Input::get('email'),'Administrador')->subject('.::Bienvenido a Ubicame::.');		        
			    	}
			    );

			    DB::commit();
				return Response::json(array(
					'rst'=>1,
					'msj'=>'Se realizó con éxito su registro, <strong>valide su email.</strong>',
				));	
		    }
		    catch(Exception $e){
		    	DB::rollback();
		    	return Response::json(array(
					'rst'=>2,
					'msj'=>array('No se pudo realizar el envio de Email; Favor de verificar su email e intente nuevamente.'),
				));
				throw $e;
		    }
		}
	}

	public function getConfirmacion()
	{
		$email=Input::get('email');
		$hash=Input::get('hash');

		$usuario = DB::table('usuarios')->where('email', $email)->first();
		$msj="Email Inválido a validar";
		if($usuario)
		{	
			if( $usuario->url_validacion == $hash )
			{
				$usu=Usuario::find($usuario->id);
				$usu->estado=1;
				$usu->save();
				$msj="Email Válidado";
			}			
		}		
		return Redirect::to('/')->with('msj',$msj);		
	}

}