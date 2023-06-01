<?php 
	include ("conexion.php"); 
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Proyecto 1DAW - SOLVAM</title>

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">

	<!-- CSS ================================================== -->
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/encabezado.css">
	<link rel="stylesheet" href="css/pie.css">

	<link rel="stylesheet" href="css/Contacto.css">

	<!-- Favicons ================================================== -->
	<link rel="shortcut icon" href="img/favicon.ico">

	<!-- JS ================================================== -->

</head>

<body>

	<div id="contenedor">

        <?php include ("encabezado.php"); ?>

        <div id="contenido">

            <div class="textos">

                <div class="titulo">
                    CONTACTA CON NOSOTROS
                </div>

                <div class="descripcion">
                    Si tienes alguna duda, sugerencia o 
                    noticia puedes contactar con nosotros 
                    y enviarnos tus datos, te contestaremos
                    lo antes posible, gracias por visitar 
                    Maquinitas.com!
                </div>

                <div class="advertencia">

                    <?php if (isset($_GET["correo"])) { ?>

                    Correo Enviado Correctamente

                    <?php } else { ?>

                    El correo se enviará directamente al e-mail del jefe -> nietofresnedacarlos97@gmail.com

                    <?php } ?>

                </div>

            </div>

            <div class="formulario">

                <form action="confirmacion.php" method="post">

                    <div class="nombre">
                        <div class="foto"></div>
                        <input type="text" name="nombre" placeholder="Nombre" />
                    </div>

                    <div class="email">
                        <div class="foto"></div>
                        <input type="text" name="email" placeholder="Correo Electrónico" />
                    </div>

                    <div class="web">
                        <div class="foto"></div>
                        <input type="text" name="web" placeholder="URL de tu página" />
                    </div>

                    <div class="areatexto">
                        <textarea name="texto"></textarea>
                    </div>

                    <div class="botonenviar">
                        <input type="submit" name="enviar" value="Enviar Mensaje">
                    </div>

                </form>

            </div>

            <div class="info">

                <div class="datos">

                    <div class="titulo">DATOS DE CONTACTO</div>
                    <div class="texto">
                        <strong>MAQUINITAS</strong><br />
                        C/ Street, 106<br />
                        Quart de Poblet - 46930<br />
                        Tel: 96 154 77 93<br /><br />
                        <strong>Krlos Nieto</strong><br />
                        <span>nietofresnedacarlos97@gmail.com</span>
                    </div>
                </div>

                <div class="mapa">

                    <div class="titulo">DONDE ESTAMOS</div>
                    <div class="dibujo">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2899.1558008000584!2d-5.664602823899254!3d43.394672871115596!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd36613c7b8e7b0b%3A0xc5dff816f6569641!2sSidreria%20Manolo%20Jal%C3%ADn!5e0!3m2!1ses!2ses!4v1684524828723!5m2!1ses!2ses" width="346" height="237" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>

            </div>

        </div>
        
		<?php include ("pie.php"); ?>

	</div>

</body>

</html>