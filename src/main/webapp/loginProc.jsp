<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginProc</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String user_id = null;
	String user_pw = null;
	String user_email = null;
	String user_nickName = null;
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	String sql1 = "select * from User where id=?";
	
	int idChk = 0;
	int pwChk = 0;
	int result = 0;
	
	
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, id);
	rs = pstat.executeQuery();
	
	while(rs.next()) {
		user_id = rs.getString("id");
		user_pw = rs.getString("pw");
		if(id.equals(user_id) && pw.equals(user_pw)) {
			idChk = 1;
			pwChk = 1;
		} else {
			idChk = 0;
			pwChk = 0;
		}
		user_email = rs.getString("email");
		user_nickName = rs.getString("nickName");
	}
	request.setAttribute("result", result);
	request.setAttribute("idChk", idChk);
	request.setAttribute("pwChk", pwChk);
	session.setAttribute("user_id", user_id);
	session.setAttribute("user_pw", user_pw);
	session.setAttribute("user_email", user_email);
	session.setAttribute("user_nickName", user_nickName);
	
	rs.close();
	pstat.close();
	conn.close();
%>
<jsp:forward page="loginResult.jsp"></jsp:forward>
</body>
</html>