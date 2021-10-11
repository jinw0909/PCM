<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 메인</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<div class="main-container container d-flex flex-column justify-content-center">
	<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
	<h5 class="mt-5">${branchSlogan } ${branchName }입니다.</h5>
	<h2 class="mt-4">오늘 총 <span id="showHeadCount"></span>마리의 포켓몬스터를 치료하였습니다.</h2>
	<section class="main-section d-flex justify-content-around">
		<div class="d-flex justify-content-center align-items-center">
			<a href="/members/request_view" class="circle">치료</a>
		</div>
		<div class="d-flex justify-content-center align-items-center">
			<a href="/notice/timeline_view" class="circle">공지</a>
		</div>
		<div class="d-flex justify-content-center align-items-center">
			<a href="/managers/manage_view" class="circle">지점</a>
		</div>
		
	</section>
	<div class="d-flex justify-content-between">
		<div><i class="bi bi-chat-left-dots-fill"></i>사원찾기</div>
		<select class="form-control w-25">
			<option>한국어</option>
		</select>
	</div>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>
<script>
	$(document).ready(function() {
		$.ajax({
			type: "get",
			url: "/commons/summarize",
			data: {"branchId": ${branchId}},
			success: function(data) {
				let totalHeadCount = 0;
				let start = new Date();
				start.setHours(0,0,0,0);
				let beginning = Date.parse(start);
				const timeDiff = 9*60*60*1000;
				console.log(beginning);
				for (summary of data) {
					if (summary.approval == true && beginning < Date.parse(summary.createdAt) - timeDiff) {
						totalHeadCount += summary.headCount
					}
				}
				$("#showHeadCount").text(totalHeadCount);
				
			},
			error: function(e) {
				alert("error");
			}
		})
	});
</script>
</body>
</html>