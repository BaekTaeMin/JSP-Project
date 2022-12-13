<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 수정 진행</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String id = (String) session.getAttribute("user_id");
	String month = request.getParameter("updateMonth");
	String day = request.getParameter("updateDay");
	String title = request.getParameter("updateTitle");
	String content = request.getParameter("updateContent");
	
	String pastMonth = (String) session.getAttribute("month");
	String pastDay = (String) session.getAttribute("day");
	String pastTitle = (String) session.getAttribute("title");
	String pastContent = (String) session.getAttribute("content");

	PreparedStatement pstat = null;
	int result = 0;
	
	String sql = "Update Schedule SET month=?, day=?, title=?, content=? where id=? and month=? and day=? and title=?";
	pstat = conn.prepareStatement(sql);
	pstat.setString(1, month);
	pstat.setString(2, day);
	pstat.setString(3, title);
	pstat.setString(4, content);
	pstat.setString(5, id);
	pstat.setString(6, pastMonth);
	pstat.setString(7, pastDay);
	pstat.setString(8, pastTitle);
	result = pstat.executeUpdate();
	
	request.setAttribute("result", result);
	
	pstat.close();
	conn.close();
%>
<jsp:forward page="updateScheduleResult.jsp"></jsp:forward>
</body>
</html>