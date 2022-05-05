
function mostrarCampo1Sonda1(){
    document.getElementById("Grafica_Campo1_Sonda1").style.display = 'block';
    document.getElementById("Grafica_Campo1_Sonda2").style.display = 'none';
    document.getElementById("Grafica_Campo2_Sonda1").style.display = 'none';
    document.getElementById("Grafica_Campo2_Sonda2").style.display = 'none';
}

function mostrarCampo1Sonda2() {
    document.getElementById("Grafica_Campo1_Sonda1").style.display = 'none';
    document.getElementById("Grafica_Campo1_Sonda2").style.display = 'block';
    document.getElementById("Grafica_Campo2_Sonda1").style.display = 'none';
    document.getElementById("Grafica_Campo2_Sonda2").style.display = 'none';
}

function mostrarCampo2Sonda1() {
    document.getElementById("Grafica_Campo1_Sonda1").style.display = 'none';
    document.getElementById("Grafica_Campo1_Sonda2").style.display = 'none';
    document.getElementById("Grafica_Campo2_Sonda1").style.display = 'block';
    document.getElementById("Grafica_Campo2_Sonda2").style.display = 'none';
}

function mostrarCampo2Sonda2() {
    document.getElementById("Grafica_Campo1_Sonda1").style.display = 'none';
    document.getElementById("Grafica_Campo1_Sonda2").style.display = 'none';
    document.getElementById("Grafica_Campo2_Sonda1").style.display = 'none';
    document.getElementById("Grafica_Campo2_Sonda2").style.display = 'block';
}