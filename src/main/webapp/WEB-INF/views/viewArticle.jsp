
<!DOCTYPE html>
<html lang="ko">
<head>

<style type="text/css">
/* 03_community.css */
/* 아래에 코드를 작성해 주세요. */


.main {
  margin-top: 120px;
  margin-right: 70px;
  margin-bottom: 120px;
  margin-left: 70px;
}

.a_style {
  text-decoration: none;
}

h2 {
  font-weight: bold;
  text-align: center;
}

aside {
  float: left;
}

section {
  float: right;
  width: 900px;
  
 
/* 01_nav_footer.css */
/* 아래에 코드를 작성해 주세요. */


.nav_factor {
  text-decoration: none;
  color: white;
  margin-right: 2rem;
}

footer {
  height: 60px;
}  
}


</style>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.demo.vo.BoardVO"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<!-- Custom CSS -->
  <link rel="stylesheet" href="01_nav_footer.css">
  <link rel="stylesheet" href="03_community.css">



<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="css/jquery.lightbox.css" media="screen" />


   
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



</head>
<body>
  <!-- 01_nav_footer.html -->
  <!-- 01_nav_footer 에서 완성한 Navigation bar 코드를 붙여넣어 주세요. -->
  <nav class="d-flex fixed-top align-items-center justify-content-between navbar navbar-expand-md navbar-dark bg-dark fixed-top ">
    <a href="02_home.html"><img  src="./images/logo.png"   height="50px" alt=""></img></a>
    <div class="me-2">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" id='exit' href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white"  onclick="history.back()">Community</a>

      
          </li>
          <li class="nav-item">
            <a class="nav-link" href="exampleModal" data-bs-toggle="modal" data-bs-target="#exampleModal">님</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- 03_community.html -->
  <div class="main">
    <h2>${article.no }번 글</h2>
      
  


	<div  class="container">
<%-- <h3 style="text-align:center">${article.no }번 글보기</h3> --%>


<form action="replyWriteForm" method="post">
      <input type="hidden" name="no" value="${article.no }" >
<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">
	<tr><td>작성자</td><td><input value="${article.id }"  readonly style="background:lightgray"></td></tr>
	<tr><td>글제목</td><td><input  value="${article.title }" readonly style="background:lightgray"></td></tr>
	<tr><td>글내용</td><td><textarea rows ="8" cols="10" readonly style="background:lightgray" >${article.content}</textarea></td></tr>
	<tr><td>첨부된파일</td><td><div id="div1" class="div"><a href="upload/${article.fileName }"><img src="uploadImg/${article.fileName }" height="50"></a></div></td><tr>


</table>


</form>

	
	<h3 style="text-align:center">댓글</h3>

<!-- <table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">	

								<td>

						<textarea type="text" class="form-control"
								placeholder="댓글을 입력하세요." name="replyContent" maxlength="2048"></textarea>
								</td>
						<td style="text-align: left; "><input type="submit" value="댓글쓰기" class="btn btn-primary"></td>
					
				</table>
			 -->
  <!--  댓글  -->
    <div class="container">
        <label for="content">comment</label>
     
      <!--   <form name="commentInsertForm" id="commentInsertForm"> -->
            <div class="input-group" id='input'>
               <input type="hidden" name="bno" value="${article.no}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력해주세요.">
               <span class="input-group-btn">
                    <button class="btn btn-dark" type="button" id="commentInsertBtn">등록</button>
               </span>
              </div>
       
        <!-- </form> -->
    </div>


    <div class="container">
        <div class="commentList" id="commentList"></div>
    </div>
</div>


<%@ include file="comment.jsp" %>


<center>


&nbsp;&nbsp; <p class="btn btn-dark" onclick="history.back()">목록으로 가기</p>

<!-- &nbsp;&nbsp; <p class="btn btn-primary" onclick="window.close()">홈으로</p> -->


</center>


</div>

<script type="text/javascript" src="js/jquery.1.2.3.js"></script>
<!-- Add jQuery lightBox plugin script to the end of the DOM -->
<!-- Make sure there is a jQuery framework, loaded, before the plugin script loads -->
<script type="text/javascript" src="js/jquery.lightbox.min.js"></script>
<!-- Activate the jQuery lightBox plugin -->
<script type="text/javascript">
$(function() {

	
	$('#div1 a').lightBox();
});



</script>
</body>
</html>