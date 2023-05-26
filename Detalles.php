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

	<link rel="stylesheet" href="css/Detalles.css">

	<!-- Favicons ================================================== -->
	<link rel="shortcut icon" href="img/favicon.ico">

	<!-- JS ================================================== -->

</head>

<body>

	<div id="contenedor">

		<?php include ("encabezado.php"); ?>

        <div id="contenido-foto">

            <div class="foto"></div>

            <div class="textos">

                <div class="titulo">TÍTULO DE LA FOTO</div>
				<div class="descripcion-corta">
					Descripción de la foto
					Descripción de la foto
					Descripción de la foto
					Descripción de la foto
					Descripción de la foto
				</div>
				<div class="descripcion-larga">
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
					Movidas de la foto Movidas de la foto
				</div>
				<div class="informacion">
					<div class="nombre-juego">
						JUEGO:
					</div>
					<div class="consola">
						CONSOLAS:
					</div>
					<div class="genero">
						GÉNERO:
					</div>
					<div class="fecha">
						FECHA DE LANZAMIENTO:
					</div>
					<div class="estudio">
						ESTUDIO:
					</div>
				</div>
				<div class="botones">
					<div class="mas-info">
						<a href="#">
							<p>Más Información...</p>
						</a>
					</div>
					<div class="volver">
						<a href="index.html">
							<div class="imagen"></div>
							<p>Volver...</p>
						</a>
					</div>
				</div>
            </div>

        </div>

		<?php include ("pie.php"); ?>

	</div>

</body>

</html>