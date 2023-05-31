<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Editar Comentarios</title>
		
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
			<h2>TABLA DE COMENTARIOS</h2>
		</header>
		<nav>
			<ul>
				<li><a href="bbdd.jsp">Home |</a></li>
				<li><a href="ListarComentario.jsp">Listar Comentarios</a></li>
			</ul>
		</nav>
			<div id="contenedor">
				<center><h1>Editar Comentario</h1></center>
				<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.PreparedStatement" %>
				<%
				
				int codigo_post; // Variable para el ComboBox con claves ajenas
				
				if (request.getParameter("btnenv") != null) {
					// objetos de enlace
					Connection conexion = null;
					ResultSet RS = null;
					PreparedStatement PS = null;
					
					String STR_CON = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";
					
					try {
						
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						conexion = DriverManager.getConnection(STR_CON);
						
						int codigo = Integer.parseInt(request.getParameter("codigo-comentario"));
						String texto = request.getParameter("texto-comentario");
						String fecha = request.getParameter("fecha-comentario");
						int cod_post = Integer.parseInt(request.getParameter("codigos"));
						String nombre = request.getParameter("nombre-usuario");
						String imagen = request.getParameter("imagen-usuario");
						
						String QUERY_UPDATE = "UPDATE Comentarios SET Texto = '" + texto + "', Fecha = '" + fecha + "', Codigo_Post = " + cod_post + ", Nombre_Usuario = '" + nombre + "', Imagen_Usuario = '" + imagen + "' WHERE Codigo_Comentario = " + codigo;
						
						System.out.println(QUERY_UPDATE);
						
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
						response.sendRedirect("ListarComentario.jsp");
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
						
						// Llenar el ComboBox 
						String QUERY_POSTS = "Select Codigo_Post from Posts ORDER BY Codigo_Post";
						PS_Ajenas = conexion.prepareStatement(QUERY_POSTS);
						RS_Ajenas = PS_Ajenas.executeQuery();
						
						int codigo_url = Integer.parseInt(request.getParameter("codigo_comentario"));
						String QUERY_SELECT = "select * from Comentarios where Codigo_Comentario = " + codigo_url;
						
						PS = conexion.prepareStatement(QUERY_SELECT);
					} 
					
					catch (java.lang.ClassNotFoundException e) {
						
					} 
					
					catch (SQLException e) {
						
					};
					
					try { 
						RS = PS.executeQuery();
						while(RS.next() == true) {
				%>
				
				<form action="ModificarComentario.jsp" method="post">
					<table border="1" align="center" class="tabla">
						<tr>
							<td width="200px">Código</td>
							<td width="300px">
								<input type="text" name="codigo-comentario" id="codigo-comentario" value="<%= RS.getInt("Codigo_Comentario") %>" maxlength="5" class="controles" readonly/>
							</td>
						</tr>
						<tr>
							<td width="200px">Texto</td>
							<td width="300px">
								<input type="text" id="texto-comentario" name="texto-comentario" value="<%= RS.getString("Texto") %>" maxlength="100" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Fecha</td>
							<td width="300px">
								<input type="date" id="fecha-comentario" name="fecha-comentario" value="<%= RS.getDate("Fecha") %>" maxlength="40" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Código Post</td>
							<td>
							
								<label for="codigos"></label>
								<select id="codigos" name="codigos" >
									<% while (RS_Ajenas.next() == true) { 
										codigo_post = RS_Ajenas.getInt("Codigo_Post"); %>
										
										<option <% if (RS.getInt("Codigo_Post") == codigo_post) {%> selected <%}%> value="<%=codigo_post%>"><%=codigo_post%></option>
								
										
									<% } %>
								</select>
							
							</td>
						</tr>
						<tr>
							<td width="200px">Nombre Usuario</td>
							<td width="300px">
							<input type="text" id="nombre-usuario" name="nombre-usuario" value="<%= RS.getString("Nombre_Usuario") %>" maxlength="50" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Imagen Usuario</td>
							<td width="300px">
							<input type="text" id="imagen-usuario" name="imagen-usuario" value="<%= RS.getString("Imagen_Usuario") %>" maxlength="50" class="controles"/>
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