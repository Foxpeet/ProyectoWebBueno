<?php

if (!isset($peticion)) die();
if (!isset($conn)) require "../includes/conexion.php";

if ($peticion->metodo() === "GET") {
    $sql = "SELECT * FROM `clientes`";

    if(isset($peticion->parametrosQuery()["q"])){
        $sql .= " WHERE `nombre` LIKE '%".$peticion->parametrosQuery()["q"]."%' OR `apellidos` LIKE '%".$peticion->parametrosQuery()["q"]."%'";
    }

    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($salida, $row);
    }
}

if ($peticion->metodo() === "PUT") {
    $sql = "UPDATE `clientes` SET 
                        `nombre`='" . $peticion->parametrosBody()->nombre . "',
                        `apellidos`='" . $peticion->parametrosBody()->apellidos . "'
 
                WHERE `id` = " . $peticion->parametrosBody()->id;
    mysqli_query($conn, $sql);
}

if($peticion->metodo() === "POST") {
    $sql = "INSERT INTO `clientes`(`nombre`, `apellidos`, `password`) 
            VALUES ('".$peticion->parametrosPost()["nombre"]."',
                    '".$peticion->parametrosPost()["apellidos"]."',
                    '".$peticion->parametrosPost()["password"]."')";
    mysqli_query($conn, $sql);
}

if($peticion->metodo() === "DELETE") {
    $sql = "DELETE FROM `clientes` WHERE `id` = " . $peticion->parametrosPath()[0];
    mysqli_query($conn, $sql);
}