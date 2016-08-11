var Roles={
    AgregarEditarRol:function(AE){
        var datos=$("#form_roles").serialize().split("txt_").join("").split("slct_").join("");
        var accion="roles/crear";
        if(AE==1){
            accion="roles/editar";
        }

        $.ajax({
            url         : accion,
            type        : 'POST',
            cache       : false,
            dataType    : 'json',
            data        : datos,
            beforeSend : function() {                
                $("body").append('<div class="overlay"></div><div class="loading-img"></div>');
            },
            success : function(obj) {                
                $(".overlay,.loading-img").remove();
                if(obj.rst==1){
                    $('#t_roles').dataTable().fnDestroy();

                    Roles.CargarRoles(activarTabla);
                    $("#msj").html('<div class="alert alert-dismissable alert-success">'+
                                        '<i class="fa fa-check"></i>'+
                                        '<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>'+
                                        '<b>'+obj.msj+'</b>'+
                                    '</div>');
                    $('#rolModal .modal-footer [data-dismiss="modal"]').click();
                }
                else{ 
                    $.each(obj.msj,function(index,datos){                        
                        $("#error_"+index).attr("data-original-title",datos);
                        $('#error_'+index).css('display','');                                         
                    });     
                }
            },
            error: function(){
                $(".overlay,.loading-img").remove();
                $("#msj").html('<div class="alert alert-dismissable alert-danger">'+
                                        '<i class="fa fa-ban"></i>'+
                                        '<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>'+
                                        '<b>Ocurrio una interrupción en el proceso,Favor de intentar nuevamente. Si el problema persiste favor de comunicarse a ubicame@puedesencontrar.com</b>'+
                                    '</div>');
            }
        });
    },
    EliminarRol:function(id){
        $("#form_roles").append("<input type='hidden' value='"+id+"' name='id'>");
        var datos=$("#form_roles").serialize().split("txt_").join("").split("slct_").join("");
        $.ajax({
            url         : 'roles/eliminar',
            type        : 'POST',
            cache       : false,
            dataType    : 'json',
            data        : datos,
            beforeSend : function() {                
                $("body").append('<div class="overlay"></div><div class="loading-img"></div>');
            },
            success : function(obj) {                
                $(".overlay,.loading-img").remove();
                if(obj.rst==1){
                    $('#t_roles').dataTable().fnDestroy();

                    Roles.CargarRoles(activarTabla);
                    $("#msj").html('<div class="alert alert-dismissable alert-info">'+
                                        '<i class="fa fa-info"></i>'+
                                        '<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>'+
                                        '<b>'+obj.msj+'</b>'+
                                    '</div>');
                    $('#rolModal .modal-footer [data-dismiss="modal"]').click();
                }
                else{ 
                    $.each(obj.msj,function(index,datos){                        
                        $("#error_"+index).attr("data-original-title",datos);
                        $('#error_'+index).css('display','');                                         
                    });     
                }
            },
            error: function(){
                $(".overlay,.loading-img").remove();
                $("#msj").html('<div class="alert alert-dismissable alert-danger">'+
                                        '<i class="fa fa-ban"></i>'+
                                        '<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>'+
                                        '<b>Ocurrio una interrupción en el proceso,Favor de intentar nuevamente. Si el problema persiste favor de comunicarse a ubicame@puedesencontrar.com</b>'+
                                    '</div>');
            }
        });
    },
    CargarRoles:function(evento){
        $.ajax({
            url         : 'roles/cargar',
            type        : 'POST',
            cache       : false,
            dataType    : 'json',
            beforeSend : function() {                
                
            },
            success : function(obj) {
                var html="";
                var estadohtml="";
                if(obj.rst==1){                    
                    $.each(obj.datos,function(index,data){
                        estadohtml='<span id="'+data.id+'" class="label label-danger">Inactivo</span>';
                        if(data.estado==1){
                            estadohtml='<span id="'+data.id+'" class="label label-success">Activo</span>';
                        }

                        html+="<tr>"+
                            "<td id='descripcion_"+data.id+"'>"+data.descripcion+"</td>"+
                            "<td id='estado_"+data.id+"' data-estado='"+data.estado+"'>"+estadohtml+"</td>"+
                            '<td><a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#rolModal" data-id="'+data.id+'" data-titulo="Editar"><i class="fa fa-edit"></i>Edit</a>'+
                            '<a onClick="Eliminar('+data.id+');" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>Delete</a></td>';
                        html+="</tr>";
                    });                    
                }      
                $("#tb_roles").html(html); 
                evento();  
            },
            error: function(){
            }
        });
    }
}