<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 변경 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<script type="text/javascript">
	function check() {
		if (!frm.nickName.value) {
			alert("닉네임을 입력하세요");
			frm.nickName.focus();
			return false;
		}
		return true;
	}
</script>
<section class="vh-100 gradient-custom">
  <div class="container py-5 h-0">  <!-- "position-absolute top-0 start-50 translate-middle-x" --> <!-- "container py-5 h-0" -->
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-secondary text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            <div class="mb-md-5 mt-md-4 pb-5">
			  <form action="updateNickNameProc.jsp" name="frm" onsubmit="return check()">
              <h2 class="fw-bold mb-2 text-uppercase">닉네임 변경</h2>
              <p class="text-white-50 mb-3">변경할 닉네임을 입력해주세요</p>
              <div class="form-outline form-white mb-4">
              	<label class="form-label" for="typeIDX">NickName</label>
                <input type="text" id="typeIDX" class="form-control form-control-lg" placeholder="New NickName" name="nickName" autofocus="autofocus"/>
              </div>
              <br><br>
              <button class="btn btn-outline-light btn-lg px-5" type="submit">확인</button><br><br>
              </form>
			  <button class="btn btn-outline-light btn-lg px-5" onclick="location.href='myPage.jsp'">돌아가기</button>              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>