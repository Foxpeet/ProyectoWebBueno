<?php

if(!isset($peticion)) die();

require "../includes/conexion.php";

if($peticion->metodo() === "GET"){
    $paramGet = $peticion->parametrosQuery();
    if(isset($paramGet["usuario"])){
        $sql = "SELECT * FROM `vista_propiedad_parcelas` WHERE `usuario` = " . $paramGet["usuario"];
        $result = mysqli_query($conn, $sql);
        //echo $sql;
        while ($row = mysqli_fetch_assoc($result)){
            array_push( $salida, $row);    
        }
    }

    $paramPath = $peticion->parametrosPath();
    if(count($paramPath) == 2 && $paramPath[1] == 'vertices') {
        $sql = "SELECT `lat` , `lng` FROM `vertices` WHERE `parcela` = " .$paramPath[0];
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_assoc($result)) {
            $row["lat"] = floatval($row["lat"]);
            $row["lng"] = floatval($row["lng"]);
            array_push( $salida, $row );
        }
    }
}