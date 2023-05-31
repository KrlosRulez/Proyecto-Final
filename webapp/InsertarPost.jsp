<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Agregar Post</title>
	
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
	<h2>TABLA DE POSTS</h2>
	</header>
	<nav>
		<ul>
			<li><a href="bbdd.jsp">Home |</a></li>
			<li><a href="ListarPost.jsp">Listar Posts </a></li>
		</ul>
	</nav>
	<div id="contenedor">
		<center><h1>Añadir Post</h1></center>
		
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
		int codigo_categoria = 0;
		String nombre_categoria = "";
		
		// Llenar el ComboBox
		
		String QUERY_CATEGORIAS = "Select * from Categorías";
		PS_Ajenas = conexion.prepareStatement(QUERY_CATEGORIAS);
		RS_Ajenas = PS_Ajenas.executeQuery();
		
		// Poner el código automático
		
		String QUERY_POSTS = "Select Codigo_Post from Posts";
		PS_Contador = conexion.prepareStatement(QUERY_POSTS);
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
			
			String imagen = request.getParameter("img-post");
			String titulo = request.getParameter("titulo-post");
			String autor = request.getParameter("autor-post");
			String descripcion = request.getParameter("descripcion-post");
			String fecha = request.getParameter("fecha-post");
			int cod_categoria = Integer.parseInt(request.getParameter("codigos"));
			int visitas = Integer.parseInt(request.getParameter("visitas-post"));
			
			String QUERY = "insert into Posts (Codigo_Post, Imagen, Titulo, Autor, Descripcion, Fecha, Categoria, Visitas) VALUES (" + codigo + ",'" + imagen + "', '" + titulo + "','" + autor + "', '" + descripcion + "', '" + fecha + "', " + cod_categoria + ", " + visitas + "); ";			
			
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
		<form action="InsertarPost.jsp" method="post">
			<table border="1" align="center" class="tabla">
				<tr>
					<td>Imagen</td>
					<td>
					<input type="text" id="img-post" name="img-post" value="" maxlength="50" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Título</td>
					<td>
					<input type="text" id="titulo-post" name="titulo-post" value="" maxlength="50" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Autor</td>
					<td>
					<input type="text" id="autor-post" name="autor-post" value="" maxlength="50" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Texto</td>
					<td>
					<input type="text" id="descripcion-post" name="descripcion-post" value="" maxlength="400" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Fecha</td>
					<td>
					<input type="date" id="fecha-post" name="fecha-post" value="" maxlength="40" class="controles"/>
					</td>
				</tr>
				<tr>
					<td>Categoría</td>
					<td>
					
						<label for="codigos"></label>
						<select id="codigos" name="codigos">
							<% while (RS_Ajenas.next() == true) { 
							   codigo_categoria = RS_Ajenas.getInt("Codigo_Categoria"); 
							   nombre_categoria = RS_Ajenas.getString("Nombre_Categoria"); %>
								
							   <option value="<%=codigo_categoria%>"><%=nombre_categoria%></option>
								
							<% } %>
						</select>
					
					</td>
				</tr>
				<tr>
					<td>Visitas</td>
					<td>
					<input type="text" id="visitas-post" name="visitas-post" value="" maxlength="40" class="controles"/>
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
				response.sendRedirect("ListarPost.jsp");
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