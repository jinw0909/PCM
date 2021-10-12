<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<h3>요청 번호 #${request.id }</h3>
	<fmt:formatDate var="resultRegDt" value="${request.createdAt}" pattern="MM월 dd일 HH시 mm분"/>
	<h4>요청자 ${request.pokemonName } / 요청일시${resultRegDt} / 요청량 ${request.totalRemedy }개</h4>
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
		<tbody id="showRequestDetail">
		</tbody>
	</table>
	<div class="d-flex justify-content-end mb-5">
		<div><b>트레이너</b> ${request.trainerName }</div>
	</div>
	<div class="d-flex justify-content-between">
		<input type="button" id="backToList" class="btn btn-secondary block w-25" value="목록으로">
		<div>
			<input type="button" class="btn btn-danger btn-small" value="기각" id="denyBtn" data-toggle="modal" data-target="#denyModal"}>
			<input type="button" class="btn btn-primary btn-small" value="승인" id="approveBtn" data-request-id=${request.id }>
		</div>
	</div>
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>

<!-- Modal -->
<div class="modal fade" id="denyModal" tabindex="-1" role="dialog" aria-labelledby="requestModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">기각 사유 입력</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body request-modal-body">
      	<textarea class="form-control" id="denyInput"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="denyConfirmBtn" data-request-id=${request.id}>전송하기</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function() {
		const showRequestList = function() {
			let types = "${request.types}";
			let levels = "${request.levels}";
			let patients = "${request.patients}";
			let remedy = "${request.remedy}";
			let etc = "${request.etc}";
			let headCount = ${request.headCount};
			
			for (let i = 0; i < headCount; i++) {
				$("#showRequestDetail").append(
						"<tr>" 
						+ "<th>환자" + (i + 1) + "</th>"
						+ "<td>" + (patients.split(",")[i]? patients.split(",")[i] : "-") + "</td>"
						+ "<td>" + (types.split(",")[i]? types.split(",")[i] : "-") + "</td>"
						+ "<td>" + (levels.split(",")[i]? levels.split(",")[i]: "-") + "</td>"
						+ "<td>" + (remedy.split(",")[i]? remedy.split(",")[i]: "-") + "</td>"
						+ "<td>" + (etc.split(",")[i]? etc.split(",")[i]: "-") + "</td>" +
					"</tr>"
				);
			}
		}
		showRequestList();
		
		$("#denyConfirmBtn").on("click", function() {
			let requestId = $(this).data("request-id");
			let denyInput = $("#denyInput").val().trim();
			
			$.ajax({
				type: "post",
				url: "/managers/deny_request",
				data: {"requestId": requestId, "denyInput": denyInput},
				success: function(data) {
					if (data.result == "success") {
						alert("요청 기각");
					} else {
						alert("요청 기각 실패");
					}
				},
				error: function(e) {
					alert("error");
				}
			});
		});
		
		
		$("#approveBtn").on("click", function() {
			let requestId = $(this).data("request-id");
			$.ajax({
				method: "post",
				url: "/managers/approve_request",
				data: {"requestId": requestId},
				success: function(data) {
					if (data.result == "success") {
						alert("승인하였습니다.")
					} else {
						alert("승인 실패");
					}
				},
				error: function(e) {
					alert("error");
				}
			});
		});
		
		$("#backToList").on("click", function() {
			location.href = "/managers/request_manage_view";
		});		
	});
</script>
</div>
</body>
</html>