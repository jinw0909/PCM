<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 요청 작성</title>
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
		<%-- <div class="d-flex justify-content-around" >
			<div class="labels"></div>
			<% for (int i = 0; i < 6; i++) { %>
			<div class="slot slot-one d-flex flex-column justify-content-between">
				<div class="slot-label"></div>
				<input type="text" class="form-control">
				<input type="text" class="form-control">
				<input type="text" class="form-control">
				<input type="text" class="form-control">
				<input type="text" class="form-control">
				<input type="text" class="form-control">
			</div>
			<% } %>
		</div> --%>
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>환자1</th>
					<th>환자2</th>
					<th>환자3</th>
					<th>환자4</th>
					<th>환자5</th>
					<th>환자6</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th style="width: 100px">타입</th>
					<% for (int i = 0; i < 6; i++) { %>
					<td>
						<select type="text" class="form-control">
							<% for (int j = 0; j < 12; j++) { %>
							<% String type = "타입 선택"; %>
							<% if (j == 1) { type = "전기"; }%>
							<% if (j == 2) { type = "물"; }%>
							<% if (j == 3) { type = "불"; }%>
							<% if (j == 4) { type = "풀"; }%>
							<% if (j == 5) { type = "노말"; }%>
							<option><%=type %></option>
							<% } %>
						</select>
					</td>
					<% } %>
					
				</tr>
				<tr>
					<th style="width: 100px">이름</th>
					<td><input type="text" class="form-control"></td>
					<td><input type="text" class="form-control"></td>
					<td><input type="text" class="form-control"></td>
					<td><input type="text" class="form-control"></td>
					<td><input type="text" class="form-control"></td>
					<td><input type="text" class="form-control"></td>
				</tr>
				<tr>
					<th>트레이너명</th>
					<td colspan="3"><input type="text" class="form-control"></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" class="form-control btn block btn-success w-100" value="치료제 요청하기">
		
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>	
</body>
</html>