<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>ERRD, 에르디</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/album/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="album.css" rel="stylesheet">
    
  </head>

  <body>

    <header>
      <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
          <div class="row">
            <div class="col-sm-8 col-md-7 py-4">
              <h4 class="text-white">About</h4>
              <p class="text-muted">ERRD는 'EVERY DAY'의 속어(Slang) 입니다. 에르디는 매일 매일 반복되는 일상, 그 일상을 채우는 오늘의 가치에 대해 귀기울이는 공간이 되고자 합니다. 자세히 들여다볼수록 어제와는 조금씩 다른 오늘들. 에르디는 공간 안에서 낯선 사람들과 시간을 매개체로 일상을 재해석하며 시간을 차곡차곡 쌓아갑니다. 당신의 오늘,요일,매일 에르디</p>
            </div>
            <div class="col-sm-4 offset-md-1 py-4">
              <h4 class="text-white">Contact</h4>
              <ul class="list-unstyled">
                <li><a href="https://www.instagram.com/errd.seoul/" class="text-white">Follow on Instagram</a></li>
                <li><a href="#" class="text-white">Email me</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="navbar navbar-dark bg-dark box-shadow">
        <div class="container d-flex justify-content-between">
          <a href="/" class="navbar-brand d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
            <strong>ERRD</strong>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
      </div>
    </header>

    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">ERRD, 에르디</h1>
          <p class="lead text-muted">"당신에게 오늘은 어떤 요일(DAY)인가요?"</p>
          <p>
            <button class="btn btn-secondary my-2" id="today-card-form-btn">오늘의 하루 공유하기</button>
          </p>
        </div>
      </section>
		
	  
	  <!-- 글쓰기 카드 -->
	  <div style="width:100%; text-align:center;"  id="today-card-form">
	  	<div class="card border-dark mb-3" style="width:400px; display:inline-block;">
				<div class="card-header">당신의 오늘 하루는 어땠나요?</div>
				<div class="card-body text-dark">
					<form name="todayCardForm" id="todayCardForm" method="post" action="">
						<div class="form-group">
							<label for="userName">당신의 이름은?</label> 
							<input type="text" class="form-control" name="board_name" id="board_name"> 
						</div>
						<div class="form-group">
							<label for="userCont">오늘의 하루는?</label>
							<textarea class="form-control" name="board_cont" id="board_cont" cols="20" rows="4"></textarea>
						</div>
						<div class="form-group">
							<label for="userPass">비밀번호</label> <input
								type="password" class="form-control" name="board_pwd" id="board_pwd" maxlength="4" placeholder="비밀번호는 4자리로 입력해주세요 :)">
						</div>
						<button class="btn btn-outline-secondary" onclick="check(); return false;">등록하기</button>
					</form>
				</div>
			</div>
	  </div>
		
      <div class="album py-5 bg-light">		
		<div class="container">
          <div class="row">
 			
 			<c:if test="${!empty blist}">
 				<c:forEach var="b" items="${blist}">
 			  <div class="col-lg-4 col-md-6">
              <div class="card mb-4 box-shadow">
                <!-- 
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                 -->
                <div class="card-body"> 
                  <h5 class="card-title">${b.board_name} 님의 하루</h5>
                  <p class="card-text">${b.board_cont}</p>
                  <div class="d-flex justify-content-between align-items-center">
                  	<small class="text-muted">${b.board_date}</small><br/>
                    <div class="btn-group">   
                      <button type="button" class="btn btn-sm btn-outline-secondary today-card-del-btn" value='${b.board_no}'>삭제</button>
                      <input class="board_no" type="hidden" value="${b.board_no}"/>
                      <button type="button" class="btn btn-sm btn-outline-secondary today-card-like-btn" value='${b.board_no}'><img class="today-card-like-icon" src="/images/hand-thumbs-up.svg" /><span class="today-card-like">${b.board_up}</span> likes</button>
                    </div> 
                  </div>
                </div> 
              </div>
            </div>
 				</c:forEach>
 				
 			</c:if>
 			
            <c:if test="${empty blist}">
            
            </c:if>	
            
            <%--페이징 쪽나누기 --%>
            <div style="width:100%; text-align:center;">
              <%--검색전 페이징 --%>
              <c:if test="${(empty find_field) && (empty find_name)}">
                <c:if test="${page <= 1}"><img src="/images/chevron-left.svg"/>&nbsp;</c:if>
                <c:if test="${page > 1}"><a href="/?page=${page-1}"><img src="/images/chevron-left.svg"/></a>&nbsp;</c:if>
        
                <%--쪽번호 출력 --%>
                <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                  <c:if test="${a == page}"><strong>${a}</strong></c:if> <%--현재 쪽번호가 선택된 경우 --%>
                  <c:if test="${a != page}"><a href="/?page=${a}" style="color:black;">${a}</a>&nbsp;</c:if><%--현재 쪽번호가 선택 안 된 경우 --%>
                </c:forEach>
        
                <c:if test="${page >= maxpage}"><img src="/images/chevron-right.svg"/></c:if>
                <c:if test="${page < maxpage}"><a href="/?page=${page+1}"><img src="/images/chevron-right.svg"/></a></c:if>
              </c:if>
      
              <%--검색 후 페이징 --%>
              <c:if test="${(!empty find_field) && (!empty find_name)}">
                <c:if test="${page <= 1}"><img src="/images/chevron-left.svg"/>&nbsp;</c:if>
                <c:if test="${page > 1}"><a href="/?page=${page-1}&find_field=${find_field}&find_name=${find_name}"><img src="/images/chevron-left.svg"/></a>&nbsp;</c:if>
        
                <%--쪽번호 출력 --%>
                <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                  <c:if test="${a == page}"><strong>${a}</strong></c:if> <%--현재 쪽번호가 선택된 경우 --%>
                  <c:if test="${a != page}"><a href="/?page=${a}&find_field=${find_field}&find_name=${find_name}" style="color:black;">${a}</a>&nbsp;</c:if><%--현재 쪽번호가 선택 안 된 경우 --%>
                </c:forEach>
        
                <c:if test="${page >= maxpage}"><img src="/images/chevron-right.svg"/></c:if>
                <c:if test="${page < maxpage}"><a href="/?page=${page+1}&find_field=${find_field}&find_name=${find_name}"><img src="/images/chevron-right.svg"/></a></c:if>
             </c:if>
           </div>
           <%--페이징 쪽나누기 종료--%>
            
          </div>
        </div>
      </div>

    </main>

    <footer class="text-muted">
      <div class="container" style="padding-top: 30px;">
        <p class="float-right">
          <a href="#"><img src="/images/chevron-double-up.svg"/></a>
        </p>
        <p>에르디(ERRD) | CEO. 심상우 | Add. 서울 관악구 관악로12길 113 | Instagram. <a href="https://www.instagram.com/errd.seoul">https://www.instagram.com/errd.seoul</a></p>
        <p>Copyright &copy; Cafe ERRD. All right reserved.</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
  <script>
  
  $("#today-card-form").css("display" ,"none");
  
  $(function (){
		$("#today-card-form-btn").click(function (){
	  	$("#today-card-form").toggle();
	  });
	});
  
  function check(){
	  if($.trim($('#board_name').val()) == ''){
		  alert('이름을 작성해주세요 :)')
		  $('#board_name').val('').focus();
		  return false;
	  }
	  
	  if($.trim($('#board_name').val()).length > 20){
		  alert('이름은 20자 이내로 작성해주세요 :)')
		  $('#board_name').focus();
		  return false;
	  }
	  
	  if($.trim($('#board_cont').val()) == ''){
		  alert('오늘의 하루에 대해 편하게 작성해주세요 :)')
		  $('#board_cont').val('').focus();
		  return false;
	  }
	  
	  if($.trim($('#board_cont').val()).length > 100){
		  alert('오늘의 하루에 대해 100자 이내로 작성해주세요 :)')
		  $('#board_cont').focus();
		  return false;
	  }
	  
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
	  
	  document.todayCardForm.action="/todayCard_ok";
	  document.todayCardForm.submit();
	  
  }
  
  function closeCardForm(){
	  $("#today-card-form").css("display" ,"none");
  };
  
  $(function (){
		$(".today-card-del-btn").click(function (){
			var delNum = $(this).val();
			var url = "/todayCard_del/"+delNum;
			var name = "delBoard popup";
			var option = "width = 440, height = 260, top = 100, left = 200, location = no";
			window.open(url, name, option);
	  });
	});
  
  $like_state = 0;
  $(function (){
		$(".today-card-like-btn").click(function (){
			$board_no = $(this).val();
			$icon = $(this).children('.today-card-like-icon');
			$count = $(this).children('.today-card-like');
			
			$.ajax({
		        type:"POST",//HTTP 통신의 종류
		        url:"/todayCard_like", //아작스 서버 주소 파일명
		        data: {
		        	"board_no":$board_no, 
		        	"like_state":$like_state
		        	}, //전송할 데이터
		        dataType:"json",//서버에서 반환되는 데이터 형식
		        
		        success: function (data) {//success는 아작스로 받아오는것이 성공했을 경우 서버 데이터를 data변수에 저장
		          $like_state = data.like_state;
		      	  if($like_state == 1){//좋아요 눌렀다
		      		$newtext='좋아요를 누르셨습니다!';
		      	    alert($newtext);
		      	    $icon.attr("src", "/images/hand-thumbs-up-fill.svg");
		      	    getLikeCount($board_no);
		          	return false;
			     
		      	  }else{//좋아요 누른 상태
		      		$newtext='좋아요를 취소하셨습니다!';
		      		alert($newtext);
		      		$icon.attr("src", "/images/hand-thumbs-up.svg");
		      		getLikeCount($board_no);
		          	return false;
		      	  } 	    	  
		        },
		    	  error:function(){//비동기식 아작스로 서버디비 데이터를
		    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
		    		  alert("data error");
		    	  }
		      });
		});
	
	});
  
  
  function getLikeCount(board_no, count){
	  $.ajax({
	        type:"POST",//HTTP 통신의 종류
	        url:"/todayCard_likeCount", //아작스 서버 주소 파일명
	        data: {
	        	"board_no":board_no,
	        	}, //전송할 데이터
	        dataType:"json",//서버에서 반환되는 데이터 형식
	        
	        success: function (data) {//success는 아작스로 받아오는것이 성공했을 경우 서버 데이터를 data변수에 저장
	        	$like_count = data.like_count;
	        	$count.text($like_count);
	        },
	    	  error:function(){//비동기식 아작스로 서버디비 데이터를
	    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
	    		  alert("data error");
	    	  }
	      });
  }
  
 
  </script>
  </body>
</html>
