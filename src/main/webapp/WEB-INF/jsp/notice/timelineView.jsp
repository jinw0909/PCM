<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 공지</title>
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
	<div class="timeline-container container d-flex flex-column justify-content-between">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		<section class="timeline-section w-50 mx-auto mt-5">
			<div class="create-notice">
				<textarea rows="10" class="form-control" id="noticeInput"></textarea>
				<input type="file" class="form-control w-25" id="fileInput">
				<input type="button" class="form-control btn btn-primary" value="글쓰기" id="noticeBtn" data-pokemon-name=${pokemonName }>
			</div>
			<div class="notice-box">
				<div class="notice mt-5">
					<h3>공지1</h3>
					<div class="notice-image"></div>
					<div class="notice-content">다음주 월요일부터 임직원 대상으로 이벤트 진행 예정이오니 많은 참가 부탁드립니다.</div>
					<div class="notice-time">2021-09-15</div>
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">댓글 작성</span>
					</div>
					<input type="text" class="form-control" id="commentInput" data-branch-name=${branchName}>
				</div>
				<div class="comment mt-3">
					<b class="comment-creator">태초마을지점 꼬부기 매니저</b>
					<div class="comment-content">좋아요!</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	<script>
		$(document).ready(function() {
			$("#noticeBtn").on("click", function(e) {
				
				e.preventDefault();
				
				let formData = new FormData();
				let notice = $("#noticeInput").val();
				let file = $("#fileInput").val();
				let pokemonName = $("#noticeBtn").data("pokemonName");
				console.log(pokemonName);
				formData.append("notice", notice);
				formData.append("file", file);
				formData.append("pokemonName", pokemonName);
				
				$.ajax({
					method: "post",
					url: "/notice/create_notice",
					enctype: "multipart/form-data",
					processData: false,
					contentType: false,
					data: formData,
					success: function(data) {
						if (data.result == "success") {
							alert("글쓰기 성공");
						} else {
							alert("글쓰기 실패");
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