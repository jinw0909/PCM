<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 요청 관리</title>
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
<section class="manage-section d-flex flex-column justify-content-around">
	<h2>처리하지 않은 요청서가 2건 있습니다.</h2>
	<h3 class="text-primary">오늘 승인한 요청량 총 5,500개</h3>
	<table class="table text-center">
		<thead>
			<tr>
				<th>요청일시</th>
				<th>요청자</th>
				<th>요청량</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>9월 15일 오후 2시</td>
				<td>버터플</td>
				<td>300개</td>
				<td>
					<button class="btn btn-danger btn-small">기각</button>
					<button class="btn btn-info btn-small">승인</button>
				</td>
			</tr>
			<tr>
				<td>9월 15일 오후 1시</td>
				<td>피죤</td>
				<td>200개</td>
				<td>
					<button class="btn btn-danger btn-small">기각</button>
					<button class="btn btn-info btn-small">승인</button>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="d-flex justify-content-center">
		<input type="button" class="btn btn-secondary" value="더보기">
	</div>
	<div>
		<input type="button" class="btn btn-success block w-25" value="본사에 요청">
		<button class="btn btn-primary">+</button>
		<button class="btn btn-danger">-</button>
	</div>
	<h3>총 700개가 요청됩니다.</h3>
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>

</body>
</html>