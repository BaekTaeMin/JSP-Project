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
		<c:when test="${idChk > 0}">
			<script type="text/javascript">
				alert("당신의 비밀번호는 " + ${user_pw} + " 입니다.")
				location.href = "loginForm.jsp";
			</script>
		</c:when>
		<c:when test="${idChk <= 0}">
			<script type="text/javascript">
				alert("존재하지 않는 아이디입니다.");
				history.go(-1);
			</script>
		</c:when>
</c:choose>
</body>
</html>