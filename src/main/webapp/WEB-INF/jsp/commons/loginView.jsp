<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 로그인</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<div class="login-container container d-flex justify-content-center align-items-center">
	<section class="w-50">
		<h2 class="text-center">포켓몬센터 매니저 PCM</h2>
		<div class="w-75 mt-4 mx-auto">
			<form class="w-100">
				<input type="text" class="form-control mt-3" placeholder="아이디를 입력해주세요" id="loginIdInput">
				<input type="password" class="form-control mt-3" placeholder="비밀번호를 입력해주세요" id="passwordInput">
				<select class="form-control mt-3" id="branchInput">
					<option>지점을 선택해주세요</option>
					<c:forEach var="branchInfo" items="${branchInfo }">
						<option data-branch-id="${branchInfo.id }">${branchInfo.branchName }</option>	
					</c:forEach>
				</select>
				<input type="button" class="btn block w-100 btn-primary mt-3" value="로그인" id="loginBtn">
			</form>
		</div>
	</section>
</div>
<script>
	$(document).ready(function() {
		
		
		$("#loginBtn").on('click', function(e) {
			e.preventDefault();

			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var branchId = $("#branchInput").find("option:selected").data("branch-id");
			
			$.ajax({
				method: 'post',
				url: '/commons/sign_in',
				data: {"loginId": loginId, "password": password, "branchId": branchId},
				success: function(data) {
					if (data.result == "success") {
						alert("로그인 성공");
						location.href = "/commons/main_view";
					} else {
						alert("로그인 실패");
					}
				},
				error: function(error) {
					alert("error");
				}
			});
			
		});
		
	});
</script>
</body>
</html>