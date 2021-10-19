<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 공지</title>
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
	<div class="timeline-container container d-flex flex-column justify-content-between">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		<section class="timeline-section w-50 mx-auto mt-5">
			<div class="create-notice bg-white p-1 mb-5">
				<textarea rows="5" class="form-control resize-none bg-transparent border-0 pt-2 px-2" style="resize:none; font-size: 1rem" id="noticeInput"></textarea>
				<div class="d-flex justify-content-between align-items-center p-1">
					<i style="cursor: pointer" class="bi bi-card-image" id="uploadImage"></i>
					<input type="file" class="form-control d-none" id="fileInput">
					<input type="button" class="form-control btn btn-primary w-25 btn-sm" value="공지" id="noticeBtn">
				</div>
			</div>
			
			<c:forEach var="notice" items="${noticeList }" varStatus="status">
				<hr>
				<div class="notice-box my-5">
					<fmt:formatDate var="resultRegDt" value="${notice.notice.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
					<h4><span>#${notice.notice.id}. </span>${resultRegDt }</h4>
					<div class="notice bg-light">
						<div class="notice-image">
							<img src="${notice.notice.imagePath}">
						</div>
						<div class="notice-content">${notice.notice.content }</div>
					</div>
					<div class="input-group mt-2 input-group-sm">
						<input type="text" class="form-control comment-input" id="commentInput-${notice.notice.id }" ">
						<button class="input-group-text commentBtn" data-notice-id="${notice.notice.id}">댓글달기</button>
					</div>
					<div class="comment-box bg-light">
					<c:forEach var = "comment" items="${notice.commentList}">
						<div class="comment m-1 d-flex justify-content-between align-items-center">
							<div>
								<b class="comment-creator small">${comment.branchName} ${comment.pokemonName } ${comment.permission} </b>
								<div class="comment-content small">${comment.content }</div>
							</div>
							<c:if test="${permission eq '관리자' }">
								<i class="bi bi-x-square" data-id="${comment.id }"></i>
							</c:if>
						</div>
					</c:forEach>
					</div>
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
			
			$("#uploadImage").on("click", function() {
				$("#fileInput").click();
			})
			
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
							location.reload();
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