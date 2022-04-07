
const opcion = document.querySelectorAll('.cultivos');

// Permite recorrer cada una de las opciones
opcion.forEach(e => {

    // Añadimos un evento a cada elemento seleccionado
    e.addEventListener('click', function(e){

        // Alteramos las clases de nuestros enlaces
        const padre = e.target.parentNode;
        padre.children[1].classList.toggle('animation');
        padre.parentNode.children[1].classList.toggle('animation');
    });


});


