<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.PreparedStatement" %>

<% 

int Codigo_Noticia = Integer.parseInt(request.getParameter("codigo_noticia"));

// objetos de enlace
Connection conexion = null;
PreparedStatement PS = null;
String strcon = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";

Class.forName("com.mysql.jdbc.Driver").newInstance();
conexion = DriverManager.getConnection(strcon);
String QUERY = "delete from Noticias where Codigo_Noticia = " + Codigo_Noticia;
PS = conexion.prepareStatement(QUERY);
PS.executeUpdate();

PS.close();
conexion.close();

response.sendRedirect("ListarNoticia.jsp");

%>