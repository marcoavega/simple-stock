<?php
session_start();
if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
    header("location: login.php");
    exit;
}

/* Connect To Database*/
require_once("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
require_once("config/conexion.php");//Contiene funcion que conecta a la base de datos
$active_usuarios = "active";
$title = "Usuarios | Borgatta Ingeniería";

// Obtener el ID de permisos del usuario actual
$user_id = $_SESSION['user_id'];
// Consulta SQL para obtener el ID de permisos del usuario actual
$sql = "SELECT id_permisos FROM users WHERE user_id = $user_id";
$result = mysqli_query($con, $sql);
if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $user_permisos = $row['id_permisos'];
    // Resto de tu código ...
} else {
    // Manejar el caso en el que no se pudo obtener el ID de permisos
    echo "Error: No se pudo obtener el ID de permisos del usuario.";
}
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
    <?php if ($user_id == 1) : ?>
        <div class="panel" style="border-color: #000000; border-radius: 10px;">
            <div class="panel-heading"
                 style="background-color: #454955; border-color: #000000;">
                <div class="btn-group pull-right"
                     style="background-color: #454955; border-color: #000000;">
                    <button type='button' class="btn btn-info" data-toggle="modal"
                            data-target="#myModal"><span
                                class="glyphicon glyphicon-plus"></span> Nuevo Usuario
                    </button>
                </div>
                <h4 style="color: #FFFFFF;"><i class='glyphicon glyphicon-search'></i> Buscar Usuarios</h4>
            </div>
            <div class="panel-body"
                 style="background-color: #7e7f83; border-color: #d9c5b2;">
                <?php
                include("modal/registro_usuarios.php");
                include("modal/editar_usuarios.php");
                include("modal/cambiar_password.php");
                ?>
                <form class="form-horizontal" role="form" id="datos_cotizacion">

                    <div class="form-group row" style="color: #FFFFFF">
                        <label for="q" class="col-md-2 control-label">Nombre:</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="q" placeholder="Nombre"
                                   onkeyup='load(1);'>
                        </div>


                        <div class="col-md-3" style="color: #FFFFFF">
                            <button type="button" class="btn btn-default" onclick='load(1);'>
                                <span class="glyphicon glyphicon-search"></span> Buscar</button>
                            <span id="loader"></span>
                        </div>

                    </div>

                </form>
                <div id="resultados" style="color: #FFFFFF;"></div><!-- Carga los datos ajax -->
                <div class='outer_div' style="color: #FFFFFF;"></div><!-- Carga los datos ajax -->

            </div>
        </div>
    <?php else : ?>
        <div class="alert alert-warning">
            <strong>Atención:</strong> No tienes suficientes privilegios. Consulta a tu administrador.
        </div>
    <?php endif; ?>
</div>


<?php
include("footer.php");
?>
<script type="text/javascript" src="js/usuarios.js"></script>
</body>
</html>
<script>
    $( "#guardar_usuario" ).submit(function( event ) {
        $('#guardar_datos').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/nuevo_usuario.php",
            data: parametros,
            beforeSend: function(objeto){
                $("#resultados_ajax").html("Mensaje: Cargando...");
            },
            success: function(datos){
                $("#resultados_ajax").html(datos);
                $('#guardar_datos').attr("disabled", false);
                load(1);
            }
        });
        event.preventDefault();
    })

    $( "#editar_usuario" ).submit(function( event ) {
        $('#actualizar_datos2').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/editar_usuario.php",
            data: parametros,
            beforeSend: function(objeto){
                $("#resultados_ajax2").html("Mensaje: Cargando...");
            },
            success: function(datos){
                $("#resultados_ajax2").html(datos);
                $('#actualizar_datos2').attr("disabled", false);
                load(1);
            }
        });
        event.preventDefault();
    })

    $( "#editar_password" ).submit(function( event ) {
        $('#actualizar_datos3').attr("disabled", true);

        var parametros = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "ajax/editar_password.php",
            data: parametros,
            beforeSend: function(objeto){
                $("#resultados_ajax3").html("Mensaje: Cargando...");
            },
            success: function(datos){
                $("#resultados_ajax3").html(datos);
                $('#actualizar_datos3').attr("disabled", false);
                load(1);
            }
        });
        event.preventDefault();
    })

    function get_user_id(id){
        $("#user_id_mod").val(id);
    }

    function obtener_datos(id){
        var usuario = $("#usuario"+id).val();


        $("#mod_id").val(id);
        $("#user_name2").val(usuario);


    }
</script>
