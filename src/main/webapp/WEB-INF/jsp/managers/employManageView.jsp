<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 직원 관리</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css">
</head>
<body style="background: ${branchColor}77">
<div class="manage-container container d-flex flex-column justify-content-center">
<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
<section class="manage-section d-flex align-items-center justify-content-center">
	<div class="m-2">
		<form>
			<label class="form-control bg-info text-center">직원등록</label>
			<input type="text" class="form-control mt-2" placeholder="아이디" name="loginId" id="newLoginId">
			<input type="text" class="form-control mt-2" placeholder="비밀번호" name="password" id="newPassword">
			<select class="form-control mt-2 form-select" id="newPermission">
				<option>직급을 설정해주세요</option>
				<option>인턴</option>
				<option>직원</option>
				<option>관리자</option>
			</select>
			<textarea col="10" row="10" class="form-control mt-2" style="resize: none; font-size: 0.8rem" id="newEtc" placeholder="특이사항"></textarea>
			<input id="signUpBtn" type="button" class="form-control btn btn-primary mt-3" value="등록하기">
		</form>
	</div>
	<div class="m-2">
		<form>
			<label class="form-control bg-info text-center">직원수정</label>
			
			<input type="text" class="form-control mt-2" placeholder="사번" id="employeeId">
			<input type="text" class="form-control mt-2" placeholder="사원명" id="employeeName">
			
			<select class="form-control mt-2 form-select" id="employeePermission">
				<option>직급을 설정해주세요</option>
				<option>인턴</option>
				<option>직원</option>
				<option>관리자</option>
			</select>
			<textarea col="10" row="10" class="form-control mt-2" style="resize: none; font-size: 0.8rem" id="employeeEtc"></textarea>
			<div class="d-flex mt-3">
				<input type="button" class="form-control btn btn-danger w-25 mx-1" value="해고" id="fireBtn">
				<input type="button" class="form-control btn btn-primary mx-1" value="수정하기" id="modifyBtn">
			</div>
		</form>
	</div>
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>
<script>
	$(document).ready(function() {
		
		
		$("#signUpBtn").on("click", function(e) {
			e.preventDefault();
			
			var newLoginId = $("#newLoginId").val();
			var newPassword = $("#newPassword").val();
			var newPermission = $("#newPermission").val();
			var newEtc = $("#newEtc").val();
			var newBranchId = ${branchId}
			console.log(newBranchId);
			
			if(newLoginId == null || newLoginId == "") {
				alert("아이디를 등록해주세요");
				return;
			}
			if(newPassword == null || newPassword == "") {
				alert("비밀번호를 등록해주세요");
				return;
			}
			if ($("#newPermission").val() == "직급을 설정해주세요") {
				alert("직급을 설정해주세요");
				return;
			} 
			
			$.ajax({
				type: "post",
				url: "/commons/sign_up",
				data: {"loginId": newLoginId, "password": newPassword, "permission": newPermission, "etc": newEtc, "branchId": newBranchId},
				success: function(data) {
					if(data.result == "success") {
						alert("신규 직원을 등록하였습니다.");
					} else {
						alert("신규 직원 등록 실패");
					}
				},
				error: function(e) {
					alert("error");
				}
			});
		})
		
		$("#modifyBtn").on('click', function(e) {
			e.preventDefault();
			
			var id = $("#employeeId").val();
			var name = $("#employeeName").val();
			var permission = $("#employeePermission").val();
			var etc = $("#employeeEtc").val();
			
			if(id == null || id == "") {
				alert("아이디를 입력해주세요");
				return;
			}
			if(name == null || name == "") {
				alert("직원명을 입력해주세요");
				return;
			}
			if (permission.val() == "직급을 설정해주세요") {
				alert("직급을 설정해주세요");
				return;
			} 
			
			$.ajax({
				type: "post",
				url: "/commons/modify",
				data: {"id": id, "name": name, "permission": permission, "etc": etc},
				success: function(data) {
					if(data.result == "success") {
						alert("신규 정보를 수정하였습니다.");
					} else {
						alert("직원 수정 실패");
					}
				},
				error: function(e) {
					alert("error");
				}
			});
			
		
		});
	})
</script>
</body>
</html>