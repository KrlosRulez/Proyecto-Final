<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Proyecto 1DAW - SOLVAM</title>

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">

	<!-- CSS ================================================== -->
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/encabezado.css">
	<link rel="stylesheet" href="css/pie.css">

	<link rel="stylesheet" href="css/Login.css">

	<!-- Favicons ================================================== -->
	<link rel="shortcut icon" href="img/favicon.ico">

	<!-- JS ================================================== -->

</head>

<body>

	<div id="contenedor">

		<div id="encabezado">

		    <div id="logo">
		        <img src="img/logo-pagina.png" height="55px" />
		        <p><a href="../index.php">Maquinitas.com</a></p>
		    </div>
		
		    <div id="menu">
		
		        <ul id="menu_principal">
		
		            <li>
		                <a href="https://www.game.es/buscar/CONSOLAS" target="_blank">
		                    <span>Consolas</span>
		                </a>
		                <div class="panel">
		                    <ul class="submenu">
		                        <li>
		                            <a href="https://www.playstation.com/es-es/ps4/?emcid=pa-co-422218&gad=1&gclid=EAIaIQobChMIjuvihdaT_wIVoeDmCh2SLwfjEAAYASAAEgJyavD_BwE&gclsrc=aw.ds" target="_blank">
		                                <span>PlayStation 4</span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="https://www.game.es/buscar/consola-xbox-360" target="_blank">
		                                <span>Xbox 360</span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="https://www.nintendo.es/Wii/Wii-94559.html" target="_blank">
		                                <span>Nintendo Wii</span>
		                            </a>
		                        </li>
		                    </ul>
		                </div>
		            </li>
		
		            <li>
		                <a href="https://www.game.es/VIDEOJUEGOS" target="_blank"><span>Juegos</span></a>
		                <div class="panel">
		                    <ul class="submenu">
		                        <li>
		                            <a href="https://store.playstation.com/es-es/product/EP9000-CUSA01715_00-0000GODOFWAR3PS4" target="_blank">
		                                <span>God of War</span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="https://vandal.elespanol.com/juegos/ps3/tomb-raider/13671#p-41" target="_blank">
		                                <span>Tomb Raider</span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="https://vandal.elespanol.com/sagas/prototype" target="_blank">
		                                <span>Prototype</span>
		                            </a>
		                        </li>
		                    </ul>
		                </div>
		            </li>
		
		            <li>
		                <a href="https://computerhoy.com/reportajes/mejores-consolas-portatiles-ofertas-descuentos-915015" target="_blank"><span>Portables</span></a>
		                <div class="panel">
		                    <ul class="submenu">
		                        <li>
		                            <a href="https://www.amazon.es/PS-Vita-Consola-Negra-WIFI-1004/dp/B004L2KWIS" target="_blank">
		                                <span>PS Vita</span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="https://www.nintendo.es/Wii-U/Wii-U-344102.html" target="_blank">
		                                <span>Wii U</span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="https://www.nintendo.es/Nintendo-DS/Gama-de-consolas-Nintendo-DS-Pagina-web-oficial-de-Nintendo-Iberica-Nintendo-DS-Nintendo-DSi-Nintendo-DSi-XL-116380.html" target="_blank">
		                                <span>Nintendo DS</span>
		                            </a>
		                        </li>
		                    </ul>
		                </div>
		            </li>
		
		            <li>
		                <a href="../blog.php"><span>Blog</span></a>
		            </li>
		
		            <li>
		                <a href="../Contacto.php"><span>Contacto</span></a>
		            </li>
		
		            <li>
		                <a href="http://tela.com.es:8080/tela/Trabajo_Final/webapp/validacion.jsp"><span>Iniciar Sesión</span></a>
		            </li>
		
		        </ul>
		
		    </div>
		
		</div>

		<p class="limpiar"></p>

        <div id="contenido">

            <h1>Iniciar Sesión</h1><br />

            <form action="validacion.jsp" method="post">
                <span>Usuario:</span><input type="text" name="nombre"><br /><br />
                <span>Contraseña:</span><input type="password" name="pass" ><br /><br />
                <input type="submit" value="Entrar"> 
            </form>

			<%
                String Usuario = "alumno";
                String Contraseña = "alumno1234";
                
                if (request.getParameter("nombre") != null && request.getParameter("pass") != null) {
                	if (request.getParameter("nombre").equals(Usuario) &&
                		request.getParameter("pass").equals(Contraseña)) { 
            %>    			
                		<% response.sendRedirect("bbdd.jsp"); %>
            
            <%    		
                	} else {
            %>
            			<p class="aviso">Usuario o Contraseña Incorrectos</p>
            <%    		
                	}
            
                }
            %>

        </div>

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
		
		        <div class="nombre-post">
		            <a href="#">
		                Posts
		            </a>    
		        </div>
		
		    </div>
		
		    <div class="galeria">
		        <iframe width="368" height="200" src="https://www.youtube.com/embed/W78jqH6skjI" title="YouTube video player"
		            frameborder="0"
		            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
		            allowfullscreen></iframe>
		    </div>
		
		    <div class="social">
		
		        <a href="#">
		            <div class="facebook"></div>
		        </a>
		
		        <a href="#">
		            <div class="twitter"></div>
		        </a>
		
		        <a href="#">
		            <div class="baloncesto"></div>
		        </a>
		
		        <a href="#">
		            <div class="wifi"></div>
		        </a>
		
		        <a href="#">
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
		                    <a href="../blog.php">Blog</a>
		                </li>
		                <li>
		                    <a href="../Contacto.php">Contacto</a>
		                </li>
		            </ul>
		        </div>
		
		    </div>
		
		</div>

	</div>

</body>

</html>