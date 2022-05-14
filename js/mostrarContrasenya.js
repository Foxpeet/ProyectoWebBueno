var estado = "no"
function mostrarContrasenya() {
    var tipo = document.getElementById("password");
    if (tipo.type == "password") {
        tipo.type = "text";
    } else {
        tipo.type = "password";
    }
    if (estado == "no") {
        document.getElementById("ojo").style.display = 'none';
        document.getElementById("ojoTachado").style.display = 'inline';
        estado="si"
    } else {
        document.getElementById("ojo").style.display = 'inline';
        document.getElementById("ojoTachado").style.display = 'none';
        estado="no"
    }

}