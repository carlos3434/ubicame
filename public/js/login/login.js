$(document).ready(function() {		
	$('.formNotice span').click(function() {
		$("#logForm").toggle();
		$("#regForm").toggle();
	});

	Login.CargarTipoUsuarios();
	$("#btnIniciar").click(IniciarSession);
	$("#btnRegistrar").click(RegistrarUsuario);
});

IniciarSession=function(){
	if($.trim($("#email").val())==''){
		MostrarMensaje("Ingrese su <strong>Email</strong>");
	}
	else if($.trim($("#password").val())==''){
		MostrarMensaje("Ingrese su <strong>Password</strong>");
	}
	else{
		Login.IniciarLogin();	
	}
}

RegistrarUsuario=function(){
	var expr = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
	if($.trim($("#r_email").val())==''){
		MostrarMensaje("Ingrese su <strong>Email</strong>");
	}
	else if(!expr.test( $.trim($("#r_email").val()) )){
		MostrarMensaje("<strong>Email</strong> inválido");
	}
	else if($.trim($("#r_password").val())==''){
		MostrarMensaje("Ingrese su <strong>Password</strong>");
	}
	else if($.trim($("#r_password_c").val())==''){
		MostrarMensaje("Ingrese su <strong>Password</strong> de confirmación");
	}
	else if($.trim($("#r_password").val())!=$.trim($("#r_password_c").val())){
		MostrarMensaje("<strong>Passwords</strong> no coinciden");
	}
	else if($.trim($("#slct_tipo_usuario").val())==''){
		MostrarMensaje("Seleccione <strong>Tipo de Usuario</strong>");
	}
	else{
		Login.RegistrarUsuario();	
	}	
}

MostrarMensaje=function(msj){

	$("#mensaje_error").html(msj);

    $("#mensaje_inicio").fadeOut(1500, function()
    {
		$("#mensaje_error").fadeIn(1500,function()
		{
	    	$("#mensaje_error").fadeOut(6000,function()
	    	{
	    		$("#mensaje_inicio").fadeIn(1500);
	    		$("#mensaje_error").attr("class","label-danger");
	    	});	    	
    	});
	}); 
}