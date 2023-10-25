<?php
// Obtener el ID de permisos del usuario actual
$user_id = $_SESSION['user_id'];
// Consulta SQL para obtener el ID de permisos del usuario actual
$sql = "SELECT id_permisos FROM users WHERE user_id = $user_id";
$result = mysqli_query($con, $sql);
if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $user_permisos = $row['id_permisos'];
} else {
    // Manejar el caso en el que no se pudo obtener el ID de permisos
    echo "Error: No se pudo obtener el ID de permisos del usuario.";
}
?>