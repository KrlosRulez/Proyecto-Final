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
			<h2>TABLA DE NOTICIAS</h2>
		</header>
		<nav>
			<ul>
				<li><a href="bbdd.jsp">Home | </a></li>
				<li><a href="InsertarNoticia.jsp">Añadir Noticia</a></li>
			</ul>
		</nav>
		
		<div id="contenedor">
			<center><h1> Lista De Noticias </h1></center>
			<%@ page import="java.io.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.PreparedStatement" %>
			<%
			// objetos de enlace
			Connection conexion = null;
			ResultSet RS = null;
			PreparedStatement PS = null;
			String strcon = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conexion = DriverManager.getConnection(strcon);
			String QUERY = "Select * from Noticias";
			PS = conexion.prepareStatement(QUERY);
			RS = PS.executeQuery();
			
			%>
			<table align="center" class="tabla">
			<tr>
				<td>Código</td>
				<td>Imagen</td>
				<td>Título</td>
				<td>Descripción</td>
				<td>Código Juego</td>
				<td colspan="2"></td>
			</tr>
			<% while(RS.next() == true){ %>
			<tr>
				<td><%=RS.getInt("Codigo_Noticia") %></td>
				<td><%=RS.getString("Imagen") %></td>
				<td><%=RS.getString("Titulo_Una_Linea") %></td>
				<td><%=RS.getString("Descripcion_Una_Linea") %></td>
				<td><%=RS.getInt("Codigo_Juego") %></td>
				<td>
					<a href="ModificarNoticia.jsp?codigo_noticia=<%=RS.getInt("Codigo_Noticia") %>">Editar</a>
				</td>
				<td>
					<a href="BorrarNoticia.jsp?codigo_noticia=<%=RS.getInt("Codigo_Noticia") %>">Eliminar</a>
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