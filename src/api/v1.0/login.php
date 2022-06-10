<?php
require "../includes/conexion.php";
if(!$conn){
    die("No hay conexion:" .mysqli_connect_error());
}
$nombre = $_POST["login"];
$pass = $_POST["passw"];
    $query = mysqli_query($conn, "SELECT * FROM usuarios WHERE nombre = '".$nombre."' and password ='".$pass."'");
    $nr = mysqli_num_rows($query);
    if($nr==1){
        if($nombre == "admin"){
            echo "<script>window.location='../../app/vendedores.html'; alert('Bienvenido administrador')</script>";
        }
        else if($nombre == "Mariano"){
            echo "<script>window.location='../../userPage1.html?usuario=2'; alert('Bienvenido $nombre')</script>";
        }
        else if($nombre == "Manolo"){
            echo "<script>window.location='../../userPage2.html?usuario=3'; alert('Bienvenido $nombre')</script>";
        }
    }
    else{
        echo "<script>alert('Usuario no existe'); window.location='../../login.html'</script>";
    }

?>
