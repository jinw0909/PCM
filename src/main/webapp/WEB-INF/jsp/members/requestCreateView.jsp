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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<div class="request-container container d-flex flex-column justify-content-center">
	<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
	<section class="request-section">
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<% for (int i = 0; i < 6; i++) { %>
					<th>환자<%=i + 1 %><input type="checkbox" class="checkbox" id="checkBox_<%=i %>" value="<%=i %>"></th>
					<% } %>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th style="width: 100px">타입</th>
					<% for (int i = 0; i < 6; i++) { %>
					<td>
						<select type="text" class="form-control type-select" id="typeInput_<%=i %>" onchange=" this.dataset.chosen = this.value; ">
							<option>타입 선택</option>
							<option>노말</option>
							<option>불꽃</option>
							<option>물</option>
							<option>풀</option>
							<option>전기</option>
							<option>얼음</option>
							<option>격투</option>
							<option>독</option>
							<option>땅</option>
							<option>비행</option>
							<option>에스퍼</option>
							<option>벌레</option>
							<option>바위</option>
							<option>고스트</option>
							<option>드래곤</option>
						</select>
					</td>
					<% } %>
				</tr>
				<tr>
					<th style="width: 100px">이름</th>
					<% for (int i = 0; i < 6; i++)  { %>
						<td><input type="text" class="form-control" id="nameInput_<%=i %>"></td>
					<% } %>
				</tr>
				<tr>
					<th style="width: 100px">레벨</th>
					<% for (int i = 0; i < 6; i++)  { %>
						<td><input type="text" class="form-control" id="levelInput_<%=i %>"></td>
					<% } %>
				</tr>
				<tr>
					<th>투여량</th>
					<% for (int i = 0; i < 6; i++)  { %>
						<td><input type="text" class="form-control" id="remedyInput_<%=i %>"></td>
					<% } %>
				</tr>
				<tr>
					<th>비고</th>
					<% for (int i = 0; i < 6; i++)  { %>
						<td><textarea type="text" class="form-control" id="etcInput_<%=i %>"></textarea>
					<% } %>
				</tr>
				<tr>
					<th>트레이너명</th>
					<td colspan="3"><input type="text" class="form-control" id="trainerInput"></td>
				</tr>
			</tbody>
		</table>
		<a class="form-control btn block btn-success w-100" id="requestBtn" href="#" data-target="#requestModal" data-toggle="modal">치료제 요청하기</a>
		
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
</div>

<!-- Modal -->
<div class="modal fade" id="requestModal" tabindex="-1" role="dialog" aria-labelledby="requestModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">요청서 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body request-modal-body">
       <table class="table request-table">
       	<thead>
       		<tr>
       			<th>번호</th>
       			<th>타입</th>
       			<th>이름</th>
       			<th>레벨</th>
       			<th>투여량</th>
       			<th>특이사항</th>
       		</tr>
       	</thead>
       	<tbody>
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
        <button type="button" class="btn btn-primary" id="requestConfirmBtn">요청하기</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function() {
		
		$(".checkbox").on("change", showInput);
		
		function showInput() {
			let value = $(this).val();
			console.log(value);
			if ($(this).is(":checked")) {
				$("#typeInput_" + value).attr("disabled", true);
				$("#nameInput_" + value).attr("readonly", true);
				$("#levelInput_" + value).attr("readonly", true);
				$("#remedyInput_" + value).attr("readonly", true);
				$("#etcInput_" + value).attr("readonly", true);
			} else {
				$("#typeInput_" + value).removeAttr("disabled");
				$("#nameInput_" + value).removeAttr("readonly");
				$("#levelInput_" + value).removeAttr("readonly");
				$("#remedyInput_" + value).removeAttr("readonly");
				$("#etcInput_" + value).removeAttr("readonly");
			}
		};
		
		
		$("#requestBtn").on("click", function() {
			let headCount = 0;
			for (let i = 0; i < 6; i++) {
				if ($("#checkBox_" + i).is(":checked")) {
					headCount++;
				}
			}
			console.log("headCount: ", headCount);
			let types = [];
			for (let i = 0; i < 6; i++) {
				if ($("#typeInput_" + i).val() == "타입 선택" || !$("#typeInput_" + i).prop("disabled")) {
					continue;
				} else {
					types[i] = $("#typeInput_" + i).val().trim(); 
				}
			}
			types = types.filter(e => e.length > 0).toString();
			console.log(types);
			
			let patients = [];
			for (let i = 0; i < 6; i++) {
				if ($("#nameInput_" + i).val() == null  || !$("#nameInput_" + i).prop("readonly")) {
					continue;
				} else {
					patients[i] = $("#nameInput_" + i).val().trim(); 
				}
			}
			patients = patients.filter(e => e.length > 0).toString();
			console.log(patients);
			
			let levels = [];
			for (let i = 0; i < 6; i++) {
				if ($("#levelInput_" + i).val() == "" || !$("#levelInput_" + i).prop("readonly")) {
					continue;
				} else {
					levels[i] = $("#levelInput_" + i).val().trim(); 
				}
			}
			levels = levels.filter(e => e.length > 0).toString();
			console.log(levels);
			
			let remedy = [];
			let totalRemedy = 0;
			for (let i = 0; i < 6; i++) {
				if ($("#remdeyInput_" + i).val() == "" || !$("#remedyInput_" + i).prop("readonly")) {
					continue;
				}
				remedy[i] = $("#remedyInput_" + i).val().trim();
				totalRemedy += Number(remedy[i]);
			}
			remedy = remedy.filter(e => e.length > 0).toString();
			console.log(remedy);
			console.log("totalRemedy: ", totalRemedy);
			
			let etc = [];
			for (let i = 0; i < 6; i++) {
				if ($("#etcInput_" + i).val() == "" || !$("#etcInput_" + i).prop("readonly")) {
					continue;
				} else {
					etc[i] = $("#etcInput_" + i).val().trim(); 
					
				}
			}
			etc = etc.filter(e => e.length > 0).toString();
			console.log(etc);
			
			let trainerName = $("#trainerInput").val().trim();
			
			
			console.log("trainerName: ", trainerName);
			
			$(".request-table > tbody").empty();
			$(".trainer-name").empty();
			$(".total-remedy").empty();
			for (let i = 0; i < headCount; i++) {
				$(".request-table > tbody").append(
					"<tr>" 
						+ "<td>" + (i + 1) + "</td>"
						+ "<td>" + (types.split(",")[i]? types.split(",")[i] : "-") + "</td>"
						+ "<td>" + (patients.split(",")[i]? patients.split(",")[i] : "-") + "</td>"
						+ "<td>" + (levels.split(",")[i]? levels.split(",")[i]: "-") + "</td>"
						+ "<td>" + (remedy.split(",")[i]? remedy.split(",")[i]: "-") + "</td>"
						+ "<td>" + (etc.split(",")[i]? etc.split(",")[i]: "-") + "</td>" +
					"</tr>"
				);
			}
			$(".trainer-name").append(
					"<b>트레이너명</b>" +
					"<span>" + trainerName + "</span>"
			)
			/* $(".head-count").append(
				"<span>총 " + headCount + "마리</span>"		
			); */
			$(".total-remedy").append(
				"<h3>" + totalRemedy + "</h3>"		
			);
			
			let sumUp = function() {
				let data = {};
				data.types = types;
				data.patients = patients;
				data.levels = levels;
				data.remedy = remedy;
				data.totalRemedy = totalRemedy;
				data.etc = etc;
				data.headCount = headCount;
				data.trainerName = trainerName;
				return data;
			};
			
			onClickRequestBtn = sumUp;
						
			
		});
		let onClickRequestBtn;
		
		$("#requestConfirmBtn").on("click", function() {
			let data = onClickRequestBtn();
			$.ajax({
				method: "post",
				url: "/members/create_request",
				data: JSON.stringify(data),
					/* {"types": data.types,
					"remedy": data.remedy,
					"patients": data.patients,
					"levels": data.levels,
					"etc": data.etc,
					"headCount": data.headCount,
					"trainerName": data.trainerName}, */
				contentType: "application/json; charset=UTF-8",
				success: function(data) {
					if (data.result == "success") {
						alert("요청 성공");
						location.href = "/members/request_view";
					} else {
						alert("요청 실패");
					}
				},
				error: function(e) {
					alert("error");
				}
									
			});
		});
	});
</script>
</body>
</html>