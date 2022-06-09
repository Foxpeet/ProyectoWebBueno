let datos = {
    labels: ['2022/05/16', '2022/05/17', '2022/05/18', '2022/05/19', '2022/05/20'],
    datasets: [
        {
            label: 'Humedad',
            data: [60, 70, 86, 40, 50],
            fill: true,
            backgroundColor: 'rgba(11, 8, 221, .5)',
            borderColor: 'rgb(255,110,86)',
            borderDash: [10, 4, 3, 4],
            tension: .3,
            pointStyle: 'circle',
            pointRadius: 6,
        },
        {
            label: 'Salinidad',
            data: [60, 36, 13, 50, 40],
            fill: true,
            backgroundColor: 'rgba(184, 122, 13, .5)',
            borderColor: 'rgb(119,145,255)',
            borderDash: [10, 4, 3, 4],
            pointStyle: 'cirlce',
            pointRadius: 6,
        },
        {
            label: 'Temperatura',
            data: [20, 25, 12, 30, 25],
            fill: true,
            backgroundColor: 'rgba(207, 21, 12, .5)',
            borderColor: 'rgb(119,145,255)',
            borderDash: [10, 4, 3, 4],
            pointStyle: 'cirlce',
            pointRadius: 6,
        },
        {
            label: 'Iluminacion',
            data: [50, 67, 9, 93, 69],
            fill: true,
            backgroundColor: 'rgba(231, 224, 13, .5)',
            borderColor: 'rgb(119,145,255)',
            borderDash: [10, 4, 3, 4],
            pointStyle: 'circle',
            pointRadius: 6,
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
            text: 'Mediciones última semana'
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

let miGrafica = new Chart(ctx, {
    type: 'line',
    data: datos,
    options: opciones
});