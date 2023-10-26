<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include('is_logged.php');

/* Inicia validación del lado del servidor */
$errors = array(); // Crear un array para almacenar los errores

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
    !empty($_POST['precio']) &&
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

    try {
        // Consulta SQL para la inserción de datos en la tabla products
        $sql = "INSERT INTO products (codigo_producto, nombre_producto, descripcion, date_added, precio_producto, precio_producto_dolares, stock, id_categoria, id_proveedor, url_imagen) VALUES ('$codigo','$nombre','$descripcion','$date_added','$precio_venta','$precio_venta_dolares','$stock','$id_categoria','$id_proveedor', '')";
    
        // Ejecutar la consulta SQL
        $query_new_insert = mysqli_query($con, $sql);
    
        if ($query_new_insert) {
            // Producto ha sido ingresado satisfactoriamente
            $messages[] = "Producto ha sido ingresado satisfactoriamente.";

            // Obtener el ID del producto recién insertado
            $id_producto = get_row('products', 'id_producto', 'codigo_producto', $codigo);
            $user_id = $_SESSION['user_id'];
            $user_name = $_SESSION['user_name'];
            $nota = "$user_name agregó $stock producto(s) al inventario";

            // Verificar si se envió una imagen y proceder a cargarla
            if (isset($_FILES['imagen'])) {
                $file_name = $_FILES['imagen']['name'];
                $file_tmp = $_FILES['imagen']['tmp_name'];

                // Directorio donde deseas almacenar las imágenes
                $upload_directory = '../img/';

                // Verifica si ya existe un archivo con el mismo nombre
                if (file_exists($upload_directory . $file_name)) {
                    $file_extension = pathinfo($file_name, PATHINFO_EXTENSION); // Obtener la extensión del archivo
                    $file_name = pathinfo($file_name, PATHINFO_FILENAME); // Obtener el nombre del archivo sin extensión
                    $new_file_name = $file_name . '_' . uniqid() . '.' . $file_extension; // Agregar sufijo único
                } else {
                    $new_file_name = $file_name;
                }

                // Ruta completa para almacenar la imagen en el servidor
                $file_path = $upload_directory . $new_file_name;

                // Mueve la imagen cargada al directorio de imágenes con el nuevo nombre
                if (move_uploaded_file($file_tmp, $file_path)) {
                    // Imagen cargada con éxito
                    $new_file_name_with_prefix = "img/" . $new_file_name; // Agrega el prefijo "img/"
                    // Actualizar la URL de la imagen en la base de datos con el nuevo nombre
                    $sql_update_image = "UPDATE products SET url_imagen = '$new_file_name_with_prefix' WHERE id_producto = '$id_producto'";
                    if (mysqli_query($con, $sql_update_image)) {
                        // Éxito
                    } else {
                        // Error en la consulta SQL
                        echo "Error SQL: " . mysqli_error($con);
                    }
                } else {
                    // Error al cargar la imagen
                    echo "Error al cargar la imagen.";
                }
            }
        } else {
            // La consulta se ejecutó pero hubo un problema, muestra un mensaje de error específico.
            if (strpos(mysqli_error($con), "Duplicate entry") !== false) {
                $errors[] = "No se pudo insertar el producto. El código de producto ya está en uso.";
            } else {
                $errors[] = "No se pudo insertar el producto. Error desconocido: " . mysqli_error($con);
            }
        }
    } catch (mysqli_sql_exception $e) {
        // Captura la excepción y muestra un mensaje de error con detalles específicos
        echo "Ha ocurrido un error al insertar el producto: " . $e->getMessage();
    }

    if (isset($errors) && !empty($errors)) {
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

    if (isset($messages) && !empty($messages)) {
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
}
?>
