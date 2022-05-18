var estadoCampo1Sensor1 = "no"
var estadoCampo1Sensor2 = "no"
var estadoCampo2Sensor1 = "no"
var estadoCampo2Sensor2 = "no"

function mostrarCampo1Sonda1(){
    if(estadoCampo1Sensor1=="no"){
        document.getElementById("Grafica_Campo1_Sonda1").style.display = 'block';
        estadoCampo1Sensor1="yes"
        document.getElementById("Grafica_Campo1_Sonda2").style.display = 'none';
        document.getElementById("Grafica_Campo2_Sonda1").style.display = 'none';
        document.getElementById("Grafica_Campo2_Sonda2").style.display = 'none';
    } else if(estadoCampo1Sensor1=="yes"){
        document.getElementById("Grafica_Campo1_Sonda1").style.display = 'none';
        estadoCampo1Sensor1="no"
    } 
}

function mostrarCampo1Sonda2() {
    if (estadoCampo1Sensor2 == "no") {
        document.getElementById("Grafica_Campo1_Sonda1").style.display = 'none';
        document.getElementById("Grafica_Campo1_Sonda2").style.display = 'block';
        estadoCampo1Sensor2 = "yes"
        document.getElementById("Grafica_Campo2_Sonda1").style.display = 'none';
        document.getElementById("Grafica_Campo2_Sonda2").style.display = 'none';
    } else if (estadoCampo1Sensor2 == "yes") {
        document.getElementById("Grafica_Campo1_Sonda2").style.display = 'none';
        estadoCampo1Sensor2 = "no"
    }
}

function mostrarCampo2Sonda1() {
    if (estadoCampo2Sensor1 == "no") {
        document.getElementById("Grafica_Campo1_Sonda1").style.display = 'none';
        document.getElementById("Grafica_Campo1_Sonda2").style.display = 'none';
        document.getElementById("Grafica_Campo2_Sonda1").style.display = 'block';
        estadoCampo2Sensor1 = "yes"
        document.getElementById("Grafica_Campo2_Sonda2").style.display = 'none';
    } else if (estadoCampo2Sensor1 == "yes") {
        document.getElementById("Grafica_Campo2_Sonda1").style.display = 'none';
        estadoCampo2Sensor1 = "no"
    }
}

function mostrarCampo2Sonda2() {
    if (estadoCampo2Sensor2 == "no") {
        document.getElementById("Grafica_Campo1_Sonda1").style.display = 'none';
        document.getElementById("Grafica_Campo1_Sonda2").style.display = 'none';
        document.getElementById("Grafica_Campo2_Sonda1").style.display = 'none';
        document.getElementById("Grafica_Campo2_Sonda2").style.display = 'block';
        estadoCampo2Sensor2 = "yes"
    } else if (estadoCampo2Sensor2 == "yes") {
        document.getElementById("Grafica_Campo2_Sonda2").style.display = 'none';
        estadoCampo2Sensor2 = "no"
    }
}