<?php
include('is_logged.php'); // Archivo verifica que el usuario que intenta acceder a la URL esté logueado

// Verificación de la versión mínima de PHP
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
    // Si estás usando PHP 5.3 o PHP 5.4, debes incluir password_api_compatibility_library.php
    // (esta biblioteca agrega las funciones de hash de contraseña de PHP 5.5 a versiones más antiguas de PHP)
    require_once("../libraries/password_compatibility_library.php");
}

if (empty($_POST['user_password_new']) || empty($_POST['user_password_repeat'])) {
    $errors[] = "Contraseña vacía";
} elseif ($_POST['user_password_new'] !== $_POST['user_password_repeat']) {
    $errors[] = "La contraseña y la repetición de la contraseña no son iguales";
} elseif (strlen($_POST['user_password_new']) < 6) {
    $errors[] = "La contraseña debe tener al menos 6 caracteres";
} elseif (strlen($_POST['user_name']) > 64 || strlen($_POST['user_name']) < 2) {
    $errors[] = "El nombre de usuario no puede tener menos de 2 o más de 64 caracteres";
} elseif (!preg_match('/^[a-z\d]{2,64}$/i', $_POST['user_name'])) {
    $errors[] = "El nombre de usuario no encaja en el esquema de nombre: Solo se permiten letras y números, de 2 a 64 caracteres";
} elseif (
    !empty($_POST['user_name'])
    && strlen($_POST['user_name']) <= 64
    && strlen($_POST['user_name']) >= 2
    && preg_match('/^[a-z\d]{2,64}$/i', $_POST['user_name'])
    && !empty($_POST['user_password_new'])
    && !empty($_POST['user_password_repeat'])
    && ($_POST['user_password_new'] === $_POST['user_password_repeat'])
) {
    require_once("../config/db.php"); // Contiene las variables de configuración para conectar a la base de datos
    require_once("../config/conexion.php"); // Contiene la función que conecta a la base de datos

    // Escapando y eliminando cualquier cosa que pueda ser (html/javascript-) código
    $user_name = mysqli_real_escape_string($con, (strip_tags($_POST["user_name"], ENT_QUOTES)));
    $user_password = $_POST['user_password_new'];
    $date_added = date("Y-m-d H:i:s");
    $user_password_hash = password_hash($user_password, PASSWORD_DEFAULT);

    // Recupera el id_permisos desde el formulario
    $id_permisos = (int)$_POST['id_permisos'];

    // Verifica si el usuario o la dirección de correo electrónico ya existen
    $sql = "SELECT * FROM users WHERE user_name = '" . $user_name . "';";
    $query_check_user_name = mysqli_query($con, $sql);
    $query_check_user = mysqli_num_rows($query_check_user_name);
    if ($query_check_user == 1) {
        $errors[] = "Lo sentimos, el nombre de usuario ya está en uso.";
    } else {
        // Inserta los datos del nuevo usuario en la base de datos
        $sql = "INSERT INTO users (user_name, user_password_hash, date_added, id_permisos)
                VALUES('" . $user_name . "', '" . $user_password_hash . "', '" . $date_added . "', '" . $id_permisos . "');";
        $query_new_user_insert = mysqli_query($con, $sql);

        // Si el usuario se ha añadido con éxito
        if ($query_new_user_insert) {
            $messages[] = "La cuenta ha sido creada con éxito.";
        } else {
            $errors[] = "Lo sentimos, el registro falló. Por favor, regrese e inténtelo de nuevo.";
        }
    }
} else {
    $errors[] = "Un error desconocido ha ocurrido.";
}

if (isset($errors)) {
    ?>
    <div class="alert alert-danger" role="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Error!</strong>
        <?php
        foreach ($errors as $error) {
            echo $error;
        }
        ?>
    </div>
    <?php
}
if (isset($messages)) {
    ?>
    <div class="alert alert-success" role="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>¡Bien hecho!</strong>
        <?php
        foreach ($messages as $message) {
            echo $message;
        }
        ?>
    </div>
    <?php
}
?>
