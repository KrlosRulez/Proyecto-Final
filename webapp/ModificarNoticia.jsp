<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Editar Noticias</title>
		
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
			<h2>TABLA DE NOTICIAS</h2>
		</header>
		<nav>
			<ul>
				<li><a href="bbdd.jsp">Home |</a></li>
				<li><a href="ListarNoticia.jsp">Listar Noticias</a></li>
			</ul>
		</nav>
			<div id="contenedor">
				<center><h1>Editar Noticia</h1></center>
				<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.PreparedStatement" %>
				<%
				
				int codigo_juego; // Variable para el ComboBox con claves ajenas
				
				if (request.getParameter("btnenv") != null) {
					// objetos de enlace
					Connection conexion = null;
					ResultSet RS = null;
					PreparedStatement PS = null;
					
					String STR_CON = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";
					
					try {
						
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						conexion = DriverManager.getConnection(STR_CON);
						
						int codigo = Integer.parseInt(request.getParameter("codigo-noticia"));
						String imagen = request.getParameter("img-noticia");
						String titulo = request.getParameter("titulo-noticia");
						String descripcion = request.getParameter("descripcion-noticia");
						int cod_juego = Integer.parseInt(request.getParameter("codigos"));
						
						String QUERY_UPDATE = "UPDATE Noticias SET Imagen = '" + imagen + "', Titulo_Una_Linea = '" + titulo + "', Descripcion_Una_Linea = '" + descripcion + "', Codigo_Juego = " + cod_juego + " WHERE Codigo_Noticia = " + codigo;
						
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
						response.sendRedirect("ListarNoticia.jsp");
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
						
						// Llenar el ComboBox con los códigos de la tabla Juegos
						String QUERY_JUEGOS = "Select Codigo_Juego from Juegos";
						PS_Ajenas = conexion.prepareStatement(QUERY_JUEGOS);
						RS_Ajenas = PS_Ajenas.executeQuery();
						
						int codigo_url = Integer.parseInt(request.getParameter("codigo_noticia"));
						String QUERY_SELECT = "select * from Noticias where Codigo_Noticia = " + codigo_url;
						
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
				
				<form action="ModificarNoticia.jsp" method="post">
					<table border="1" align="center" class="tabla">
						<tr>
							<td width="200px">Código</td>
							<td width="300px">
								<input type="text" name="codigo-noticia" id="codigo-noticia" value="<%= RS.getInt("Codigo_Noticia") %>" maxlength="5" class="controles" readonly/>
							</td>
						</tr>
						<tr>
							<td width="200px">Imagen</td>
							<td width="300px">
								<input type="text" id="img-noticia" name="img-noticia" value="<%= RS.getString("Imagen") %>" maxlength="50" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Título</td>
							<td width="300px">
								<input type="text" id="titulo-noticia" name="titulo-noticia" value="<%= RS.getString("Titulo_Una_Linea") %>" maxlength="40" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Descripción</td>
							<td width="300px">
							<input type="text" id="descripcion-noticia" name="descripcion-noticia" value="<%= RS.getString("Descripcion_Una_Linea") %>" maxlength="50" class="controles"/>
							</td>
						</tr>
						<tr>
							<td width="200px">Código Juego</td>
							<td>
							
							<!-- ComboBox Con códigos de la tabla juegos -->
								<label for="codigos"></label>
								<select id="codigos" name="codigos" >
									<% while (RS_Ajenas.next() == true) { 
										codigo_juego = RS_Ajenas.getInt("Codigo_Juego"); %>
										
										<option <% if (RS.getInt("Codigo_Juego") == codigo_juego) {%> selected <%}%> value="<%=codigo_juego%>"><%=codigo_juego%></option>
								
										
									<% } %>
								</select>
							
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