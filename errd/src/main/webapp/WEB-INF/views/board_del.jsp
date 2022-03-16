<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

<title>ERRD, 에르디</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/album/">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="album.css" rel="stylesheet">

</head>
<body>
	<div style="width: 100%; text-align: center; padding-top: 20px;" id="today-card-form">
		<div class="card border-dark mb-3"
			style="display: inline-block;">
			<div class="card-header">삭제하실 글의 비밀번호 4자리를 입력해주세요 :)</div>
			<div class="card-body text-dark">
				<form name="todayCardDelForm" id="todayCardDelForm" method="post">
					<input type="hidden" name="board_no" id="board_no" value="${no}"/>
					<div class="form-group">
						<label for="userPass">비밀번호</label> 
						<input type="password" class="form-control" name="board_pwd" id="board_pwd"	maxlength="4" >
					</div>
					<button class="btn btn-outline-secondary" onclick="del_check(); return false;">삭제하기</button>
					<button id="cancel-btn" class="btn btn-outline-secondary">취소하기</button>
				</form>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	﻿
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
  
  function del_check(){
	  if($.trim($('#board_pwd').val()) == ''){
		  alert('비밀번호를 입력해주세요 :)')
		  $('#board_pwd').val('').focus();
		  return false;
	  }
	  
	  if($.trim($('#board_pwd').val()).length < 4){
		  alert('비밀번호는 4자리로 입력해주세요 :)')
		  $('#board_pwd').val('').focus();
		  return false;
	  }
	  
	  document.todayCardForm.action="/todayCard_del/"+${no};
	  document.todayCardForm.submit();
	  
  }

  
  $(function (){
		$("#cancel-btn").click(function (){
			//opener.location.replace('/'); 부모창 index 페이지로 이동
			window.close(); //게시글 삭제 팝업 닫아주기
	  });
	});
  
  </script>
</body>
</html>
