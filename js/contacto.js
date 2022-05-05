function enviarContacto(event) {
    event.preventDefault();
    let nombre = document.getElementById("nombre").value;
    let apellidos = document.getElementById("apellidos").value;
    let email = document.getElementById("correo").value;
    let telefono = document.getElementById("telefono").value;
    let asunto = document.getElementById("asunto").value;
    let mensaje = document.getElementById("mensaje").value

    console.log(nombre)
    console.log(apellidos)
    console.log(email)
    console.log(telefono)
    console.log(asunto)
    console.log(mensaje)

    location.href = "../src/confirmacion-contacto.html"
}