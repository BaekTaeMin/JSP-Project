<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
	session.removeAttribute("id");
	response.sendRedirect("loginForm.jsp");
%>
<script>
alert("로그아웃되었습니다.");
</script>
</body>
</html>