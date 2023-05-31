<?php 

	include ("conexion.php"); 

?>

<div id="pie">
    <div class="nosotros">
        <div class="logo">
            <img src="img/logo-pagina.png" height="50px" />
            <p>Maquinitas.com</p>
        </div>
        <div class="direccion">
            <p>
                Calle Street, 106<br />
                Avnd. Hijos de P
            </p>
        </div>
    </div>

    <div class="mapa">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3171.408766278483!2d-5.9843270242042506!3d37.356503672093716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd126e7f03d8309f%3A0x5c813182e6db9555!2sEstadio%20Benito%20Villamar%C3%ADn!5e0!3m2!1ses!2ses!4v1684344864895!5m2!1ses!2ses"
            width="240" height="200" style="border:0;" allowfullscreen="" loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

    <div class="posts">
        <div class="titulo">Últimos Posts</div>

        <?php 

        $contador = 0;

		$sql = $conexion->query("SELECT * FROM Posts ORDER BY Fecha DESC");

		while ($fila=$sql -> fetch_array()) { 

        if ($contador < 4) {
        
        ?>

        <div class="nombre-post">
            <a href="comentarios.php?Post=<?php echo $fila[0]; ?>">
                <?php echo $fila[2]; ?>
            </a>    
        </div>

        <?php 
            $contador++;
        }

        }   
        ?>

    </div>

    <div class="galeria">
        <iframe width="368" height="200" src="https://www.youtube.com/embed/W78jqH6skjI" title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            allowfullscreen></iframe>
    </div>

    <div class="social">

        <a href="https://es-es.facebook.com/">
            <div class="facebook"></div>
        </a>

        <a href="https://twitter.com/?lang=es">
            <div class="twitter"></div>
        </a>

        <a href="http://www.todobasket.es/">
            <div class="baloncesto"></div>
        </a>

        <a href="https://socialwifi.com/es/">
            <div class="wifi"></div>
        </a>

        <a href="https://ilmaistro.com/geni-crea-tu-arbol-genealogico-y-tu-red-social/">
            <div class="arbol"></div>
        </a>


    </div>

    <div class="menu">

        <div class="copyright">
            <a href="#">
                <p>Copyright 2023 Maquinitas.com | All Rights Reserved</p>
            </a>
        </div>

        <div class="menu_inferior">
            <ul>
                <li>
                    <a href="https://www.game.es/buscar/CONSOLAS" target="_blank">Consolas</a>
                </li>
                <li>
                    <a href="https://www.game.es/VIDEOJUEGOS" target="_blank">Juegos</a>
                </li>
                <li>
                    <a href="https://computerhoy.com/reportajes/mejores-consolas-portatiles-ofertas-descuentos-915015" target="_blank">Portables</a>
                </li>
                <li>
                    <a href="blog.php">Blog</a>
                </li>
                <li>
                    <a href="Contacto.php">Contacto</a>
                </li>
            </ul>
        </div>

    </div>

</div>