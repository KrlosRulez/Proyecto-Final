<?php
	include("conexion.php");

	
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

				<?php 
				
				$sql = $conexion->query("SELECT * FROM Juegos WHERE Visitas = (SELECT MAX(Visitas) FROM Juegos)");
				
				while ($fila=$sql -> fetch_array()) { 
					
				?>

				<div class="titulo_noticia">
					<?php echo $fila[2]; ?>
				</div>

				<div class="descripcion_noticia">
					<?php echo $fila[3]; ?>
				</div>

				<div class="parrafo_noticia">
					<?php echo $fila[4]; ?>
				</div>

				<div class="boton-mas">

					<div class="foto"></div>
					<div class="texto">
						<a href="Detalles.php?Juego=<?php echo $fila[0]; ?>">
							Más...
						</a>
					</div>

				</div>

			</div>

			<?php } ?>

		</div>

		<p class="limpiar"></p>

		<div id="contenido">

			<ul>

				<?php 
				
				$sql = $conexion->query("SELECT * FROM Noticias");
				
				while ($fila=$sql -> fetch_array()) { 
					
				?>

				<li class="noticia">

					<div class="imagen">

						<img src="img/<?php echo $fila[1]; ?>" width="100%" height="100%" />

						<div class="lupa">
							<a href="#"></a>
						</div>
						<div class="detalles_foto">
							<a href="Detalles.php?Juego=<?php echo $fila[4]; ?>"></a>
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