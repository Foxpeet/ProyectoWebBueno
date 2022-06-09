<?php

if (!isset($peticion)) die();
if (!isset($conn)) require "../includes/conexion.php";

if ($peticion->metodo() === "GET") {
    $sql = "SELECT * FROM `usuarios`";

    if(isset($peticion->parametrosQuery()["q"])){
        $sql .= " WHERE `nombre` LIKE '%".$peticion->parametrosQuery()["q"]."%' OR `apellidos` LIKE '%".$peticion->parametrosQuery()["q"]."%'";
    }

    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($salida, $row);
    }
}

if ($peticion->metodo() === "PUT") {
<<<<<<< HEAD
                $sql = "UPDATE `usuarios` SET 
                `nombre`='" . $peticion->parametrosBody()->nombre . "',
                `apellidos`='" . $peticion->parametrosBody()->apellidos . "',
                `password`='" . $peticion->parametrosBody()->password . "'
        WHERE `id` = " . $peticion->parametrosBody()->id;
=======
    $sql = "UPDATE `usuarios` SET 
                        `nombre`='" . $peticion->parametrosBody()->nombre . "',
                        `apellidos`='" . $peticion->parametrosBody()->apellidos . "'
 
                WHERE `id` = " . $peticion->parametrosBody()->id;
>>>>>>> ebd6babae09a4521c3c64b636611017cc7d4c203
    mysqli_query($conn, $sql);
}

if($peticion->metodo() === "POST") {
<<<<<<< HEAD
 $sql = "INSERT INTO `usuarios`(`nombre`, `apellidos`, `password`) 
=======
    $sql = "INSERT INTO `usuarios`(`nombre`, `apellidos`, `password`) 
>>>>>>> ebd6babae09a4521c3c64b636611017cc7d4c203
            VALUES ('".$peticion->parametrosPost()["nombre"]."',
                        '".$peticion->parametrosPost()["apellidos"]."',
                        '".$peticion->parametrosPost()["password"]."')";
    mysqli_query($conn, $sql);
}

if($peticion->metodo() === "DELETE") {
    $sql = "DELETE FROM `usuarios` WHERE `id` = " . $peticion->parametrosPath()[0];
    mysqli_query($conn, $sql);
}
