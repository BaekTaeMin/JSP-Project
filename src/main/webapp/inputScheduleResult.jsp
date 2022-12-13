<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 생성 결과</title>
</head>
<body>
<c:choose>
		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("생성되었습니다.");
				location.href = "main.jsp";
			</script>
		</c:when>
		<c:when test="${result <= 0}">
			<script type="text/javascript">
				alert("일정 등록에 실패하셨습니다.");
				history.go(-1);
			</script>
		</c:when>
</c:choose>
</body>
</html>