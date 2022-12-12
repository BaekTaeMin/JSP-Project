<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	String sql1 = "select * from User where id=?";
	
	int idChk = 0;
	String user_pw = null;
	
	
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, id);
	rs = pstat.executeQuery();
	
	while(rs.next()) {
		String user_id = rs.getString("ID");
		if(id.equals(user_id)) {
			idChk = 1;
			user_pw = rs.getString("pw");	
		} else {
			idChk = 0;
		}
	}
	request.setAttribute("idChk", idChk);
	request.setAttribute("user_pw", user_pw);
	
	rs.close();
	pstat.close();
	conn.close();
%>
<jsp:forward page="lostPwResult.jsp"></jsp:forward>
</body>
</html>