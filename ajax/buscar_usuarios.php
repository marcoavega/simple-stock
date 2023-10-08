<?php

/* Connect To Database*/
require_once("../config/db.php");//Contiene las variables de configuración para conectar a la base de datos
require_once("../config/conexion.php");//Contiene la función que conecta a la base de datos
include('is_logged.php');//Archivo que verifica si el usuario que intenta acceder a la URL está logueado

$action = (isset($_REQUEST['action']) && $_REQUEST['action'] != NULL) ? $_REQUEST['action'] : '';

if (isset($_GET['id'])) {
    $user_id = intval($_GET['id']);
    $query = mysqli_query($con, "SELECT u.user_id, u.user_name, u.date_added, p.nombre_permiso
                                FROM users u
                                INNER JOIN permisos p ON u.id_permiso = p.id_permiso
                                WHERE u.user_id = '".$user_id."'");
    $rw_user = mysqli_fetch_array($query);
    $count = $rw_user['user_id'];

    if ($user_id != 1) {
        if ($delete1 = mysqli_query($con, "DELETE FROM users WHERE user_id = '".$user_id."'")) {
?>
<div class="alert alert-success alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>Aviso!</strong> Datos eliminados exitosamente.
</div>
<?php
        } else {
?>
<div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>Error!</strong> Lo siento, algo ha salido mal. Intenta nuevamente.
</div>
<?php
        }
    } else {
?>
<div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>Error!</strong> No se puede borrar el usuario administrador.
</div>
<?php
    }
}

if ($action == 'ajax') {
    $q = mysqli_real_escape_string($con, (strip_tags($_REQUEST['q'], ENT_QUOTES)));
    $aColumns = array('user_name'); // Columnas de búsqueda
    $sTable = "users";
    $sWhere = "";

    if ($_GET['q'] != "") {
        $sWhere = "WHERE (";
        for ($i = 0; $i < count($aColumns); $i++) {
            $sWhere .= $aColumns[$i] . " LIKE '%" . $q . "%' OR ";
        }
        $sWhere = substr_replace($sWhere, "", -3);
        $sWhere .= ')';
    }
    $sWhere .= " ORDER BY user_id DESC";
    include 'pagination.php'; // Incluye el archivo de paginación
    // Variables de paginación
    $page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
    $per_page = 10; // Cantidad de registros por página
    $adjacents = 4; // Espacio entre páginas después del número de páginas adyacentes
    $offset = ($page - 1) * $per_page;

    // Cuenta el número total de filas en tu tabla
    $count_query = mysqli_query($con, "SELECT COUNT(*) AS numrows FROM $sTable  $sWhere");
    $row = mysqli_fetch_array($count_query);
    $numrows = $row['numrows'];
    $total_pages = ceil($numrows / $per_page);
    $reload = './usuarios.php';

    // Consulta principal para obtener los datos
    $sql = "SELECT u.user_id, u.user_name, u.date_added, p.nombre_permiso
            FROM users u
            INNER JOIN permisos p ON u.id_permisos = p.id_permisos
            $sWhere LIMIT $offset,$per_page";
    $query = mysqli_query($con, $sql);

    // Recorre los datos obtenidos
    if ($numrows > 0) {
?>
<div class="table-responsive" style="background-color: #454955; border-color: #000000;">
    <table class="table" style="background-color: #454955; border-color: #000000;">
        <tr class="success" style="background-color: #454955; border-color: #000000;">
            <th style="background-color: #454955; border-color: #000000;">ID</th>
            <th style="background-color: #454955; border-color: #000000;">Usuario</th>
            <th style="background-color: #454955; border-color: #000000;">Agregado</th>
            <th style="background-color: #454955; border-color: #000000;">Permisos</th>
            <th style="background-color: #454955; border-color: #000000;"><span class="pull-right">Acciones</span></th>

        </tr>
        <?php
        while ($row = mysqli_fetch_array($query)) {
            $user_id = $row['user_id'];
            $user_name = $row['user_name'];
            $date_added = date('d/m/Y', strtotime($row['date_added']));
            $nombre_permiso = $row['nombre_permiso'];
        ?>
        <input type="hidden" value="<?php echo $user_name; ?>" id="usuario<?php echo $user_id; ?>">
        <input type="hidden" value="<?php echo $user_email; ?>" id="email<?php echo $user_id; ?>">

        <tr>
            <td><?php echo $user_id; ?></td>
            <td><?php echo $user_name; ?></td>
            <td><?php echo $date_added; ?></td>

            <td><?php echo $nombre_permiso; ?></td>
            <td><span class="pull-right">
                    <a href="#" class='btn btn-default' title='Editar usuario'
                        onclick="obtener_datos('<?php echo $user_id; ?>');" data-toggle="modal"
                        data-target="#myModal2"><i class="glyphicon glyphicon-edit"></i></a>
                    <a href="#" class='btn btn-default' title='Cambiar contraseña'
                        onclick="get_user_id('<?php echo $user_id; ?>');" data-toggle="modal"
                        data-target="#myModal3"><i class="glyphicon glyphicon-cog"></i></a>
                    <a href="#" class='btn btn-default' title='Borrar usuario'
                        onclick="eliminar('<? echo $user_id; ?>')"><i class="glyphicon glyphicon-trash"></i> </a></span>
            </td>

        </tr>
        <?php
        }
        ?>
        <tr>
            <td colspan=9><span class="pull-right">
                    <?php
                    echo paginate($reload, $page, $total_pages, $adjacents);
                    ?></span></td>
        </tr>
    </table>
</div>
<?php
    }
}
?>
