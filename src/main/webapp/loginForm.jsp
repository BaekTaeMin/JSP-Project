<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Manager</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/loginForm.css" rel="stylesheet" type="text/css">
</head>

<body>
<script type="text/javascript">
	function check() {
		if (!frm.id.value) {
			alert("아이디를 입력하세요");	
			frm.id.focus();
			return false;
		}
		if (!frm.pw.value) {
			alert("비밀번호를 입력하세요");
			frm.pw.focus();
			return false;
		}
		return true;
	}
</script>
<div class="sidenav">
         <div class="login-main-text">
          	<img src="img/SM.png" width="200px" height="180px"></img>	
            <h2><b>Schedule<br>Manager</b></h2>
         </div>
</div>
<form action="loginProc.jsp" name="frm" onsubmit="return check()">
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
                  <div class="form-group">
                     <label>ID</label>
                     <input type="text" class="form-control" name="id">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" name="pw">
                  </div>
                  <button type="submit" class="btn btn-secondary">로그인</button>              
               <br><br>
               <p>회원이 아니신가요?&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<a href="signUPForm.jsp">회원가입</a></p>
               <p>비밀번호를 잃어버리셨나요?&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="lostPwForm.jsp">비밀번호 찾기</a></p>
            </div>
         </div>
      </div>
</form>
</body>
</html>