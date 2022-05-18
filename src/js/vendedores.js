let formContainer = document.getElementById('form-vendedor');
let form = formContainer.querySelector('form');
form.addEventListener('submit', enviarFormulario);

let busqueda = document.getElementById('buscar')

async function filtrarListado(){
    console.log(busqueda.value) //no hace falta ponerlo
    vendedores = await searchVendedores(busqueda.value) //hace la llamada al servidor
    crearListadoVendedores()
}

busqueda.addEventListener('input', filtrarListado) //input para que al hacer la busqueda vaya letra a letra

let vendedores;

//region ---Formulario---
function openForm() {
    formContainer.style.display = "block";
}

function closeForm() {
    formContainer.style.display = "none";
    form.reset();
    document.getElementById('id').value = "";
}
//endregion

async function enviarFormulario(event) {
    event.preventDefault();
    let data = new FormData(form);
    console.log(data.get('id'));
    if(data.get('id') === '') {
        await createVendedor(data);
    } else {
        await updateVendedor(data);
    }
    closeForm();
    init();
}

function editarVendedor(item) {
    openForm();
    document.getElementById('id').value = item.id;
    document.getElementById('nombre').value = item.nombre;
    document.getElementById('apellidos').value = item.apellidos;
}

async function borrarVendedor(item) {
    if(confirm('¿Eliminar el vendedor ' + item.apellidos + ', ' + item.nombre)) {
        await deleteVendedor(item);
        init();
    }
}

function crearItemVendedor(item) {
    let div = document.createElement('div');
    div.textContent = item.apellidos + ', ' + item.nombre;
    let editBtn = document.createElement('button');
    editBtn.textContent = 'Editar';
    editBtn.onclick = function () {
        editarVendedor(item);
    }
    let delBtn = document.createElement('button');
    delBtn.textContent = 'Borrar';
    delBtn.onclick = function () {
        borrarVendedor(item);
    }
    div.prepend(editBtn, delBtn);
    return div;
}

function crearListadoVendedores() {
    let container = document.getElementById('listado-vendedores');
    container.innerHTML = '';
    vendedores.forEach(function (item) {
        container.append(crearItemVendedor(item));
    })
}

async function init() {
    vendedores = await getVendedores();
    crearListadoVendedores();
}

init();