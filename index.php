<?php
	include("conexion.php");

	$sql = $conexion->query("SELECT * FROM Noticias");
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

	<link rel="stylesheet" href="css/index.css">

	<!-- Favicons ================================================== -->
	<link rel="shortcut icon" href="img/favicon.ico">

	<!-- JS ================================================== -->

</head>

<body>

	<div id="contenedor">

		<!-- Include Encabezado -->
		<?php
		include("encabezado.php");
		?>

		<div id="galeria">

			<div id="animacion">

				<div class="contenedor3d">

					<div class="contenedor-boton">
						<div class="boton">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>


					<div class="contenedor-boton">
						<div class="boton">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>

					<div class="contenedor-boton">
						<div class="boton">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>

					<div class="contenedor-boton">
						<div class="boton">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>

				</div>

			</div>

			<div class="noticia">

				<div class="titulo_noticia">
					Título de la Noticia
				</div>

				<div class="descripcion_noticia">
					descripción noticia
					descripción noticia
					descripción noticia
					descripción noticia
					descripción noticia
					descripción noticia
					descripción noticia
					descripción noticia
				</div>

				<div class="parrafo_noticia">
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
					bla bla bla bla bla bla bla
				</div>

			</div>

		</div>

		<p class="limpiar"></p>

		<div id="contenido">

			<ul>

				<?php while ($fila=$sql -> fetch_array()) { ?>

				<li class="noticia">

					<div class="imagen">

						<img src="img/<?php echo $fila[1]; ?>" width="100%" height="100%" />

						<div class="lupa">
							<a href="#"></a>
						</div>
						<div class="detalles_foto">
							<a href="Detalles.php?Noticia=<?php echo $fila[0]; ?>"></a>
						</div>

					</div>

					<div class="texto">
						<span class="titulo_foto">
							<?php echo $fila[2]; ?>
						</span>
						<span class="texto_foto">
							<?php echo $fila[3]; ?>
						</span>
					</div>

				</li>

				<?php } ?>

			</ul>

		</div>

		<!-- Include Pie -->
		<?php
		include("pie.php");
		?>

	</div>

</body>

</html>