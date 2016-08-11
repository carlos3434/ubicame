<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
		
		@section('autor')
		<meta name="author" content="Jorge Salcedo (Shevchenko)">
		@show
		
		<link rel="shortcut icon" href="assets/ico/favicon.ico">

		@section('descripcion')
		<meta name="description" content="">
		@show
		<title>
			@section('titulo')
				Ubicame
			@show
		</title>


		@section('includes')
			<?php echo HTML::style('lib/bootstrap-3.3.1/css/bootstrap.min.css'); ?>
			<?php echo HTML::style('lib/font-awesome-4.2.0/css/font-awesome.min.css'); ?>

			<script src="lib/jquery-2.1.3.min.js" type="text/javascript"></script>
			<script src="lib/jquery-ui-1.11.2/jquery-ui.min.js" type="text/javascript"></script>
			<script src="lib/bootstrap-3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
		@show
	</head>		

</html>