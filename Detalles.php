<?php 
	include ("conexion.php"); 

	$cod_noticia = $_GET['Noticia'];

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

		<?php 
		
		$sql = $conexion->query("SELECT * FROM Juegos WHERE Codigo_Juego = $cod_noticia");

		while ($fila=$sql -> fetch_array()) { 
			
		?>

            <div class="foto">
				<img src="img/<?php echo $fila[1]; ?>" width="100%" height="100%">
			</div>

            <div class="textos">

                <div class="titulo"><?php echo $fila[2]; ?></div>
				<div class="descripcion-corta">
					<?php echo $fila[3]; ?>
				</div>
				<div class="descripcion-larga">
					<?php echo $fila[4]; ?>
				</div>
				<div class="informacion">
					<div class="nombre-juego">
						JUEGO: <?php echo $fila[5]; ?>
					</div>
					<div class="consola">
						CONSOLAS: <?php echo $fila[6]; ?>
					</div>
					<div class="genero">
						GÉNERO: <?php echo $fila[7]; ?>
					</div>
					<div class="fecha">
						FECHA DE LANZAMIENTO: 
						<?php 
						
						$fecha_mysql = $fila[8];
						$fecha = strtotime($fecha_mysql);
						echo date("d-m-Y", $fecha); 
						
						?>
					</div>
					<div class="estudio">
						ESTUDIO: <?php echo $fila[9]; ?>
					</div>
				</div>
				<div class="botones">
					<div class="mas-info">
						<a href="#">
							<p>Más Información...</p>
						</a>
					</div>
					<div class="volver">
						<a href="index.php">
							<div class="imagen"></div>
							<p>Volver...</p>
						</a>
					</div>
				</div>
            </div>

        </div>

		<?php } ?>

		<?php include ("pie.php"); ?>

	</div>

</body>

</html>