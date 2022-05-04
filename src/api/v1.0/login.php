<?php
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "usuarios";
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if(!$conn){
    die("No hay conexion:" .mysqli_connect_error());
}
$nombre = $_POST["login"];
$pass = $_POST["passw"];
    $query = mysqli_query($conn, "SELECT * FROM login WHERE usuario = '".$nombre."' and password ='".$pass."'");
    $nr = mysqli_num_rows($query);
    if($nr==1){
        if($nombre == "admin"){
            echo "<script>window.location='vistaDeAdmin.html'; alert('Bienvenido administrador')</script>";
        }
        else if($nombre != "admin"){
            echo "<script>window.location='app/userPage.html'; alert('Bienvenido $nombre')</script>";
        }
    }
    else{
        echo "<script>window.location='login.html' ; alert('Usuario no existe')</script>";
    }

?>