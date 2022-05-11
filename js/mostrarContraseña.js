var estado = "no"
function mostrarContrasena() {
    var tipo = document.getElementById("password");
    if (tipo.type == "password") {
        tipo.type = "text";
    } else {
        tipo.type = "password";
    }
    if (estado == "no") {
        document.getElementById("ojo").style.display = 'none';
        document.getElementById("ojoTachado").style.display = 'block';
        estado="si"
    } else {
        document.getElementById("ojo").style.display = 'block';
        document.getElementById("ojoTachado").style.display = 'none';
        estado="no"
    }

}