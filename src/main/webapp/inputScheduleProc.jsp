<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Sche.Schedule" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	Schedule schedule = new Schedule(); //Schedule 객체 생성
	
	schedule.setId((String)session.getAttribute("user_id"));
	schedule.setMonth(request.getParameter("Month"));
	schedule.setDay(request.getParameter("Day"));
	schedule.setTitle(request.getParameter("Title"));
	schedule.setContent(request.getParameter("Content"));

/* 	request.setCharacterEncoding("utf-8");
	String user_id = (String)session.getAttribute("user_id");
	String month = request.getParameter("Month");
	String day = request.getParameter("Day");
	String title = request.getParameter("Title");
	String content = request.getParameter("Content"); */
	
	int result = 0;
	
	PreparedStatement pstat = null;
	
	String sql = "Insert Into Schedule Value(?, ?, ?, ?, ?)";
	
	pstat = conn.prepareStatement(sql);
	pstat.setString(1, schedule.getId());
	pstat.setString(2, schedule.getMonth());
	pstat.setString(3, schedule.getDay());
	pstat.setString(4, schedule.getTitle());
	pstat.setString(5, schedule.getContent());
	
	result = pstat.executeUpdate();
	
	request.setAttribute("result", result);
	
	pstat.close();
	conn.close();
%>
<jsp:forward page="inputScheduleResult.jsp"></jsp:forward>
</body>
</html>