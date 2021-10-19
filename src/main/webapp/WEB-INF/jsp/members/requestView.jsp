<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PCM 요청</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css">
</head>
<body style="background: ${branchColor }77">
<div class="request-container container d-flex flex-column justify-content-center">
	<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
	<section class="request-section">
	<div class="d-flex justify-content-around">
		<h3 class="col-6 text-center">오늘 발급받은 치료제 <span style="font-size: 2.5rem" id="showIssued"></span>개</h3>
		<h3 class="col-6 text-center">오늘 승인받은 요청서 <span style="font-size: 2.5rem" id="countApproval"></span>건</h3>
	</div>
	<a href="/members/request_create_view" class="btn btn-primary block w-100 my-3">요청서 작성</a>
	<table class="table text-center">
		<thead>
			<tr>
				<th>작성시간</th>
				<th>요청량</th>
				<th>명단</th>
				<th>트레이너</th>
				<th>승인여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="request" items="${requestList}" varStatus="status">
			<tr class="request-check" data-request-id=${request.id } data-toggle="modal" data-target="#requestCheckModal">
				<fmt:formatDate var="resultRegDt" value="${request.createdAt}" pattern="yyyy-MM-dd HH시 mm분"/>
				<td>${resultRegDt}</td>
				<td id="issued_${status.index}">${request.totalRemedy }개</td>
				<c:choose>
					<c:when test="${request.headCount <= 1 }">
						<td>${request.patients }</td>
					</c:when>
					<c:otherwise>
						<td>${request.patients } 외 ${request.headCount - 1 }</td>
					</c:otherwise>
				</c:choose>
				<td>${request.trainerName}</td>
				<c:choose>
				<c:when test="${request.approval eq true}">
					<td class="checkApproval" id="checkApproval_${status.index }">승인됨</td>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty request.denial }">
							<td class="checkApproval" id="checkApproval_${status.index }">대기중</td>
						</c:when>
						<c:when test="${request.denial != null}">
							<td class="checkApproval" id="checkApproval_${status.index }">기각됨</td>
						</c:when>
					</c:choose>
				</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>	
		</tbody>
		
	</table>
	<div class="text-center">
		<a href="#">더보기+</a>	
	</div>
	
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	<!-- Modal -->
	<div class="modal fade" id="requestCheckModal" tabindex="-1" role="dialog" aria-labelledby="requestModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">요청서 상세</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body request-modal-body">
	       <table class="table request-table text-center">
	       	<thead>
	       		<tr>
	       			<th>환자#</th>
	       			<th>타입</th>
	       			<th>이름</th>
	       			<th>레벨</th>
	       			<th>투여량</th>
	       			<th>특이사항</th>
	       		</tr>
	       	</thead>
	       	<tbody id="checkTableBody">
	       		<tr>
					<td>1</td>			
		       		<td>노말</td>
		       		<td>푸린</td>
		       		<td>33레벨</td>
		       		<td>300개</td>
		       		<td>분홍색</td>
				</tr>
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
			
			$.ajax({
				type: "get",
				url: "/commons/summarize",
				data: {"pokemonId": ${pokemonId}, "branchId": ${branchId}},
				success: function(data) {
					let totalIssued = 0;
					let countApproval = 0;
					let start = new Date();
					start.setHours(0,0,0,0);
					let beginning = Date.parse(start);
					const timeDiff = 9*60*60*1000;
					for (summary of data) {
						if (summary.approval == true && beginning < Date.parse(summary.createdAt) - timeDiff) {
							totalIssued += summary.totalRemedy;
							countApproval++;
						}
					}
					$("#showIssued").text(totalIssued.toLocaleString());
					$("#countApproval").text(countApproval.toLocaleString());
				},
				error: function(e) {
					alert("error");
				}
			});
			
			$(".request-check").on("click", function() {
				let requestId = $(this).data("request-id");
				$("#checkTableBody").empty();
				$.ajax({
					type: "get",
					url: "/members/check_request",
					data: {"requestId": requestId},
					success: function(data) {
						for (let i = 0; i < data.headCount; i++) {
							$("#checkTableBody").append(
								"<tr>" +
									"<td>" + (i + 1) + "</td>" +
									"<td>" + (data.types.split(",")[i]?data.types.split(",")[i]:"-")   + "</td>" +
									"<td>" + (data.patients.split(",")[i]?data.patients.split(",")[i]:"-") + "</td>" +
									"<td>" + (data.levels.split(",")[i]?data.levels.split(",")[i] + "레벨":"-") + "</td>" +
									"<td>" + (data.remedy.split(",")[i]?data.remedy.split(",")[i] + "개":"-") + "</td>" +
									"<td>" + (data.etc.split(",")[i]?data.etc.split(",")[i]:"-") + "</td>" +
								+ "</tr>"
							);
							
						}
					},
					error: function(e) {
						alert("error");
					}
 				});
			});
			
		});
	</script>
</div>

</body>
</html>