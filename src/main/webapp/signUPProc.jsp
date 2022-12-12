<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %> <!-- dbconn.jsp를 포함한다. -->
<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String pwc = request.getParameter("pwc");
		
		PreparedStatement pstat = null;
		ResultSet rs = null;
		
		String sql1 = "select * from User where id=? ";
		
		int idChk = 0;
		int result = 0;
		int pwChk = 0;
		
		// PreparedStatement 생성 => 테이블에 아이디가 이미 있는지 체크
		pstat = conn.prepareStatement(sql1);
		pstat.setString(1, id);
		rs = pstat.executeQuery();
		
		if(rs.next()) {
			//테이블에 아이디가 있는 경우
			idChk = 1;
		} else {
			//테이블에 아이디가 없는 경우 신규등록 가능
			String sql2 = "insert into User values (?,?,?,?)";
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1, id);
			pstat.setString(2, nickName);
			pstat.setString(3, email);
			pstat.setString(4, pw);
			
			if(!pw.equals(pwc)) {
				pwChk = 1;
			}else {
				//쿼리 실행
				result = pstat.executeUpdate();	
			}
		}
		request.setAttribute("result", result);
		request.setAttribute("idChk", idChk);
		request.setAttribute("pwChk", pwChk);
		session.setAttribute("user_nickName", nickName);
		
		rs.close();
		pstat.close();
		conn.close();
	%>
	<jsp:forward page="signUPResult.jsp"></jsp:forward>
</body>
</html>