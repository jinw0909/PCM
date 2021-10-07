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
				<input type="button" class="form-control btn btn-primary" value="글쓰기" id="noticeBtn">
			</div>
			
			<c:forEach var="notice" items="${noticeList }" varStatus="status">
				<div class="notice-box my-5">
					<div class="notice">
						<h3>공지 ${status.count }</h3>
						<div class="notice-image">
							<img src="${notice.notice.imagePath}">
						</div>
						<div class="notice-content">${notice.notice.content }</div>
						<div class="notice-time">${notice.notice.createdAt }</div>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" id="commentInput-${notice.notice.id }" ">
						<button class="input-group-text commentBtn" data-notice-id="${notice.notice.id}">댓글 작성</button>
					</div>
					<c:forEach var = "comment" items="${notice.commentList}">
						<div class="comment mt-3">
							<b class="comment-creator">${comment.branchName} ${comment.pokemonName } ${comment.permission} </b>
							<div class="comment-content">${comment.content }</div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	<script>
		$(document).ready(function() {
			$("#noticeBtn").on("click", function(e) {
				
				e.preventDefault();
				
				let formData = new FormData();
				let notice = $("#noticeInput").val();
				let file = $("#fileInput")[0].files[0];
				formData.append("notice", notice);
				formData.append("file", file);
				
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
							location.reload();
						} else {
							alert("글쓰기 실패");
						}
					},
					error: function(e) {
						alert("error");
					}
					
					
				});
			});
			
			$(".commentBtn").on("click", function() {
				let noticeId = $(this).data("notice-id");
				let comment = $("#commentInput-" + noticeId).val();
				console.log(noticeId);
				$.ajax({
					method: "post",
					url: "/comment/create_comment",
					data: {
						"comment": comment, 
						"noticeId": noticeId,
					},
					success: function(data) {
						if (data.result == "success") {
							alert("댓글 작성 성공");
						} else {
							alert("댓글 작성 실패");
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