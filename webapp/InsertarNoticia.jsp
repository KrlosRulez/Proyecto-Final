<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Agregar Noticia</title>
	
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
	<h2>TABLA DE NOTICIAS</h2>
	</header>
	<nav>
		<ul>
			<li><a href="bbdd.jsp">Home |</a></li>
			<li><a href="ListarNoticia.jsp">Listar Noticias </a></li>
		</ul>
	</nav>
	<div id="contenedor">
		<center><h1>Añadir Noticia</h1></center>
		
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
		int codigo_juego = 0;
		
		// Llenar el ComboBox de los códigos de juego
		
		String QUERY_JUEGOS = "Select Codigo_Juego from Juegos";
		PS_Ajenas = conexion.prepareStatement(QUERY_JUEGOS);
		RS_Ajenas = PS_Ajenas.executeQuery();
		
		// Poner el código automático
		
		String QUERY_NOTICIAS = "Select Codigo_Noticia from Noticias";
		PS_Contador = conexion.prepareStatement(QUERY_NOTICIAS);
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
			
			String imagen = request.getParameter("img-noticia");
			String titulo = request.getParameter("titulo-noticia");
			String descripcion = request.getParameter("descripcion-noticia");
			int cod_juego = Integer.parseInt(request.getParameter("codigos"));
			
			String QUERY = "insert into Noticias (Codigo_Noticia, Imagen, Titulo_Una_Linea, Descripcion_Una_Linea, Codigo_Juego) VALUES (" + codigo + ",'" + imagen + "', '" + titulo + "','" + descripcion + "', " + cod_juego + "); ";			
			
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
		<form action="InsertarNoticia.jsp" method="post">
			<table border="1" align="center" class="tabla">
				<tr>
					<td>Imagen</td>
					<td>
					<input type="text" id="img-noticia" name="img-noticia" value="" maxlength="40" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Título</td>
					<td>
					<input type="text" id="titulo-noticia" name="titulo-noticia" value="" maxlength="40" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Descripción</td>
					<td>
					<input type="text" id="descripcion-noticia" name="descripcion-noticia" value="" maxlength="40" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Código Juego</td>
					<td>
					
						<label for="codigos"></label>
						<select id="codigos" name="codigos">
							<% while (RS_Ajenas.next() == true) { 
							   codigo_juego = RS_Ajenas.getInt("Codigo_Juego"); %>
								
							   <option value="<%=codigo_juego%>"><%=codigo_juego%></option>
								
							<% } %>
						</select>
					
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
				response.sendRedirect("ListarNoticia.jsp");
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