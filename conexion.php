<?php 

$conexion = new mysqli ("localhost","tela","darkusbakugan","cnf_maquinitas");

if ($conexion -> connect_error) {
    die('No se ha podido conectar a la base de datos');
} else {
    echo "Conectada con exito";
}

?>