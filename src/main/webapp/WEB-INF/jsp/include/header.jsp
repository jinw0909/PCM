<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
<div class="d-flex justify-content-between" style="background: ${branchColor}">
	<div><a href="/commons/main_view">${branchName}</a> ${permission } ${pokemonName}님 환영합니다.</div>
	<div id="clock"></div>
	<div class="dropdown">
	  <input style="background: url(${picture}); background-size: cover" class="picture dropdown-toggle" type="button" id="dropdownMenuButton1"  data-bs-toggle="dropdown" aria-expanded="false">
	  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
	  	<li><a class="dropdown-item" href="/commons/main_view">메인페이지</a></li>
	    <li><a class="dropdown-item" data-toggle="modal" data-target="#exampleModal" href="#">정보수정</a></li>
	    <li><a class="dropdown-item" href="/commons/log_out">로그아웃</a></li>
	  </ul>
	</div>
	

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">개인정보 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <div class="input-group">
		      <div class="input-group-prepend col-3">
		      	<span class="input-group-text d-block text-center">로그인ID 변경</span>
		      </div>
			  <input class="form-control" type="text" value="${loginId}" id="modifyId">	
		  </div>
	      <div class="input-group">
		      <div class="input-group-prepend col-3">
		      	<span class="input-group-text text-center">신규 비밀번호</span>
		      </div>
			  <input class="form-control" type="password">	
		  </div>
	      <div class="input-group">
		      <div class="input-group-prepend col-3">
		      	<span class="input-group-text">비밀번호 확인</span>
		      </div>
			  <input class="form-control" type="password" id="modifyPassword">	
		  </div>
	      <div class="input-group">
		      <div class="input-group-prepend col-3">
		      	<span class="input-group-text d-block text-center">이름 변경</span>
		      </div>
			  <input class="form-control" type="text" value="${pokemonName}" id="modifyName">	
		  </div>
		  <input type="button" class="form-control btn btn-secondary" value="사진 변경" id="fileUploadBtn">
		  <input type="file" id="modifyPicture" accept="image/*" multiple>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="confirmBtn">수정하기</button>
      </div>
    </div>
  </div>
</div>
	
</div>
</header>
<script>
	$(document).ready(function() {
		
		$("#confirmBtn").on("click", function(e) {
			
			e.preventDefault();
			
			let formData = new FormData();
			let loginId = $("#modifyId").val().trim();
			let password = $("#modifyPassword").val().trim();
			let name = $("#modifyName").val().trim();
			let picture = $("#modifyPicture")[0].files[0];
			formData.append("loginId", loginId);
			formData.append("password", password);
			formData.append("name", name);
			formData.append("picture", picture);
			
			$.ajax({
				method: "post",
				url: "/commons/modify_pokemon",
				enctype: "multipart/form-data",
				processData: false,
				contentType: false,
				data: formData,
				success: function(data) {
					if (data.result == "success") {
						alert("수정 성공");
					} else {
						alert("수정 실패");
					}
				},
				error: function(error) {
					alert("error");
				}
			});
			
		});
		
		var clockTarget = document.getElementById("clock");
		
		function clock() {
		    var date = new Date();
		    var month = date.getMonth();
		    var clockDate = date.getDate();
		    var day = date.getDay();
		    var week = ['일', '월', '화', '수', '목', '금', '토'];
		    var hours = date.getHours();
		    if (hours < 10) { hours = "0" + hours} else { hours = hours }
		    var minutes = date.getMinutes();
		    if (minutes < 10) { minutes = "0" + minutes} else { minutes = minutes }
		    var seconds = date.getSeconds();
		    if (seconds < 10) { seconds = "0" + seconds} else { seconds = seconds }
		    
		    clockTarget.innerText = (month+1) + "월 " + clockDate + "일" + week[day] + "요일" + hours + ":" + minutes;

		}
		
		function init() {
			clock();
			setInterval(clock, 1000);
		}

		init();
		
	});
</script>