
async function getVendedores() {
    let peticion = await fetch('../api/v1.0/vendedores');
    return await peticion.json();
}

async function updateVendedor(data) {
    let peticion = await fetch('../api/v1.0/vendedores', {
        method: 'put',
        body: formDataToJSON(data)
    })
}

async function createVendedor(data) {
    let peticion = await fetch('../api/v1.0/vendedores', {
        method: 'post',
        body: data
    })
}

async function deleteVendedor(item){
    let peticion = await fetch('../api/v1.0/vendedores/' + item.id, {
        method: 'delete'
    });
}

async function searchVendedores(valor){ //similar a getVendedores // recibe x parametro un valor
    let peticion = await fetch('../api/v1.0/vendedores?q=' + valor)
    return await peticion.json()
}

function formDataToJSON(formData) {
    return JSON.stringify(Object.fromEntries(formData.entries()));
}