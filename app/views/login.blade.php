<!DOCTYPE html>
@extends('layouts.master')	

@section('includes')
	@parent
	<?php echo HTML::style('css/login/login.css'); ?>
	{{ HTML::script('js/login/login_ajax.js') }}
	{{ HTML::script('js/login/login.js') }}
@stop

<body  bgcolor="#FFF">
<div id="mainWrap">
	<div id="loggit">
		<h1><i class="fa fa-lock"></i> UBICAME</h1>
		
			<h3 id="mensaje_error" style="display:none" class="label-danger">
			@if( Session::has('msj') )
				Session::get('msj')
			@endif	
			</h3>

            <h3 id="mensaje_inicio">Por Favor <strong>Logeate</strong> o <strong>Registrate</strong></h3>            
        

		<form action="check/login" id="logForm" method="post" class="form-horizontal">
			<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span>
							<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email" autocomplete="off" required>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
							<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" autocomplete="off" required>
						</div>
					</div>
				</div>
				<div class="form-group formSubmit">
					<div class="col-sm-7">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="remember" checked autocomplete="off"> Mantener activa la session
							</label>
						</div>
					</div>
					<div class="col-sm-5 submitWrap">
						<button type="button" id="btnIniciar" class="btn btn-primary btn-lg">Iniciar</button>				
					</div>
				</div>					
				<div class="load" align="center" style="display:none"><i class="fa fa-spinner fa-spin fa-3x"></i></div>	
			</div>

			<div class="col-md-6">						
			    <div class="sp"><img src="{{ asset('img/login/facebook.png') }}" /><i>Iniciar Facebook</i><div class="clear"></div></div>
			    <div class="sp1"><img src="{{ asset('img/login/twitter.png') }}" /><i>Iniciar Twitter</i><div class="clear"></div></div>
			    <div class="sp2"><img src="{{ asset('img/login/gplus.png') }}" /><i>Iniciar Google+</i><div class="clear"></div></div>
			</div>
			</div>	
			<div class="form-group formNotice">
				<div class="col-xs-12">
					<p class="text-center">No tienes cuenta? <span>Registrate Ahora</span></p>
				</div>
			</div>
		</form>
		<form action="check/create" id="regForm" method="post" class="form-horizontal">
			<div class="form-group">
				<div class="col-xs-12">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span>
						<input type="email" name="r_email" id="r_email" class="form-control input-lg" placeholder="Email" autocomplete="off">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
						<input type="password" name="r_password" id="r_password" class="form-control input-lg" placeholder="Password" autocomplete="off">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
						<input type="password" id="r_password_c" class="form-control input-lg" placeholder="Confirm Password" autocomplete="off">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-users fa-fw"></i></span>
						<select name="slct_tipo_usuario" id="slct_tipo_usuario" class="form-control input-lg" placeholder="Seleccione" autocomplete="off">
						<option value="">.:: Seleccione Tipo Usuario ::.</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group formSubmit">
				<div class="col-sm-7">
					<div class="checkbox">
						<label>
							<input type="checkbox" autocomplete="off"> Acepto los terminos &amp; condiciones
						</label>
					</div>
				</div>
				<div class="col-sm-5 submitWrap">
					<button type="button" id="btnRegistrar" class="btn btn-success btn-lg">Registrar</button>
				</div>
			</div>
			<div class="load2" align="center" style="display:none"><i class="fa fa-spinner fa-spin fa-3x"></i></div>
			<div class="form-group formNotice">
				<div class="col-xs-12">
					<p class="hasAccount text-center">Realmente tienes una cuenta? <span>Logeate aquí</span></p>
				</div>
			</div>
		</form>
	</div>
</div>
</body>