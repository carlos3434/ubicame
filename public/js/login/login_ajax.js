var Login={
    IniciarLogin:function(){
        var datos=$("#logForm").serialize();
        var url_login=$("#logForm").attr("action");
        $.ajax({
            url         : url_login,
            type        : 'POST',
            cache       : false,
            dataType    : 'json',
            data        : datos,
            beforeSend : function() {                
                $(".load").show();   
            },
            success : function(obj) {
                $(".load").hide();
                
                if(obj.rst==1 && obj.estado==1){
                    window.location='admin';
                }
                else if(obj.rst==1){
                    MostrarMensaje(obj.msj);
                }
                else if(obj.rst==2){
                    MostrarMensaje(obj.msj);
                }                
            },
            error: function(){
                $(".load").hide();
            }
        });
    },
    RegistrarUsuario:function(){
        var datos=$("#regForm").serialize().split("r_").join("");
        var url_login=$("#regForm").attr("action");
        $.ajax({
            url         : url_login,
            type        : 'POST',
            cache       : false,
            dataType    : 'json',
            data        : datos,
            beforeSend : function() {                
                $(".load2").show();   
            },
            success : function(obj) {
                $(".load2").hide();
                
                if(obj.rst==1){
                    $("#mensaje_error").attr("class","label-success");
                    MostrarMensaje(obj.msj);
                    $("#regForm input,#regForm select").val('');
                    $("#logForm").fadeIn(2000);
                    $("#regForm").fadeOut(1000);
                }
                else{
                    var pos=0;
                    $.each(obj.msj,function(index,datos){
                        if(pos==0){                        
                        MostrarMensaje(datos);
                        }
                        pos++;
                    });                    
                }
            },
            error: function(){
                $(".load2").hide();
            }
        });
    },
    CargarTipoUsuarios:function(){
        $.ajax({
            url         : 'check/tipousuario',
            type        : 'POST',
            cache       : false,
            dataType    : 'json',
            beforeSend : function() {                
                
            },
            success : function(obj) {
                var html="";
                if(obj.rst==1){
                    html+="<option value=''>.:: Seleccione Tipo Usuario ::.</option>";
                    $.each(obj.datos,function(index,data){
                        html+="<option value='"+data.id+"'>"+data.nombre+"</option>";
                    });
                    $("#slct_tipo_usuario").html(html);
                }               
            },
            error: function(){
            }
        });
    }
}