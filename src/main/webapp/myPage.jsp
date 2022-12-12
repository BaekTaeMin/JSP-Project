<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<script>
		$(function () {	    
	    $('.navbar-toggler').on('click', function(event) {
			event.preventDefault();
			$(this).closest('.navbar-minimal').toggleClass('open');
		})
		});
	</script>

<body>
<%@ include file="dbconn.jsp" %>
<%
	String user_id = null;
	String user_pw = null;
	String user_email = null;
	String user_nickName = null;
	
	if( session.getAttribute("user_id") != null) {
		user_id = (String)session.getAttribute("user_id");
	}
	
	request.setCharacterEncoding("utf-8");
	
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	String sql1 = "select * from User where id=?";
	
	pstat = conn.prepareStatement(sql1);
	pstat.setString(1, user_id);
	rs = pstat.executeQuery();
	
	while(rs.next()) {
		user_id = rs.getString("id");
		user_pw = rs.getString("pw");
		user_email = rs.getString("email");
		user_nickName = rs.getString("nickName");
	}
	
	session.setAttribute("user_id", user_id);
	session.setAttribute("user_pw", user_pw);
	session.setAttribute("user_email", user_email);
	session.setAttribute("user_nickName", user_nickName);
	
	rs.close();
	pstat.close();
	conn.close();
%>
<!-- 왼쪽 메뉴 바 -->
<nav class="navbar navbar-fixed-left navbar-minimal animate" role="navigation">
		<div class="navbar-toggler animate">
			<span class="menu-icon"></span>
		</div>
		<ul class="navbar-menu animate">
			<li>
				<a href="main.jsp" class="animate">
					<span class="desc animate"> 홈 </span>
					<span class="glyphicon glyphicon-home"></span>
				</a>
			</li>
			<li>
				<a href="myPage.jsp" class="animate">
					<span class="desc animate"> 마이페이지 </span>
					<span class="glyphicon glyphicon-user"></span>
				</a>
			</li>
			<li>
				<a href="inputScheduleForm.jsp" class="animate">
					<span class="desc animate"> 일정 생성 </span>
					<span class="glyphicon glyphicon-pencil"></span>
				</a>
			</li>
			<li>
				<a href="searchScheduleForm.jsp" class="animate">
					<span class="desc animate"> 일정 조회 </span>
					<span class="glyphicon glyphicon-search"></span>
				</a>
			</li>
			<li>
				<a href="logout.jsp" class="animate">
					<span class="desc animate"> 로그아웃 </span>
					<span class="glyphicon glyphicon-log-out"></span>
				</a>
			</li>
		</ul>
	</nav>
<!-- 오른쪽 아이디 -->
<nav class="navbar-fixed-id">
	<div class="navbar-menu animate" style="text-align: center;">
		<h4 style="color:white;"><%= user_nickName %></h4>			
	</div>
</nav>
<!-- 중앙 -->
<div class="container">
	<div class="row" style="text-align: center;">
		<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
			<h1 class="title">마이 페이지</h1>
		</div>
	</div>
 	<div class="row">
		<div class="col-xs-12 col-sm-offset-2 col-sm-8 white-background">
			<h3>
			<p>아이디 : <label><input type="text" value="<%=user_id%>" readonly></input></label></p><br>
            <p>닉네임 : <label><input type="text" value="<%=user_nickName%>" readonly></input></label><button type="submit" onclick="location.href='updateNickNameForm.jsp'">닉네임 변경</button></p><br>
            <p>이메일 : <label><input type="text" value="<%=user_email%>" readonly></input></label></p><br>
            <p>비밀번호 : <label><input type="password" value="<%=user_pw%>" disabled></input></label><button type="submit" onclick="location.href='updatePwForm.jsp'">비밀번호 변경</button><p>
            </h3>
		</div>
	</div>
</div>
</body>
</html>