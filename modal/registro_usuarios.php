<?php
if (isset($con)) {
    ?>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar nuevo usuario
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="guardar_usuario" name="guardar_usuario">
                        <div id="resultados_ajax"></div>

                        <div class="form-group">
                            <label for="user_name" class="col-sm-3 control-label">Usuario</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="user_name" name="user_name"
                                       placeholder="Usuario" pattern="[a-zA-Z0-9]{2,64}"
                                       title="Nombre de usuario (sólo letras y números, 2-64 caracteres)" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="user_password_new" class="col-sm-3 control-label">Contraseña</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="user_password_new"
                                       name="user_password_new" placeholder="Contraseña" pattern=".{6,}"
                                       title="Contraseña (min. 6 caracteres)" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="user_password_repeat" class="col-sm-3 control-label">Repite contraseña</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="user_password_repeat"
                                       name="user_password_repeat" placeholder="Repite contraseña" pattern=".{6,}"
                                       required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="id_permisos" class="col-sm-3 control-label">Permiso de usuario</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="id_permisos" name="id_permisos" required>
                                    <option value="">Selecciona un permiso</option>
                                    <?php
                                    // Consulta SQL para obtener los permisos de la tabla permisos
                                    $sql_permisos = "SELECT id_permisos, nombre_permiso FROM permisos";
                                    $result_permisos = mysqli_query($con, $sql_permisos);

                                    // Genera las opciones del campo select
                                    while ($row_permiso = mysqli_fetch_assoc($result_permisos)) {
                                        $id_permiso = $row_permiso['id_permisos'];
                                        $nombre_permiso = $row_permiso['nombre_permiso'];
                                        echo "<option value='$id_permiso'>$nombre_permiso</option>";
                                    }
                                    ?>
                                </select>
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
    <?php
}
?>
