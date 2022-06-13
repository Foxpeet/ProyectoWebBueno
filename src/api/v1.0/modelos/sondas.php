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
    if(count($paramPath) == 2 && $paramPath[1] == 'sondas') {
        $sql = "SELECT `lat` , `lng` FROM `sondas` WHERE `parcela` = " .$paramPath[0];
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_assoc($result)) {
            $row["lat"] = floatval($row["lat"]);
            $row["lng"] = floatval($row["lng"]);
            array_push( $salida, $row );
        }
    }

    $paramPath = $peticion->parametrosPath();
    if(count($paramPath) == 2 && $paramPath[1] == 'idsondas') {
        $sql = "SELECT `id` FROM `sondas` WHERE `parcela` = " .$paramPath[0];
        $result = mysqli_query($conn, $sql);
        while($row = mysqli_fetch_assoc($result)) {
            array_push( $salida, $row );
        }
    }

    $paramGet = $peticion->parametrosQuery();
    if(isset($paramGet["datosSondas"])){
        $datos = array();
        $sql = "SELECT `hora`, `humedad`, `salinidad`, `temperatura`, `iluminacion` FROM `mediciones` WHERE `sonda`= " .$paramGet["datosSondas"];
        $query = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_assoc($query)){ 
            $datos['hora'] [] = $row['hora'];
            $datos['humedad'] [] = $row['humedad'];
            $datos['salinidad'] [] = $row['salinidad'];
            $datos['temperatura'] [] = $row['temperatura'];
            $datos['iluminacion'] [] = $row['iluminacion'];
            
            array_push( $salida, $row );
        }
    }
}