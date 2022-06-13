let map;
let parcelas;
let graficamostrada = 0;
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
        // aplicar css al label
        label.style.fontSize = 'larger';
        label.style.cursor = 'pointer';
        label.style.borderBottom = '1px solid black';
        label.style.color ='#820053';
        label.style.fontFamily = 'Gill Sans MT', 'Gill Sans', 'Calibri', 'Trebuchet MS', 'sans-serif';

        label.textContent = parcela.nombre_parcela;
        let check = document.createElement('input');
        check.type = 'checkbox';
        //aplicar css al check
        check.style.cursor = 'pointer';
        check.style.accentColor = '#820053';
        check.style.color = '#820053';

        check.checked = true;
        check.addEventListener('change', function () {
            mostrarOcultarParcela(index, check.checked, parcela);
        })
        
        label.prepend(check)
        selector.append(label);
        mostrarOcultarParcela(index, true, parcela);
    })
}

async function crearSondas(index1, parcela1){
    let parcela = parcelas[index1]
    let consulta = await fetch("api/v1.0/sondas/" + parcela.parcela + "/sondas");
    let sondas = await consulta.json();
    let consulta2 = await fetch("api/v1.0/sondas/" + parcela.parcela + "/idsondas");
    let idmarker = await consulta2.json();
    parcela.marker1 = new google.maps.Marker({
        // position: {lat:38.9981629,  lng:-0.1720151}, 
        position: sondas[0],
        map: map,
    })
    parcela.marker2 = new google.maps.Marker({
        position: sondas[1],
        map: map,
    })
    parcela.marker3 = new google.maps.Marker({
        position: sondas[2],
        map: map,
    })
    parcela.marker4 = new google.maps.Marker({
        position: sondas[3],
        map: map,
    })

    parcela.marker1.addListener('click', function(){
        mostrarGrafica(idmarker[0].id, parcela1);
    })
    parcela.marker2.addListener('click', function () {
        mostrarGrafica(idmarker[1].id, parcela1);
    })
    parcela.marker3.addListener('click', function () {
        mostrarGrafica(idmarker[2].id, parcela1);
    })
    parcela.marker4.addListener('click', function () {
        mostrarGrafica(idmarker[3].id, parcela1);
    })
}
async function mostrarOcultarSonda(index, mostrar, parcela1){
    let parcela = parcelas[index]
    if(mostrar){    
        crearSondas(index, parcela1)
    } else {
        parcela.marker1.setMap(null)
        parcela.marker2.setMap(null)
        parcela.marker3.setMap(null)
        parcela.marker4.setMap(null)
    }
    ajustarMapa()
}
async function mostrarOcultarParcela(index, mostrar, parcela1) {
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
    mostrarOcultarSonda(index, mostrar, parcela1)
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

//-----------------------------------------------------------------------------------------


var miGrafica;
async function mostrarGrafica(index, parcela1) {
    document.getElementById("pasos_grafica").style.display = "none" ;
    document.getElementById("explicacion").style.display = "block";
    if(index<=7 && index>3){ //para limitar la id de la sonda
        index=index-3
        
    } if (index <= 11 && index > 7) {
        index = index - 7    
    } if (index <= 14 && index > 11) {
        index = index - 11
    } 
    
    if(graficamostrada==1){
        miGrafica.destroy();
    }

    let consulta = await fetch("api/v1.0/sondas?datosSondas=" + index);
    let datos = await consulta.json();
    console.log(datos)
    let datosG = {
        labels: [datos[0].hora, datos[1].hora, datos[2].hora, datos[3].hora, datos[4].hora],
        datasets: [
            {
                label: 'Humedad',
                data: [datos[0].humedad, datos[1].humedad, datos[2].humedad, datos[3].humedad, datos[4].humedad],
                // fill: true,
                // backgroundColor: 'rgba(11, 8, 221, .5)',
                borderColor: 'rgb(119,145,255)',
                // borderDash: [10, 4, 3, 4],
                pointStyle: 'circle',
                pointRadius: 5,
            },
            {
                label: 'Salinidad',
                data: [datos[0].salinidad, datos[1].salinidad, datos[2].salinidad, datos[3].salinidad, datos[4].salinidad],
                borderColor: 'rgb(80,218,38)',
                pointStyle: 'cirlce',
                pointRadius: 5,
            },
            {
                label: 'Temperatura en ºC',
                data: [datos[0].temperatura, datos[1].temperatura, datos[2].temperatura, datos[3].temperatura, datos[4].temperatura],
                borderColor: 'rgb(255,110,86)',
                pointStyle: 'cirlce',
                pointRadius: 5,
            },
            {
                label: 'Iluminacion',
                data: [datos[0].iluminacion, datos[1].iluminacion, datos[2].iluminacion, datos[3].iluminacion, datos[4].iluminacion],
                borderColor: 'rgb(248, 247, 38)',
                pointStyle: 'circle',
                pointRadius: 5,
            },
        ]
    };

    let opciones = {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                stacked: false
            }
        },
        plugins: {
            legend: {
                position: 'bottom',
                align: 'center'
            },
            title: {
                display: true,
                text: 'Mediciones de ayer: ' + '  Sonda: ' + index + '  Campo: ' + '"' + parcela1.nombre_parcela + '"'
                // titulo segun el sensor
            },
            tooltip: {
                backgroundColor: '#fff',
                titleColor: '#000',
                titleAlign: 'center',
                bodyColor: '#333',
                borderColor: '#666',
                borderWidth: 1,
            }
        },
    };

    let ctx = document.getElementById('chart');

    miGrafica = new Chart(ctx, {
        type: 'line',
        data: datosG,
        options: opciones
    });
    graficamostrada = 1;
}