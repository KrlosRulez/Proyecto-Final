<?php 

	include ("conexion.php"); 

    $cod_noticia = $_GET['Noticia'];

?>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">

    <title>Proyecto 1DAW - SOLVAM</title>

    <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/imagen.css">

</head>

<body>

    <div id="foto">

        <?php 

        $sql = $conexion->query("SELECT Imagen FROM Noticias WHERE Codigo_Noticia = $cod_noticia");

        while ($fila=$sql -> fetch_array()) { 

        ?>

        <img src="img/<?php echo $fila[0]; ?>" width="100%" height="100%">

        <?php } ?>

    </div>

</body>

</html>