<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<body>
<c:choose>
		<c:when test="${idChk > 0 }">
			<script type="text/javascript">
				alert("이미 가입된 아이디입니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${pwChk > 0 }">
			<script type="text/javascript">
				alert("입력한 비밀번호가 다릅니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${result > 0 }">
			<script type="text/javascript">
				alert("회원가입 성공");
				location.href = "loginForm.jsp";
			</script>
		</c:when>
		<c:when test="${result <= 0 }">
			<script type="text/javascript">
				alert("아이디 등록 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>