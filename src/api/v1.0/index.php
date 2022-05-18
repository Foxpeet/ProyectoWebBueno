<?php

require_once '../includes/PeticionREST.inc';

$peticion = new PeticionREST('v1.0');

$salida = [];

require "modelos/" . $peticion->recurso() . ".php";


echo json_encode($salida);