<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Agregar Comentario</title>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="css/estilos.css">
	<link rel="stylesheet" href="css/Insertar.css">

</head>
<body>
	<header>
	<h1>BASE DE DATOS MAQUINITAS</h1>
	<h2>TABLA DE COMENTARIOS</h2>
	</header>
	<nav>
		<ul>
			<li><a href="bbdd.jsp">Home |</a></li>
			<li><a href="ListarComentario.jsp">Listar Comentarios </a></li>
		</ul>
	</nav>
	<div id="contenedor">
		<center><h1>Añadir Comentario</h1></center>
		
		<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.Statement, java.sql.PreparedStatement" %>
		
		<%
		Connection conexion;
		String strcon = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conexion = DriverManager.getConnection(strcon);
		
		ResultSet RS_Ajenas = null;
		ResultSet RS_Contador = null;
		PreparedStatement PS_Ajenas = null;
		PreparedStatement PS_Contador = null;
		int codigo_post = 0;
		
		// Llenar el ComboBox de los códigos de juego
		
		String QUERY_POSTS = "Select Codigo_Post from Posts ORDER BY Codigo_Post";
		PS_Ajenas = conexion.prepareStatement(QUERY_POSTS);
		RS_Ajenas = PS_Ajenas.executeQuery();
		
		// Poner el código automático
		
		String QUERY_COMENTARIOS = "Select Codigo_Comentario from Comentarios";
		PS_Contador = conexion.prepareStatement(QUERY_COMENTARIOS);
		RS_Contador = PS_Contador.executeQuery();
		
		if(request.getParameter("btnenv") != null) {
			// objetos de enlace
			ResultSet RS = null;
			PreparedStatement PS = null;
						
			//cargando los campos a enviar
			
			int codigo = 1;
			
			while (RS_Contador.next() == true) { 
				   codigo++;
			}
			
			String texto = request.getParameter("texto-comentario");
			String fecha = request.getParameter("fecha-comentario");
			int cod_post = Integer.parseInt(request.getParameter("codigos"));
			String nombre = request.getParameter("nombre-usuario");
			String imagen = request.getParameter("imagen-usuario");
			
			String QUERY = "insert into Comentarios (Codigo_Comentario, Texto, Fecha, Codigo_Post, Nombre_Usuario, Imagen_Usuario) VALUES (" + codigo + ",'" + texto + "', '" + fecha + "'," + cod_post + ", '" + nombre + "', '" + imagen + "'); ";			
			
			System.out.println(QUERY);
			
			PS = conexion.prepareStatement(QUERY);
			
			try {
				// agregando (insert)
				PS.executeUpdate();
				//avisando que se hizo la instruccion
				out.println("REGISTRO INSERTADO");
			} 
			
			catch(SQLException e) {
				out.println(e);
			}
			
			try{
				PS.close();
			} 
			
			catch(SQLException e) {
				out.println(e);
			}
		}
		// construyendo form
		%>
		<form action="InsertarComentario.jsp" method="post">
			<table border="1" align="center" class="tabla">
				<tr>
					<td>Texto</td>
					<td>
					<input type="text" id="texto-comentario" name="texto-comentario" value="" maxlength="100" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Fecha</td>
					<td>
					<input type="date" id="fecha-comentario" name="fecha-comentario" value="" maxlength="40" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Código Post</td>
					<td>
					
						<label for="codigos"></label>
						<select id="codigos" name="codigos">
							<% while (RS_Ajenas.next() == true) { 
							   codigo_post = RS_Ajenas.getInt("Codigo_Post"); %>
								
							   <option value="<%=codigo_post%>"><%=codigo_post%></option>
								
							<% } %>
						</select>
					
					</td>
				</tr>
				<tr>
					<td>Nombre Usuario</td>
					<td>
					<input type="text" id="nombre-usuario" name="nombre-usuario" value="" maxlength="50" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Imagen Usuario</td>
					<td>
					<input type="text" id="imagen-usuario" name="imagen-usuario" value="" maxlength="50" class="controles"/>
					</td>
				</tr>
				<tr>
					<th colspan="2" align="center">
					<input type="submit" id="btnenv" name="btnenv" value="Agregar" class="botones"/>
					</th>
				</tr>
			</table>
		</form>
		<%
		
		if(request.getParameter("btnenv") != null) {
			
			try{
				conexion.close();
				response.sendRedirect("ListarComentario.jsp");
			} 
			
			catch(SQLException e) {
				out.println(e);
			}	
		
		}
		
		%>
		
	</div>
	<footer>
		<h3>Todos Los Derechos Reservados Por Maquinitas.com &copy;</h3>
	</footer>
</body>
</html>