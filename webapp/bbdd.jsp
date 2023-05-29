<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Elegir Tabla</title>

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/bbdd.css">
</head>
<body>
	
	<div class="menu">
		
		<ul id="menu_principal">

            <li>
                <span>Noticias</span>
                <div class="panel">
                    <ul class="submenu">
                        <li>
                            <a href="InsertarNoticia.jsp">
                                <span>Insertar</span>
                            </a>
                        </li>

                        <li>
                            <a href="ListarNoticia.jsp">
                                <span>Listar</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

		    <li>
                <span>Juegos</span>
                <div class="panel">
                    <ul class="submenu">
                        <li>
                            <a href="InsertarJuego.jsp">
                                <span>Insertar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ModificarJuego.jsp">
                                <span>Modificar</span>
                            </a>
                        </li>
                        <li>
                            <a href="BorrarJuego.jsp">
                                <span>Borrar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ListarJuego.jsp">
                                <span>Listar</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            
            <li>
                <span>Posts</span>
                <div class="panel">
                    <ul class="submenu">
                        <li>
                            <a href="InsertarPost.jsp">
                                <span>Insertar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ModificarPost.jsp">
                                <span>Modificar</span>
                            </a>
                        </li>
                        <li>
                            <a href="BorrarPost.jsp">
                                <span>Borrar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ListarPost.jsp">
                                <span>Listar</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            
            <li>
                <span>Categorías</span>
                <div class="panel">
                    <ul class="submenu">
                        <li>
                            <a href="InsertarCategoria.jsp">
                                <span>Insertar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ModificarCategoria.jsp">
                                <span>Modificar</span>
                            </a>
                        </li>
                        <li>
                            <a href="BorrarCategoria.jsp">
                                <span>Borrar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ListarCategoria.jsp">
                                <span>Listar</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            
            <li>
                <span>Comentarios</span>
                <div class="panel">
                    <ul class="submenu">
                        <li>
                            <a href="InsertarComentario.jsp">
                                <span>Insertar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ModificarComentario.jsp">
                                <span>Modificar</span>
                            </a>
                        </li>
                        <li>
                            <a href="BorrarComentario.jsp">
                                <span>Borrar</span>
                            </a>
                        </li>
                        <li>
                            <a href="ListarComentario.jsp">
                                <span>Listar</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

        </ul>
		
	</div>
	
</body>
</html>