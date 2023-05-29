<?php 

	include ("conexion.php"); 

    $cod_post = $_GET['Post'];

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

	<link rel="stylesheet" href="css/blog.css">
    <link rel="stylesheet" href="css/comentarios.css">

	<!-- Favicons ================================================== -->
	<link rel="shortcut icon" href="img/favicon.ico">

	<!-- JS ================================================== -->

</head>

<body>

	<div id="contenedor">

        <?php include ("encabezado.php"); ?>

        <div id="contenido">

            <div id="bloque-principal">

            <?php 

            $sql = $conexion->query("SELECT * FROM Posts JOIN Categorías ON Posts.Categoria=Categorías.Codigo_Categoria WHERE Codigo_Post = $cod_post");

            while ($fila=$sql -> fetch_array()) { 
            
            ?>

                <div class="articulo">

                    <div class="foto">
                        <img src="img/<?php echo $fila[1]; ?>" width="100%" height="100%">
                    </div>
                    <div class="titulo"><?php echo $fila[2]; ?></div>
                    <div class="texto">
                        <?php echo $fila[4]; ?>
                    </div>

                    <div class="datos">

                        <div class="fecha">
                            <div class="foto"></div>
                            <div class="numeros">
                                <?php

                                $fecha_mysql = $fila[5];
                                $fecha = strtotime($fecha_mysql);
                                echo date("d-m-Y", $fecha); 
                                
                                ?>
                            </div>
                        </div>

                        <div class="autor">
                            <div class="foto"></div>
                            <div class="nombre">
                                <?php echo $fila[3]; ?>
                            </div>
                        </div>

                        <div class="comentarios">
                            <div class="foto"></div>
                            <div class="cantidad">

                            <?php 

                            $cod_post = $fila[0];

                            $sql_comentarios = $conexion->query("SELECT COUNT(*) AS Numero_Comentarios FROM Comentarios WHERE Codigo_Post = $cod_post");

                            while ($fila_comentarios=$sql_comentarios -> fetch_array()) { 

                            ?>

                                <?php echo $fila_comentarios[0]; ?> Comentarios

                            <?php } ?>

                            </div>
                        </div>

                        <div class="etiquetas">
                            <div class="foto"></div>
                            <div class="nombres">
                                <?php echo $fila[8]; ?>
                            </div>
                        </div>

                    </div>
                </div>

                <?php } ?>

                <div class="comentarios">

                    <div class="titulo">
                        Comentarios
                    </div>

                    <?php 
                    
                    $sql = $conexion->query("SELECT * FROM Comentarios WHERE Codigo_Post = $cod_post  ORDER BY Fecha DESC");

                    while ($fila=$sql -> fetch_array()) {  

                    ?>

                    <div class="comentario">

                        <div class="foto">
                            <img src="img/<?php echo $fila[5]; ?>" width="100%" height="100%"/>
                        </div>

                        <div class="texto">
                            <?php echo $fila[1]; ?>
                        </div>

                        <div class="datos">

                            <div class="usuario">

                                <div class="foto"></div>

                                <div class="nombre">
                                    <?php echo $fila[4]; ?>
                                </div>

                            </div>

                            <div class="fecha">

                                <div class="foto"></div>

                                <div class="numeros">
                                    <?php 

                                    $fecha_mysql = $fila[2];
                                    $fecha = strtotime($fecha_mysql);
                                    echo date("d-m-Y", $fecha);  
                                    
                                    ?>
                                </div>

                            </div>

                        </div>

                    </div>

                    <?php } ?>

                </div>

            </div>

            <div id="bloque-secundario">

                <div class="barra">
                    
                    <form action="" method="post">

                        <p>
                      
                          <input type="search" name="busquedamusica" placeholder="Buscar">
                      
                          <input type="image" src="img/imagen-lupa.png">
                      
                        </p>
                      
                      </form>

                </div>

                <div class="categorias">

                    <div class="titulo">
                        Categorías
                    </div>

                    <?php 

                    $sql = $conexion->query("SELECT * FROM Categorías");

                    while ($fila=$sql -> fetch_array()) { 

                    ?>

                    <div class="nombre">
                        <div class="foto"></div>
                            <div class="categoria">
                                <a href="blog.php?categoria=<?php echo $fila[0]; ?>"><?php echo $fila[1]; ?></a>
                            </div>
                    </div>

                    <?php } ?>

                </div>

                <div class="posts">

                    <div class="titulo">
                        Posts Populares
                    </div>

                    <?php 

                    $sql = $conexion->query("SELECT * FROM Posts");

                    while ($fila=$sql -> fetch_array()) { 

                    ?>

                    <div class="post">
                        <div class="foto">
                            <img src="img/<?php echo $fila[1]; ?>" width="100%" height="100%">
                        </div>
                            <div class="nombre">
                                <a href="comentarios.php?Post=<?php echo $fila[0]; ?>">
                                    <?php echo $fila[2]; ?>
                                </a>
                            </div>
                            <div class="fecha">
                                Escrito el 
                                <?php 

                                $fecha_mysql = $fila[5];
                                $fecha = strtotime($fecha_mysql);
                                echo date("d-m-Y", $fecha); 
                                
                                ?>
                            </div>
                    </div>

                <?php } ?>

                </div>

                <div class="comentarios">

                    <div class="titulo">
                        Comentarios
                    </div>

                    <?php 

                    $sql = $conexion->query("SELECT * FROM Comentarios JOIN Posts ON Comentarios.Codigo_Post=Posts.Codigo_Post");

                    while ($fila=$sql -> fetch_array()) { 

                    ?>

                    <div class="post">
                        <div class="foto"></div>
                        <div class="nombre">
                            <a href="comentarios.php?Post=<?php echo $fila[3]; ?>">
                                <?php echo $fila[1]; ?>
                            </a>
                        </div>
                        <div class="nombre-post">
                            Escrito en "<?php echo $fila[8]; ?>"
                        </div>
                    </div>

                    <?php } ?>

                </div>

                <div class="video">

                    <div class="titulo">Video Widget</div>

                    <div class="widget">
                        <iframe width="378" height="245" src="https://www.youtube.com/embed/1INU3FOJsTw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>

                </div>

            </div>

        </div>

        <p class="limpiar"></p>

        <?php include ("pie.php"); ?>

	</div>

</body>

</html>