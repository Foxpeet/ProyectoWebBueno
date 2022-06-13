<?php

if(!isset($peticion)) die();

require "../includes/conexion.php";

$IDSonda = $_POST['sondas'];

$datos = array();
$sql = "SELECT * FROM vista_medicion_sonda WHERE idSonda= $IDSonda";
$query = mysqli_query($conn, $sql);  
while ($row = mysqli_fetch_assoc($query)){ 
    $datos['temp'] [] = $row['temperatura'];
    $datos['hum'] [] = $row['humedad'];
    $datos['salin'] [] = $row['salinidad'];
    $datos['ilumin'] [] = $row['iluminacion'];
    $datos['hora'] [] = $row['hora'];
}
echo json_encode($datos);

?>