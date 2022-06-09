<?php
require "../includes/conexion.php";

if ($peticion->metodo() === "GET") {

    $sql = "SELECT * FROM `mediciones`;";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $mediciones = [];
            $mediciones['tempertatura'] = $row['temperatura'];
            $mediciones['salinidad'] = $row['salinidad'];
            $mediciones['humedad'] = $row['humedad'];
            $mediciones['iluminacion'] = $row['iluminacion'];
            $mediciones['fecha'] = $row['fecha'];

            array_push($salida, $mediciones);
        }
    } else {
        //mandamos un error 401 que es que no estas autorizado
        http_response_code(401);
        die();
    }
}