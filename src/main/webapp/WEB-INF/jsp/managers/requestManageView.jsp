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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<div class="manage-container container d-flex flex-column justify-content-center">
<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
<section class="manage-section d-flex flex-column justify-content-around">
	<c:choose>
	<c:when test="${requestList.size() eq 0 }">
		<h2>처리하지 않은 요청서가 없습니다.</h2>
	</c:when>
	<c:otherwise>
		<h2>처리하지 않은 요청서가 ${requestList.size() }건 있습니다</h2>
	</c:otherwise>
	</c:choose>
	<h3 class="text-primary">오늘 승인한 요청량 총 <span id="totalIssued"></span>개</h3>
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
		<c:forEach var="request" items="${requestList }">
			<tr class="request" data-request-id="${request.id }">
					<td>${request.createdAt }</td>
					<td>${request.pokemonName }</td>
					<td>${request.totalRemedy }개</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="d-flex justify-content-center">
		<input type="button" class="btn btn-secondary" value="더보기">
	</div>
	<div>
		<input type="button" id="showTotalSummary" class="btn btn-success block w-50" value="지점별 발급량 현황" data-toggle="modal" data-target="#totalSummary">
	</div>
</section>
<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
<!-- Modal -->
<div class="modal fade" id="totalSummary" tabindex="-1" role="dialog" aria-labelledby="requestModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title clock_2" id="totalSummaryLabel">요청서 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body request-modal-body">
       <table class="table request-table">
       	<thead>
       		<tr>
       			<th>지점명</th>
       			<th>발급량</th>
       		</tr>
       	</thead>
       	<tbody id="totalSummaryBody">
       	</tbody>
       </table>
       <div class="request-summary d-flex justify-content-between">
	       <div class="trainer-name"></div>
	       <div class="head-count"></div>
	       <div class="total-remedy"></div>
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function() {
		$(".request").on("click", function() {
			let requestId = $(this).data("request-id");
			console.log(requestId);
			location.href = "/managers/request_detail_view?requestId=" + $(this).data("request-id");
			
			
		});
		
		$.ajax({
			method: "get",
			url: "/commons/summarize",
			success: function(data) {
				let totalIssued = 0;
				let start = new Date();
				start.setHours(0,0,0,0);
				let beginning = Date.parse(start);
				const timeDiff = 9*60*60*1000;
				for (summary of data) {
					if (summary.approval == true && beginning < Date.parse(summary.createdAt) - timeDiff) {
						totalIssued += summary.totalRemedy;
					}
				}
				$("#totalIssued").text(totalIssued.toLocaleString());
			},
			error: function(e) {
				alert("error");
			}
		});
		
		$("#showTotalSummary").on("click", function() {
			const issuedRemedy = [];
			let start = new Date();
			start.setHours(0,0,0,0);
			let beginning = Date.parse(start);
			const timeDiff = 9*60*60*1000;
			
			/* $("#totalSummaryLabel").text(new Date()); */
			
			let getBranchAsync = function() {
				return new Promise(function(resolve, reject) {
					$.ajax({
						type: "get",
						url: "/commons/fetch_branch",
						success: function(data) {
							for (branch of data) {
								issuedRemedy[branch.id] = {};
								issuedRemedy[branch.id].name = branch.branchName;
								issuedRemedy[branch.id].color = branch.branchColor;
								issuedRemedy[branch.id].remedy = 0;
							}
							console.log(issuedRemedy);
							resolve(issuedRemedy);
							
						},
						error: function(e) {
							alert("error");
						}
					});
				});
				reject();
			};
			
			let getSummaryAsync = function() {
				return new Promise(function(resolve, reject) {
					$.ajax({
						type: "get",
						url: "/commons/summarize",
						success: function(data) {
							for (summary of data) {
								if (summary.approval == true && beginning < Date.parse(summary.createdAt) - timeDiff) {
									issuedRemedy[summary.branchId].remedy += summary.totalRemedy;
								}
							};
							$("#totalSummaryBody").empty();
							for (let i = 1; i < issuedRemedy.length; i++) {
								console.log(i);
								$("#totalSummaryBody").append(
									"<tr style='color:" + issuedRemedy[i].color +"'>" +
										"<td>" + issuedRemedy[i].name + "</td>" +
										"<td>" + issuedRemedy[i].remedy + "개</td>" +
									+ "</tr>"
								);
								
							}
						},
						error: function(e) {
							alert("error");
						}
					});	
					resolve();
				});
			}
			
			
			getBranchAsync().then(getSummaryAsync);
		});
	});
</script>
</div>

</body>
</html>