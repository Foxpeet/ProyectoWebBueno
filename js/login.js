function enviarLogin() {
    event.preventDefault()
    console.log("Envio de formulario")

    var nombreUsuario = document.getElementById("usuario").value;
    var passUsuario = document.getElementById("contraseña").value

    var url = "api/v0.0/" + nombreUsuario + "-" + passUsuario + ".json"

    console.log(url)

    fetch(url).then(function (respuesta) {
        //console.log(respuesta)
        return respuesta.json()
    }).then(function (datos) {
        console.log(datos.nombre)
        location.href = "app/test-formulario.html"
    }).catch(function () {
        console.log("Datos incorrectos")
    })
}