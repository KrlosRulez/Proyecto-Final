<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*,com.mysql.jdbc.*,java.sql.Connection, java.sql.PreparedStatement" %>

<% 

int Codigo_Comentario = Integer.parseInt(request.getParameter("codigo_comentario"));

// objetos de enlace
Connection conexion = null;
PreparedStatement PS = null;
String strcon = "jdbc:mysql://91.121.65.149:3306/cnf_maquinitas?allowPublicKeyRetrieval=True&useSSL=false&user=tela&password=darkusbakugan";

Class.forName("com.mysql.jdbc.Driver").newInstance();
conexion = DriverManager.getConnection(strcon);
String QUERY = "delete from Comentarios where Codigo_Comentario = " + Codigo_Comentario;
PS = conexion.prepareStatement(QUERY);
PS.executeUpdate();

PS.close();
conexion.close();

response.sendRedirect("ListarComentario.jsp");

%>