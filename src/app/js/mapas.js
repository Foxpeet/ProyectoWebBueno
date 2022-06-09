let map;
let parcelas;
async function initMap() {

    let urlParams = new URLSearchParams(window.location.search);
    let usuario = urlParams.get("usuario");
    if (!usuario) usuario = 1;

    let consulta = await fetch("api/v1.0/parcela?usuario=" + usuario);
    parcelas = await consulta.json();
    console.log(parcelas);
    crearSelector();

    map = new google.maps.Map(document.getElementById('mapa'), {
        center: { lat: 38.997913, lng: -0.179249 },
        zoom: 17,
        mapTypeId: 'hybrid',
        styles: [
            {
                featureType: 'poi',
                stylers: [{ visibility: 'off' }]
            },
            {
                featureType: 'transit',
                stylers: [{ visibility: 'off' }]
            }
        ],
        mapTypeControl: false,
        streetViewControl: false,
        rotateControl: false,
    });
    map.setTilt(0);
}

function crearSelector() {
    let selector = document.getElementById("selector-parcelas")
    parcelas.forEach(function (parcela, index) {
        let label = document.createElement('label');
        label.textContent = parcela.nombre_parcela;
        let check = document.createElement('input');
        check.type = 'checkbox';
        check.addEventListener('change', function () {
            mostrarOcultarParcela(index, check.checked);
        })
        label.prepend(check)
        selector.append(label);
    })
}

async function mostrarOcultarParcela(index, mostrar) {
    let parcela = parcelas[index];
    if (mostrar) {
        if (parcela.polygon) {
            parcela.polygon.setMap(map);
        } else {
            let consulta = await fetch("api/v1.0/parcela/" + parcela.parcela + "/vertices");
            let vertices = await consulta.json();
            parcela.polygon = new google.maps.Polygon({
                paths: vertices,
                strokeColor: "#" + parcela.color,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: "#" + parcela.color,
                fillOpacity: 0.35,
                map: map
            });
        }
    } else {
        if (parcela.polygon) parcela.polygon.setMap(null);
    }
    ajustarMapa()
}

function ajustarMapa() {
    let bounds = new google.maps.LatLngBounds();
    parcelas.forEach(function (parcela) {
        if (parcela.polygon && parcela.polygon.getMap()) {
            parcela.polygon.getPath().getArray().forEach(function (v) {
                bounds.extend(v);
            })
        }
    })
    if (!bounds.isEmpty()) map.fitBounds(bounds);
}