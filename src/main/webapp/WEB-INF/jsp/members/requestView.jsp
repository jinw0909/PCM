<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 요청</title>
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
<div class="request-container container d-flex flex-column justify-content-center">
	<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
	<section class="request-section">
	<h2>친료제 잔량 8,900개 / 15,000개</h2>
	<input type="button" value="요청서 작성" class="btn btn-primary block w-100">
	<h5>2021년 9월 14일 오후 2시 35분</h5>
	<table class="table">
		<thead>
			<tr>
				<th>요청시간</th>
				<th>소모량</th>
				<th>담당자</th>
				<th>명단</th>
				<th>트레이너</th>
				<th>승인</th>
			</tr>
		</thead>
		<tbody>
		<%for (int i = 0; i < 5; i++ ) { %>
			<tr>
				<td>오후 4시</td>
				<td>400개</td>
				<td>푸린</td>
				<td>꼬부기 외 3</td>
				<td>스티브 로져스</td>
				<td>승인 대기중</td>
			</tr>
		<% } %>	
		</tbody>
		
	</table>
	<input type="button" value="더보기" class="btn btn-secondary block w-25">
	<h1>미승인 요청서 1건</h1>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>

</body>
</html>