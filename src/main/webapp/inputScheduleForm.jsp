<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Sche.Schedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 생성</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
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
<script>
		$(function () {	    
	    $('.navbar-toggler').on('click', function(event) {
			event.preventDefault();
			$(this).closest('.navbar-minimal').toggleClass('open');
		})
		});
</script>
<body>
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
				<a href="#blog" class="animate">
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
			<h1 class="title"> 일정 생성 </h1>
		</div>
	</div><br><br>
	<div class="well-searchbox">
    	<form action="inputScheduleProc.jsp" class="form-horizontal" role="form">
            <div class="form-group">
	            <h4><label class="col-md-3 control-label">월</label></h4>
                <div class="col-md-6">
    		        <select class="form-control" name="Month">
            	        <option value="Jan">Jan</option><option value="Feb">Feb</option><option value="Mar">Mar</option>
            	        <option value="Apr">Apr</option><option value="May">May</option><option value="Jun">Jun</option>
            	        <option value="Jul">Jul</option><option value="Aug">Aug</option><option value="Sep">Sep</option>
            	        <option value="Oct">Oct</option><option value="Nov">Nov</option><option value="Dec">Dec</option>
                    </select>
                </div>
            </div><br>
            <div class="form-group">
	            <h4><label class="col-md-3 control-label">일</label></h4>
                <div class="col-md-6" style="text-size:15px;">
     	           <select class="form-control" name="Day">
        	           <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
        	           <option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
        	           <option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
        	           <option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option>
        	           <option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
        	           <option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option>
        	           <option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
        	           <option value="29">29</option><option value="30">30</option><option value="31">31</option>
                   </select>
               </div>
            </div><br>
            <div class="form-group">
            	<h4><label class="col-md-3 control-label">제목</label></h4>
                <div class="col-md-6">
             	   <input type="text" class="form-control" name="Title" required></input>
                </div>
            </div><br>
            <div class="form-group">
            	<h4><label class="col-md-3 control-label">내용</label></h4>
                <div class="col-md-6">
                	<textarea class="form-control" name="Content" cols="102" rows="6" style="resize:none"></textarea>
                </div>
            </div><br>
            <div class="col-sm-offset-5 col-sm-5">
            	<button type="submit" class="btn btn-success" name="input" style="width: 80px;">등 록</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>