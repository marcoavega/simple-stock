<?php
	
	require_once ("session.php");
	/* Connect To Database*/
	require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
	
	require_once ("obtener_id.php");




	$active_categoria="active";
	$title="Categorías | Borgatta Ingeniería";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <?php include("head.php");?>
  </head>
  <body style="background-color: #000000;">
	<?php
	include("navbar.php");
	?>
	
    <div class="container">
	<div class="panel" style="border-color: #000000; border-radius: 10px;">
		<div class="panel-heading" style="background-color: #454955; border-color: #000000;">
		    <div class="btn-group pull-right" style="background-color: #454955; border-color: #000000;">
			<?php
								if ($user_id == 1) {
									echo "<button type='button' class='btn btn-info' data-toggle='modal' data-target='#nuevoCliente'><span class='glyphicon glyphicon-plus'></span> Nueva Categoría</button>";
								}
			?>
				</div>
			<h4 style="color: #FFFFFF;"><i class='glyphicon glyphicon-search'></i> Buscar Categorías</h4>
		</div>
		<div class="panel-body" style="background-color: #7e7f83; border-color: #d9c5b2;">
		
			
			
			<?php
				include("modal/registro_categorias.php");
				include("modal/editar_categorias.php");
			?>
			<form class="form-horizontal" role="form" id="datos_cotizacion">
				
						<div class="form-group row" style="color: #FFFFFF">
							<label for="q" class="col-md-2 control-label">Nombre</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="q" placeholder="Nombre de la categoría" onkeyup='load(1);'>
							</div>
							<div class="col-md-3">
								<button type="button" class="btn btn-default" onclick='load(1);'>
									<span class="glyphicon glyphicon-search" ></span> Buscar</button>
								<span id="loader"></span>
							</div>
							
						</div>
				
				
				
			</form>
				<div id="resultados" style="color: #FFFFFF"></div><!-- Carga los datos ajax -->
				<div class='outer_div' style="color: #FFFFFF"></div><!-- Carga los datos ajax -->
			
		
	
			
			
			
  </div>
</div>
		 
	</div>
	
	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/categorias.js"></script>
  </body>
</html>
