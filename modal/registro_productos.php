<?php
if (isset($con)) {
	?>
	<!-- Modal -->
	<div class="modal fade" id="nuevoProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar nuevo
						producto</h4>
				</div>

				<div class="modal-body">

					<form class="form-horizontal" method="post" id="guardar_producto" name="guardar_producto"
						enctype="multipart/form-data">
						<div id="resultados_ajax_productos"></div>
						<div class="form-group">
							<label for="codigo" class="col-sm-3 control-label">Código</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="codigo" name="codigo"
									placeholder="Código del producto" required>
							</div>
						</div>

						<div class="form-group">
							<label for="nombre" class="col-sm-3 control-label">Nombre</label>
							<div class="col-sm-8">
								<textarea class="form-control" id="nombre" name="nombre" placeholder="Nombre del producto"
									required maxlength="255"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="descripcion" class="col-sm-3 control-label">Descripción</label>
							<div class="col-sm-8">
								<textarea class="form-control" id="descripcion" name="descripcion" placeholder="Descripcion"
									required maxlength="255"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="categoria" class="col-sm-3 control-label">Categoría</label>
							<div class="col-sm-8">
								<select class='form-control' name='categoria' id='categoria' required>
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
						</div>


						<div class="form-group">
							<label for="imagen" class="col-sm-3 control-label">Imagen del Producto</label>
							<div class="col-sm-8">
								<input type="file" class="form-control" id="imagen" name="imagen" accept="image/*">
							</div>
						</div>


						<div class="form-group">
							<label for="proveedor" class="col-sm-3 control-label">Proveedor</label>
							<div class="col-sm-8">
								<select class='form-control' name='proveedor' id='proveedor' required>
									<option value="">Selecciona un proveedor</option>
									<?php
									$query_proveedor = mysqli_query($con, "select * from proveedores order by nombre_proveedor");
									while ($rw = mysqli_fetch_array($query_proveedor)) {
										?>
										<option value="<?php echo $rw['id_proveedor']; ?>">
											<?php echo $rw['nombre_proveedor']; ?>
										</option>
										<?php
									}
									?>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label for="precio" class="col-sm-3 control-label">Precio</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="precio" name="precio"
									placeholder="Precio del producto" required
									pattern="^[0-9]{1,5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales"
									maxlength="8">
							</div>
						</div>

						<div class="form-group">
							<label for="preciodolares" class="col-sm-3 control-label">Precio en dólares</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="preciodolares" name="preciodolares"
									placeholder="Precio del producto en dólares" required
									pattern="^[0-9]{1,5}(\.[0-9]{0,2})?$" title="Ingresa sólo números con 0 ó 2 decimales"
									maxlength="8">
							</div>
						</div>

						<div class="form-group">
							<label for="stock" class="col-sm-3 control-label">Stock</label>
							<div class="col-sm-8">
								<input type="number" min="0" class="form-control" id="stock" name="stock"
									placeholder="Inventario inicial" required maxlength="8">
							</div>
						</div>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="submit" class="btn btn-primary" id="guardar_datos">Guardar datos</button>
				</div>
				</form>
			</div>
		</div>
	</div>


    <!-- Agrega este script JavaScript al final de tu código PHP -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Obtiene una referencia al formulario
            var formulario = document.getElementById('guardar_producto');

            // Agrega un manejador de eventos para el envío del formulario
            formulario.addEventListener('submit', function(e) {
                e.preventDefault(); // Evita el envío predeterminado del formulario

                // Realiza aquí tu lógica para enviar los datos, por ejemplo, mediante AJAX

                // Limpia el formulario
                formulario.reset();
            });
        });
    </script>


	<?php
}
?>