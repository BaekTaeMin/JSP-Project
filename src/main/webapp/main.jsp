<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Sche.Schedule" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Manager</title>
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
	if( session.getAttribute("user_id") != null) {
		user_id = (String)session.getAttribute("user_id");
	}
	
	String user_pw = null;
	String user_email = null;
	String user_nickName = null;
	
	request.setCharacterEncoding("utf-8");
	
	/* 두번째 쿼리 */
	PreparedStatement pstat1 = null;
	ResultSet rs1 = null;
	String sql1 = "select * from User where id=?";
	
	pstat1 = conn.prepareStatement(sql1);
	pstat1.setString(1, user_id);
	rs1 = pstat1.executeQuery();
	
	while(rs1.next()) {
		user_id = rs1.getString("id");
		user_pw = rs1.getString("pw");
		user_email = rs1.getString("email");
		user_nickName = rs1.getString("nickName");
	}
	
	session.setAttribute("user_id", user_id);
	session.setAttribute("user_pw", user_pw);
	session.setAttribute("user_email", user_email);
	session.setAttribute("user_nickName", user_nickName);
	
	rs1.close();
	pstat1.close();
	
	/* 두번째 쿼리 */
	String month = null;
	String day = null;
	String title = null;
	String content = null;

	PreparedStatement pstat2 = null;
	ResultSet rs2 = null;
	String sql2 = "select * from Schedule where id=?";
	
	pstat2 = conn.prepareStatement(sql2);
	pstat2.setString(1, user_id);
	rs2 = pstat2.executeQuery();
	
	while(rs2.next()) {
		month = rs2.getString("month");
		day = rs2.getString("day");
		title = rs2.getString("title");
		content = rs2.getString("content");
	}
	
	rs2.close();
	pstat2.close();
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
					<span class="desc animate"> 마이페이지</span>
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
<!-- 중앙상단 -->
	<div class="row" style="text-align: center;">
		<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
			<h1 class="title">나의 일정</h1>
		</div>
	</div>
<!-- 중앙 내용 -->
	<div class="row">
			<div class="[ col-xs-12 col-sm-offset-2 col-sm-8 ]">
				<ul class="event-list">
				<% 
					Schedule schedule = new Schedule();
					
					String user_month = null;
					String user_day = null;
					String user_title = null;
					String user_content = null;
					
					PreparedStatement pstat3 = null;
					ResultSet rs3 = null;
					String sql3 = "select * from Schedule where id=?";
					
					pstat3 = conn.prepareStatement(sql3);
					pstat3.setString(1, user_id);
					rs3 = pstat3.executeQuery();
					
					ArrayList<Schedule> list = new ArrayList<>();
					//기존은 리스트 없이 while문 안에 예시:user_month = rs3.setString("month");로 바로바로 뽑아줬다.
					while(rs3.next()) {
						schedule.setMonth(rs3.getString("month"));
						schedule.setDay(rs3.getString("day"));
						schedule.setTitle(rs3.getString("title"));
						schedule.setContent(rs3.getString("content"));
						list.add(schedule);
						
						int i = 0;
				%>	
					<li class="menubar">
						<time datetime>
							<span class="day"><%= list.get(i).getDay() %></span>
							<span class="month"><%= list.get(i).getMonth() %></span>
						</time>
						<div class="info">
							<h2 class="title"><a href="selectSchedule.jsp?Month=<%=list.get(i).getMonth() %>&Title=<%=list.get(i).getTitle()%>" style="color:black;"><%= list.get(i).getTitle() %></a></h2>
							<p class="desc"><%= list.get(i).getContent() %></p>
						</div>
					</li>
					 
					<% i++; }
					rs3.close();
					pstat3.close();
					conn.close();
					%>
				</ul>
			</div>
			<div style="text-align:right;">
			</div>
		</div>
</div>
</body>
</html>