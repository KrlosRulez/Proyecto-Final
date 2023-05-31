<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Lista de Noticias</title>

		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
	    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">

		<link rel="stylesheet" href="css/estilos.css">
		<link rel="stylesheet" href="css/Listar.css">

	</head>
	<body>
		<header>
			<h1>BASE DE DATOS MAQUINITAS</h1>
			<h2>TABLA DE COMENTARIOS</h2>
		</header>
		<nav>
			<ul>
				<li><a href="bbdd.jsp">Home | </a></li>
				<li><a href="InsertarComentario.jsp">Añadir Comentario</a></li>
			</ul>
		</nav>
		
		<div id="contenedor">
			<center><h1> Lista De Comentarios </h1></center>
			<%@ page import="java.io.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.PreparedStatement" %>
			<%
			// objetos de enlace
			Connection conexion = null;
			ResultSet RS = null;
			PreparedStatement PS = null;
			String strcon = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conexion = DriverManager.getConnection(strcon);
			String QUERY = "Select * from Comentarios";
			PS = conexion.prepareStatement(QUERY);
			RS = PS.executeQuery();
			
			%>
			<table align="center" class="tabla">
			<tr>
				<td>Código</td>
				<td>Texto</td>
				<td>Fecha</td>
				<td>Código Post</td>
				<td>Nombre Usuario</td>
				<td>Imagen Usuario</td>
				<td colspan="2" class="vacio"></td>
			</tr>
			<% while(RS.next() == true){ %>
			<tr>
				<td><%=RS.getInt("Codigo_Comentario") %></td>
				<td><%=RS.getString("Texto") %></td>
				<td><%=RS.getString("Fecha") %></td>
				<td><%=RS.getInt("Codigo_Post") %></td>
				<td><%=RS.getString("Nombre_Usuario") %></td>
				<td><%=RS.getString("Imagen_Usuario") %></td>
				<td>
					<a href="ModificarComentario.jsp?codigo_comentario=<%=RS.getInt("Codigo_Comentario") %>">Editar</a>
				</td>
				<td>
					<a href="BorrarComentario.jsp?codigo_comentario=<%=RS.getInt("Codigo_Comentario") %>">Eliminar</a>
				</td>
			</tr>
			<% } %>
			</table>
			<%
			try{
				RS.close();
				PS.close();
				conexion.close();
			} 
			
			catch(SQLException e) {
				out.println(e);
			}
			%>
		</div>
		<footer>
			<h3>Todos Los Derechos Reservados Por Maquinitas.com &copy;</h3>
		</footer>
	</body>
</html>