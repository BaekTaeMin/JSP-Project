<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 변경 진행</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String newNickName = request.getParameter("nickName");
	String user_id = (String) session.getAttribute("user_id");
	int result = 0;
	
	String sql1 = "UPDATE user SET nickName=? WHERE id=?";
	
	PreparedStatement pstat = conn.prepareStatement(sql1);
	pstat.setString(1, newNickName);
	pstat.setString(2, user_id);
	result = pstat.executeUpdate(); 	

	request.setAttribute("result", result);
	
	pstat.close();
	conn.close();
%>
<jsp:forward page="updateNickNameResult.jsp"></jsp:forward>
</body>
</html>