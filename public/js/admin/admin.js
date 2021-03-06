$(document).ready(function() {	
    Roles.CargarRoles(activarTabla);
});

$('#rolModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // captura al boton
  var titulo = button.data('titulo') // extrae del atributo data-
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this) //captura el modal
  modal.find('.modal-title').text(titulo+' Rol')
  $('#form_roles [data-toggle="tooltip"]').css("display","none");
  $("#form_roles input[type='hidden']").remove();

  	if(titulo=='Nuevo'){
  		modal.find('.modal-footer .btn-primary').text('Guardar');
  		modal.find('.modal-footer .btn-primary').attr('onClick','Agregar();');
  		$('#form_roles #slct_estado').val(1); 
  		$('#form_roles #txt_descripcion').focus();  		
	}
	else{
		modal.find('.modal-footer .btn-primary').text('Actualizar');
		modal.find('.modal-footer .btn-primary').attr('onClick','Editar();');
		$('#form_roles #txt_descripcion').val( $('#t_roles #descripcion_'+button.data('id') ).text() );
		$('#form_roles #slct_estado').val( $('#t_roles #estado_'+button.data('id') ).attr("data-estado") );
		$("#form_roles").append("<input type='hidden' value='"+button.data('id')+"' name='id'>");
	}

});

$('#rolModal').on('hide.bs.modal', function (event) {
  var modal = $(this) //captura el modal
  modal.find('.modal-body input').val('') // busca un input para copiarle texto
});

activarTabla=function(){
	$("#t_roles").dataTable(); // inicializo el datatable    
}

Editar=function(){
	if(validaRoles()){
		Roles.AgregarEditarRol(1);
	}
}

Eliminar=function(id){
	if(confirm("Desea eliminar el registro seleccionado")){
		Roles.EliminarRol(id);
	}
}

Agregar=function(){
	if(validaRoles()){
		Roles.AgregarEditarRol(0);
	}
}

validaRoles=function(){
	$('#form_roles [data-toggle="tooltip"]').css("display","none");
	var a=new Array();
	a[0]=valida("txt","descripcion","");
	var rpta=true;

	for(i=0;i<a.length;i++){
		if(a[i]==false){
			rpta=false;
			break;
		}
	}
	return rpta;
}

valida=function(inicial,id,v_default){
	var texto="Seleccione";
	if(inicial=="txt"){
		texto="Ingrese"
	}

	if( $.trim($("#"+inicial+"_"+id).val())==v_default ){
		$('#error_'+id).attr('data-original-title',texto+' '+id);
		$('#error_'+id).css('display','');
		return false;
	}	
}