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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- Bootstrap Icons -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<div class="manage-container container d-flex flex-column justify-content-center">
<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
<section class="manage-section d-flex align-items-center justify-content-center">
	<div>
		<label class="form-control bg-secondary">직원등록</label>
		<input type="text" class="form-control" placeholder="아이디">
		<input type="text" class="form-control" placeholder="비밀번호">
		<select class="form-control">
			<option>인턴</option>
			<option>직원</option>
			<option>관리자</option>
		</select>
		<textarea col="10" row="10" class="form-control"></textarea>
		<input type="button" class="form-control btn btn-primary" value="등록하기">
	</div>
	<div>
		<label class="form-control bg-secondary">직원수정</label>
		<input type="text" class="form-control" placeholder="사번">
		<input type="text" class="form-control" placeholder="사원명">
		<select class="form-control">
			<option>인턴</option>
			<option>직원</option>
			<option>관리자</option>
		</select>
		<textarea col="10" row="10" class="form-control"></textarea>
		<div class="d-flex justify-content-between">
			<input type="button" class="form-control btn btn-danger col-3" value="해고">
			<input type="button" class="form-control btn btn-primary col-8" value="등록하기">
		</div>
	</div>
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>
</body>
</html>