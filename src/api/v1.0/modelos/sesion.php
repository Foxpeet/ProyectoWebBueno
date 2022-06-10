<?php

if (!isset($peticion)) die();

if ($peticion->metodo() === 'POST') {

    $sql = "SELECT * 
            FROM usuarios 
            WHERE usuario = '" . $peticion->parametrosPost()['usuario']
            . "' AND password = '" . $peticion->parametrosPost()['contraseña'] . "'" ;

    require "../includes/conexion.php";
    if (!isset($conn)) die();
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        session_start();
        $row = mysqli_fetch_assoc($result);
        $_SESSION['id'] = $row['id'];
        $_SESSION['usuario'] = $row['usuario'];
        $_SESSION['rol'] = $row['rol'];

    } else {
        http_response_code(401);
        die();
    }
}

if($peticion->metodo() === 'GET') {
    session_start();
    // if(isset($_SESSION['id']) && !empty($_SESSION['id'])) {
    //     if(count($peticion->parametrosPath()) > 0) {
    //         if($_SESSION['rol'] !== $peticion->parametrosPath()[0]) {
    //             http_response_code(401);
    //             die();
    //         }
    //     }

    $salida['nombre'] = $_SESSION['usuario'];
    $salida['rol'] = $_SESSION['rol'];
    } else {
        http_response_code(401);
        die();
    }
}

if($peticion->metodo() === 'DELETE') {
    session_start();
    $_SESSION['id'] = '';
    session_destroy();
}