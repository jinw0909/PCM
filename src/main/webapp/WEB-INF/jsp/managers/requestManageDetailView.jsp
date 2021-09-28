<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 요청 관리 상세</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
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
<section class="manage-section">
	<h2>요청 상세</h2>
	<h3>요청 번호 #17</h3>
	<h4>요청자 버터플 / 요청일시 9월 15일 오후 2시 / 요청량 400개</h4>
	<table class="table">
		<thead>
			<tr>
				<th></th>
				<th>이름</th>
				<th>타입</th>
				<th>레벨</th>
				<th>투여량</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>환자1</th>
				<td>뮤츠</td>
				<td>에스퍼</td>
				<td>99</td>
				<td>800개</td>
				<td>2배 이상 투여 / 사유: 전설등급</td>
			</tr>
			<tr>
				<th>환자2</th>
				<td>거북왕</td>
				<td>물</td>
				<td>89</td>
				<td>300개</td>
				<td>-</td>
			</tr>
			<% for (int i = 0; i < 4; i++) { %>
				<tr>
				<th>환자</th>
				<td>꼬렛</td>
				<td>노말</td>
				<td>30</td>
				<td>100개</td>
				<td>-</td>
			</tr>
			<% } %>
		</tbody>
	</table>
	<input type="button" class="btn btn-secondary block w-25" value="목록으로">
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>
</body>
</html>