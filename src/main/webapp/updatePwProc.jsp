<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String user_id = (String) session.getAttribute("user_id");
	String newPw = request.getParameter("newPw");
	String conPw = request.getParameter("conPw");
	
	PreparedStatement pstat = null;
	int result = 0;
	int pwChk = 0;
	
	String sql2 = "UPDATE user SET pw=? where id=?";
		
	pstat = conn.prepareStatement(sql2);
	pstat.setString(1, newPw);
	pstat.setString(2, user_id);
	
	if(!newPw.equals(conPw)){
		
	} else if(newPw.equals(conPw) && newPw != ""){
		result = pstat.executeUpdate();	
	}
	
	request.setAttribute("result", result);
		
	pstat.close();
	conn.close();
	
%>
<jsp:forward page="updatePwResult.jsp"></jsp:forward>
</body>
</html>