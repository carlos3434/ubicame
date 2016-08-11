<!DOCTYPE html>
@extends('layouts.master')  

@section('includes')
    @parent
    <?php echo HTML::style('//code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css'); ?>
    <?php echo HTML::style('lib/datatables-1.10.4/media/css/dataTables.bootstrap.css'); ?>
    <?php echo HTML::style('css/admin/admin.css'); ?>
    {{ HTML::script('lib/datatables-1.10.4/media/js/jquery.dataTables.js') }}
    {{ HTML::script('lib/datatables-1.10.4/media/js/dataTables.bootstrap.js') }}
    {{ HTML::script('js/admin/app.js') }}
    {{ HTML::script('js/admin/demo.js') }}
    {{ HTML::script('js/admin/roles_ajax.js') }}
    {{ HTML::script('js/admin/admin.js') }}

@stop
    <body class="skin-blue">
    <div id="msj" class="msjAlert"> </div>
        @include( 'layouts.admin_head' )

        <div class="wrapper row-offcanvas row-offcanvas-left">
            @include( 'layouts.admin_left' )

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Mantenimiento de Roles
                        <small> </small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
                        <li><a href="#">Mantenimientos</a></li>
                        <li class="active">Mantanimiento de Roles</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">                
                            <!-- Inicia contenido -->
                            <div class="box">                            
                                <div class="box-header">                                    
                                    <h3 class="box-title">Filtros</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="t_roles" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Descripcion</th>
                                                <th>Estado</th>
                                                <th> [ ] </th>
                                            </tr>
                                        </thead>
                                        <tbody id="tb_roles">                                                                                  
                                            
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Descripcion</th>
                                                <th>Estado</th>
                                                <th> [ ] </th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <a class='btn btn-primary btn-sm' class="btn btn-primary" 
                                    data-toggle="modal" data-target="#rolModal" data-titulo="Nuevo"><i class="fa fa-plus"></i>Agregar Rol</a>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->x
                            <!-- Finaliza contenido -->
                        </div>
                    </div>

                </section><!-- /.content -->
            </aside><!-- /.right-side --> 

        </div><!-- ./wrapper -->

        @include( 'admin.form.rol' ) 
    </body>
