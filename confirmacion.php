<?php 

//isset es verdadero si la variable que se le pasa como parámetro no está vacía

//si se ha pulsado el botón de enviar formulario
if (isset($_POST["enviar"])){
	
		$nombre=$_POST["nombre"];

        $email=$_POST["email"];

        $web=$_POST["web"];

        $texto=$_POST["texto"];

		//se crea la variable "mensaje" y se le asigna lo que el usuario ha escrito en el campo "mensaje" del formulario
		$mensaje="Nombre -> $nombre\nEmail -> $email\nWeb -> $web\nMensaje -> $texto";

		 
		//sintaxis mail(destino, asunto, mensaje, cabeceras);
		mail(
            "nietofresnedacarlos97@gmail.com",
            "Email de Maquinitas.com",
            $mensaje,
            "From:$email\n"
            );		
}

    header("Location: https://tela.com.es/tela/Trabajo_Final/Contacto.php?correo");

?>