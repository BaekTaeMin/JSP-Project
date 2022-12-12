<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	String jdbcURL = "jdbc:mysql://localhost:3306/jspDB";
	String user = "root";
	String passwd = "rootpw";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcURL, user, passwd);
%>
</body>
</html>