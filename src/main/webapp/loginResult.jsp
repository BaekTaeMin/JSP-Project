<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
		<c:when test="${idChk > 0 && pwChk > 0}">
			<script type="text/javascript">
				location.href = "main.jsp";
			</script>
		</c:when>
		<c:when test="${idChk <= 0 || pwChk <= 0}">
			<script type="text/javascript">
				alert("아이디 혹은 비밀번호가 틀립니다.");
				location.href = "loginForm.jsp";
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>