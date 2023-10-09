<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


include('is_logged.php');

// ...
$file_name = "";

// Verifica si se envió un archivo de imagen
if (isset($_FILES['imagen'])) {
    $file_name = $_FILES['imagen']['name'];
    $file_tmp = $_FILES['imagen']['tmp_name'];

    // Directorio donde deseas almacenar las imágenes
    $upload_directory = '../img/';

    // Genera un nombre único para el archivo de imagen
    $file_name = uniqid() . "_" . $file_name;

    // Ruta completa para almacenar la imagen en el servidor
    $file_path = $upload_directory . $file_name;

    // Mueve la imagen cargada al directorio de imágenes
    if (move_uploaded_file($file_tmp, $file_path)) {
        // Imagen cargada con éxito, ahora $file_name contiene el nombre único de la imagen
        $file_name = "img/" . $file_name; // Agrega el prefijo "img/"
    } else {
        // Error al cargar la imagen
        $errors[] = "Error al cargar la imagen.";
    }
}
// ...


/* Inicia validación del lado del servidor */
if (empty($_POST['codigo'])) {
    $errors[] = "Código vacío";
} else if (empty($_POST['nombre'])) {
    $errors[] = "Nombre del producto vacío";
} else if ($_POST['descripcion'] == "") {
    $errors[] = "Descripción del producto vacío";
} else if ($_POST['stock'] == "") {
    $errors[] = "Stock del producto vacío";
} else if (empty($_POST['precio'])) {
    $errors[] = "Precio del producto vacío";
} else if (empty($_POST['preciodolares'])) {
    $errors[] = "Precio del producto en dólares vacío";
} else if (
    !empty($_POST['codigo']) &&
    !empty($_POST['nombre']) &&
    !empty($_POST['descripcion']) &&
    $_POST['stock'] != "" &&
    !empty($_POST['precio'])&&
    !empty($_POST['preciodolares'])
) {
    /* Connect To Database */
    require_once("../config/db.php"); // Contiene las variables de configuración para conectar a la base de datos
    require_once("../config/conexion.php"); // Contiene función que conecta a la base de datos
    include("../funciones.php");
    
    // Escapar y eliminar cualquier código HTML/JavaScript en los campos del formulario
    $codigo = mysqli_real_escape_string($con, strip_tags($_POST["codigo"], ENT_QUOTES));
    $nombre = mysqli_real_escape_string($con, strip_tags($_POST["nombre"], ENT_QUOTES));
    $descripcion = mysqli_real_escape_string($con, strip_tags($_POST["descripcion"], ENT_QUOTES));
    $stock = intval($_POST['stock']);
    $id_categoria = intval($_POST['categoria']);
    $id_proveedor = intval($_POST['proveedor']);
    $precio_venta = floatval($_POST['precio']);
    $precio_venta_dolares = floatval($_POST['preciodolares']);
    $date_added = date("Y-m-d H:i:s");
    
    // Luego, en la consulta SQL, puedes usar $file_name para almacenar la URL de la imagen en la base de datos
$sql = "INSERT INTO products (codigo_producto, nombre_producto, descripcion, date_added, precio_producto, precio_producto_dolares, stock, id_categoria, id_proveedor, url_imagen) VALUES ('$codigo','$nombre','$descripcion','$date_added','$precio_venta','$precio_venta_dolares','$stock','$id_categoria','$id_proveedor', '$file_name')";
    $query_new_insert = mysqli_query($con, $sql);
    
    if ($query_new_insert) {
        $messages[] = "Producto ha sido ingresado satisfactoriamente.";
        $id_producto = get_row('products', 'id_producto', 'codigo_producto', $codigo);
        $user_id = $_SESSION['user_id'];
        $user_name = $_SESSION['user_name'];
        $nota = "$user_name agregó $stock producto(s) al inventario";
        echo guardar_historial($id_producto, $user_id, $date_added, $nota, $codigo, $stock);
    } else {
        $errors[] = "Lo siento, algo ha salido mal. Inténtalo nuevamente." . mysqli_error($con);
    }
} else {
    $errors[] = "Error desconocido.";
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
