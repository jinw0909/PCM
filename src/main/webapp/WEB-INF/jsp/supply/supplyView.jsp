<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 치료제 보급</title>
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
<section class="manage-section">
	<h2>어제까지 지점별 누적 요청량입니다.</h2>
	<table class="table">
		<thead>
			<tr>
				<th>지점명</th>
				<th>관리자</th>
				<th>누적요청량</th>
				<th>수량입력</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<%for (int i = 0; i < 12; i++) { %>
			<tr>
				<td>태초마을 <%=i + 1 %>지점</td>
				<td>피카츄</td>
				<td>1500개</td>
				<td><input type="text" class="form-control"></td>
				<td><input type="button" class="btn btn-small btn-primary" value="보내기"></td>
			</tr>
		<% } %>	
		</tbody>	
	</table>
	<div class="report notice d-flex">
		<select class="form-control w-25">
			<option>8월</option>
		</select>
		<h3>총 발급량은 30,000개입니다.</h3>
	</div>
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>	
</body>
</html>