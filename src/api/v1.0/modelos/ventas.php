<?php

require "../includes/conexion.php";

if ($peticion->metodo() === "GET") {

    $sql = "SELECT * FROM vista_ventas_completas";

    $paramsGet =  $peticion->parametrosQuery();
    if(isset($paramsGet["vendedor"]) && isset($paramsGet["inicio"]) && isset($paramsGet["fin"])) {
        $sql .= " WHERE `vendedor_id` = ".$paramsGet["vendedor"]." AND `fecha` >= '".$paramsGet["inicio"]."' AND `fecha` <= '".$paramsGet["fin"]."' ORDER BY `fecha`";
    }

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            //array_push($salida, $row);
            $venta = [];
            $venta['id'] = $row['id'];
            $venta['fecha'] = $row['fecha'];
            $venta['importe'] = $row['importe'];

            $venta['vendedor'] = [];
            $venta['vendedor']['id'] = $row['vendedor_id'];
            $venta['vendedor']['nombre'] = $row['vendedor_nombre'];
            $venta['vendedor']['apellidos'] = $row['vendedor_apellidos'];

            $venta['cliente'] = [];
            $venta['cliente']['id'] = $row['cliente_id'];
            $venta['cliente']['nombre'] = $row['cliente_nombre'];

            array_push($salida, $venta);
        }
    } else {
        // TODO: implementar en caso de que no haya ventas
    }
}
