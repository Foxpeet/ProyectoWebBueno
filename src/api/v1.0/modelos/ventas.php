<?php

require "../includes/conexion.php";

if ($peticion->metodo() === "GET") {

    $sql = "SELECT * FROM mediciones";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            //array_push($salida, $row);
            $mediciones = [];
            $mediciones['id'] = $row['id'];
            $mediciones['fecha'] = $row['fecha'];
            $mediciones['valor'] = $row['importe'];

            $mediciones['humedad'] = [];
            $mediciones['vendedor']['id'] = $row['vendedor_id'];
            $mediciones['vendedor']['nombre'] = $row['vendedor_nombre'];
            $mediciones['vendedor']['apellidos'] = $row['vendedor_apellidos'];

            $mediciones['cliente'] = [];
            $mediciones['cliente']['id'] = $row['cliente_id'];
            $mediciones['cliente']['nombre'] = $row['cliente_nombre'];

            array_push($salida, $mediciones);
        }
    } else {
        // TODO: implementar en caso de que no haya ventas
    }
}
