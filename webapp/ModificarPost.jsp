<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Editar Posts</title>
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">

		<link rel="stylesheet" href="css/estilos.css">
		<link rel="stylesheet" href="css/Modificar.css">
	</head>
	<body>
		<header>
			<h1>BASE DE DATOS MAQUINITAS</h1>
			<h2>TABLA DE POSTS</h2>
		</header>
		<nav>
			<ul>
				<li><a href="bbdd.jsp">Home |</a></li>
				<li><a href="ListarPost.jsp">Listar Posts</a></li>
			</ul>
		</nav>
			<div id="contenedor">
				<center><h1>Editar Post</h1></center>
				<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.PreparedStatement" %>
				<%
				
				int codigo_categoria; // Variable para el ComboBox con claves ajenas
				String nombre_categoria;
				
				if (request.getParameter("btnenv") != null) {
					// objetos de enlace
					Connection conexion = null;
					ResultSet RS = null;
					PreparedStatement PS = null;
					
					String STR_CON = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";
					
					try {
						
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						conexion = DriverManager.getConnection(STR_CON);
						
						int codigo = Integer.parseInt(request.getParameter("codigo-post"));
						String imagen = request.getParameter("img-post");
						String titulo = request.getParameter("titulo-post");
						String autor = request.getParameter("autor-post");
						String descripcion = request.getParameter("descripcion-post");
						String fecha = request.getParameter("fecha-post");
						int cod_categoria = Integer.parseInt(request.getParameter("codigos"));
						int visitas = Integer.parseInt(request.getParameter("visitas-post"));
						
						String QUERY_UPDATE = "UPDATE Posts SET Imagen = '" + imagen + "', Titulo = '" + titulo + "', Autor = '" + autor + "', Descripcion = '" + descripcion + "', Fecha = '" + fecha + "', Categoria = " + cod_categoria + ", Visitas = " + visitas + " WHERE Codigo_Post = " + codigo;
						
						PS = conexion.prepareStatement(QUERY_UPDATE);
					} 
					
					catch (java.lang.ClassNotFoundException e) {
						
					} 
					
					catch (SQLException e) {
						
					};
					
					try {
						PS.executeUpdate();
					} 
					
					catch (SQLException e) {
						out.println(e);
					};
						
					try {
						PS.close();
						conexion.close();
						response.sendRedirect("ListarPost.jsp");
					} 
					
					catch (SQLException e) {
						out.println(e);
					};
					
				} else {
					Connection conexion = null;
					ResultSet RS = null;
					PreparedStatement PS = null;
					
					ResultSet RS_Ajenas = null;
					PreparedStatement PS_Ajenas = null;
					
					String STR_CON = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";
					
					try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						conexion = DriverManager.getConnection(STR_CON);
						
						//System.out.println("Bien 1");
						
						// Llenar el ComboBox 
						String QUERY_CATEGORIAS = "Select * from Categorías";
						PS_Ajenas = conexion.prepareStatement(QUERY_CATEGORIAS);
						RS_Ajenas = PS_Ajenas.executeQuery();
						
						//System.out.println("Bien 2");
						
						int codigo_url = Integer.parseInt(request.getParameter("codigo_post"));
						String QUERY_SELECT = "select * from Posts where Codigo_Post = " + codigo_url;
						
						//System.out.println("Bien 3");
						
						PS = conexion.prepareStatement(QUERY_SELECT);
						
						//System.out.println("Bien 4");
					} 
					
					catch (java.lang.ClassNotFoundException e) {
						//System.out.println("ClassNotFoundException");
					} 
					
					catch (SQLException e) {
						//System.out.println("SQLException");
					};
					
					try { 
						RS = PS.executeQuery();
						while(RS.next() == true) {
				%>
				
				<form action="ModificarPost.jsp" method="post">
					<table border="1" align="center" class="tabla">
						<tr>
							<td width="200px">Código</td>
							<td width="300px">
								<input type="text" name="codigo-post" id="codigo-post" value="<%= RS.getInt("Codigo_Post") %>" maxlength="5" class="controles" readonly/>
							</td>
						</tr>
						<tr>
							<td width="200px">Imagen</td>
							<td width="300px">
								<input type="text" id="img-post" name="img-post" value="<%= RS.getString("Imagen") %>" maxlength="50" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Título</td>
							<td width="300px">
								<input type="text" id="titulo-post" name="titulo-post" value="<%= RS.getString("Titulo") %>" maxlength="50" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Autor</td>
							<td width="300px">
								<input type="text" id="autor-post" name="autor-post" value="<%= RS.getString("Autor") %>" maxlength="50" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Texto</td>
							<td width="300px">
							<input type="text" id="descripcion-post" name="descripcion-post" value="<%= RS.getString("Descripcion") %>" maxlength="400" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Fecha</td>
							<td width="300px">
								<input type="date" id="fecha-post" name="fecha-post" value="<%= RS.getDate("Fecha") %>" maxlength="40" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Categoría</td>
							<td>
							
								<label for="codigos"></label>
								<select id="codigos" name="codigos" >
									<% while (RS_Ajenas.next() == true) { 
										codigo_categoria = RS_Ajenas.getInt("Codigo_Categoria"); 
										nombre_categoria = RS_Ajenas.getString("Nombre_Categoria"); %>
										
										<option <% if (RS.getInt("Categoria") == codigo_categoria) {%> selected <%}%> value="<%=codigo_categoria%>"><%=nombre_categoria%></option>
								
										
									<% } %>
								</select>
							
							</td>
						</tr>
						<tr>
							<td width="200px">Visitas</td>
							<td width="300px">
								<input type="text" id="visitas-post" name="visitas-post" value="<%= RS.getInt("Visitas") %>" maxlength="40" class="controles"/>
							</td>
						</tr>
						<tr>
							<th colspan="2" align="center">
								<input type="submit" id="btnenv" name="btnenv" value="Editar" class="botones"/>
							</th>
						</tr>
					</table>
				</form>
				
				<%
						}
					} 
						
					catch (SQLException e) {
						out.println(e);
					};
				
				};
				%>
		</div>
		<footer>
			<h3>Todos Los Derechos Reservados Por Maquinitas &copy;</h3>
		</footer>
	</body>
</html>