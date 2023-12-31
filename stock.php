<?php

require_once ("session.php");
/* Connect To Database*/
require_once("config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once("config/conexion.php"); //Contiene funcion que conecta a la base de datos

require_once ("obtener_id.php");



$active_productos = "active";
$title = "Inventario | Borgatta Ingeniería";
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<?php include("head.php"); ?>
</head>

<body style="background-color: #000000;">
	<?php
	include("navbar.php");
	?>

	<div class="container">

		<div class="panel" style="border-color: #000000; border-radius: 10px;">
			<div class="panel-heading" style="background-color: #454955; border-color: #000000;">
				<?php
				// Supongamos que el user_id 1 tiene permisos para ver el botón de agregar
				if ($user_id == 1) {
					echo '<div class="btn-group pull-right" style="background-color: #454955; border-color: #000000;">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#nuevoProducto" >
                <span class="glyphicon glyphicon-plus"></span> Agregar
            </button>
          </div>';
				}
				?>
				<h4 style="color: #FFFFFF;"><i class='glyphicon glyphicon-search'></i> Consultar inventario</h4>
			</div>
			<div class="panel-body" style="background-color: #7e7f83; border-color: #d9c5b2;">

				<?php
				include("modal/registro_productos.php");
				include("modal/editar_productos.php");
				?>
				<form class="form-horizontal" role="form" id="datos">


					<div class="row">
						<div class='col-md-4' style="color: #FFFFFF">
							<label>Filtrar por código o nombre</label>
							<input type="text" class="form-control" id="q" placeholder="Código o nombre del producto"
								onkeyup='load(1);'>
						</div>

						<div class='col-md-4' style="color: #FFFFFF">
							<label>Filtrar por categoría</label>
							<select class='form-control' name='id_categoria' id='id_categoria' onchange="load(1);">
								<option value="">Selecciona una categoría</option>
								<?php
								$query_categoria = mysqli_query($con, "select * from categorias order by nombre_categoria");
								while ($rw = mysqli_fetch_array($query_categoria)) {
									?>
									<option value="<?php echo $rw['id_categoria']; ?>">
										<?php echo $rw['nombre_categoria']; ?>
									</option>
									<?php
								}
								?>
							</select>
						</div>

						<div class='col-md-12 text-center'>
							<span id="loader"></span>
						</div>

					</div>

					<hr style="border-color: #000000;">

					<div class='row-fluid' style="color: #FFFFFF;">
						<div id="resultados"></div><!-- Carga los datos ajax -->
					</div>

					<div class='row' style="color: #FFFFFF;">
						<div class='outer_div'></div><!-- Carga los datos ajax -->
					</div>

				</form>


			</div>
		</div>

	</div><!-- cierre container-->

	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/productos.js"></script>
</body>

</html>
<script>
	function eliminar(id) {
		var q = $("#q").val();
		var id_categoria = $("#id_categoria").val();
		$.ajax({
			type: "GET",
			url: "./ajax/buscar_productos.php",
			data: "id=" + id, "q": q + "id_categoria=" + id_categoria,
			beforeSend: function (objeto) {
				$("#resultados").html("Mensaje: Cargando...");
			},
			success: function (datos) {
				$("#resultados").html(datos);
				load(1);
			}
		});
	}

	$(document).ready(function () {

		<?php
		if (isset($_GET['delete'])) {
			?>
			eliminar(<?php echo intval($_GET['delete']) ?>);
			<?php
		}

		?>
	});

	$("#guardar_producto").submit(function (event) {
		event.preventDefault(); // Evita que el formulario se envíe automáticamente

		// Crea un objeto FormData para enviar datos que incluyen archivos
		var formData = new FormData(this);

		$('#guardar_datos').attr("disabled", true);

		$.ajax({
			type: "POST",
			url: "ajax/nuevo_producto.php",
			data: formData,
			contentType: false, // Importante: no configurar el tipo de contenido
			processData: false, // Importante: no procesar los datos
			cache: false, // Importante: deshabilitar el caché
			beforeSend: function (objeto) {
				$("#resultados_ajax_productos").html("Mensaje: Cargando...");
			},
			success: function (datos) {
				console.log(datos); // Agrega esto para depurar
				$("#resultados_ajax_productos").html(datos);
				$('#guardar_datos').attr("disabled", false);
				load(1);
			},
			error: function (jqXHR, textStatus, errorThrown) {
				console.log("Error en la petición AJAX: " + textStatus + " - " + errorThrown);
			}
		});
	});

</script>