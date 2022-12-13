<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 삭제 진행</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("user_id");
	String day = (String) session.getAttribute("day");
	String month = (String) session.getAttribute("month");
	String title = (String) session.getAttribute("title");
	String content = (String) session.getAttribute("content");

	PreparedStatement pstat = null;
	int result = 0;
	
	String sql = "Delete From Schedule where id=? and month=? and title like '%" + title + "%'";
	pstat = conn.prepareStatement(sql);
	pstat.setString(1, id);
	pstat.setString(2, month);
	result = pstat.executeUpdate();
	
	request.setAttribute("result", result);
	
	pstat.close();
	conn.close();
%>
<jsp:forward page="deleteScheduleResult.jsp"></jsp:forward>
</body>
</html>