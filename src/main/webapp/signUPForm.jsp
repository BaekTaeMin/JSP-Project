<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<script type="text/javascript">
	function check() {
		if (!frm.id.value) {
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
		if (!frm.nickName.value) {
			alert("닉네임을 입력하세요");
			frm.nickName.focus();
			return false;
		}
		if (!frm.email.value) {
			alert("이메일을 입력하세요");
			frm.email.focus();
			return false;
		}
		if (!frm.pw.value) {
			alert("비밀번호를 입력하세요");
			frm.pw.focus();
			return false;
		}
		if (!frm.pwc.value) {
			alert("입력하지 않았습니다.");
			frm.pwc.focus();
			return false;
		}
		return true;
	}
</script>
<section class="vh-100 gradient-custom">
  <div class="container py-5 h-0">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-secondary text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-2">
			  <form action="signUPProc.jsp" name="frm" onsubmit="return check()">
              <h2 class="fw-bold mb-2 text-uppercase">회원가입</h2>
              <div class="form-outline form-white mb-4">
              	<label class="form-label" for="typeIDX">ID</label>
                <input type="text" id="typeIDX" class="form-control form-control-lg" placeholder="Your ID" name="id" autofocus="autofocus"/>
              </div>
              <div class="form-outline form-white mb-4"> 
              	<label class="form-label" for="typenickNameX">NickName</label>
                <input type="text" id="typenickNameX" class="form-control form-control-lg" placeholder="Your NickName" name="nickName" autofocus="autofocus"/>
              </div>
              <div class="form-outline form-white mb-4">
              	<label class="form-label" for="typeEmailX">Email</label>
                <input type="email" id="typeEmailX" class="form-control form-control-lg" placeholder="Your ID@Example.com" name="email"/>
              </div>

              <div class="form-outline form-white mb-4">
              	<label class="form-label" for="typePasswordX">Password</label>
                <input type="password" id="typePasswordX" class="form-control form-control-lg" name="pw"/>
              </div>
              <div class="form-outline form-white mb-4">
              	<label class="form-label" for="typePasswordX">Confirm Password</label>
                <input type="password" id="typePasswordX" class="form-control form-control-lg" name="pwc"/>
                <br><br>
              </div>
              <button class="btn btn-outline-light btn-lg px-5" type="submit">회원가입</button><br><br>
              </form>
			  <button class="btn btn-outline-light btn-lg px-5" onclick="location.href='loginForm.jsp'">취소</button>              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>