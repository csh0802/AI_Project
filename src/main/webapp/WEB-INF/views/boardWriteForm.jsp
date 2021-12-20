<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

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

h1 {
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

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="01_nav_footer.css">
  <link rel="stylesheet" href="03_community.css">


<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	const id=$.cookie("id");
	
	if(id){
		$("#id").val(id);
	}else{
		alert("로그인후 글쓰기가 가능합니다.");
	}
	
	
	$("#writeBtn").click(function(){
		const title = $("#title").val();
		const content = $("#content").val();
		if(!title || !content){
			alert("제목과 본문 내용은 필수입니다.");			
		}else{
			alert("게시글이 등록 되었습니다.")
		}
	});
	
});

</script>
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
  <!--       <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" id='exit' href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="03_community.html">Community</a>

      
          </li>
          <li class="nav-item">
            <a class="nav-link" href="exampleModal" data-bs-toggle="modal" data-bs-target="#exampleModal">Login</a>
          </li>
        </ul> -->
      </div>
    </div>
  </nav>

  
	<div  class="container">
<h2 style="text-align:center"><i class="fas fa-bullhorn"></i></h2>
<form action="boardWrite" method="post" enctype="multipart/form-data">

<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
	<tr><td>아이디</td><td><input name="id"id="id" readonly style="background:lightgray"></td></tr>
	<tr><td>제목</td><td> 
	<input list="browsers" name="title" id="title">
		  <datalist id="browsers">
		    <option value="봄웜톤">
		    <option value="여름쿨톤">
		    <option value="가을웜톤">
		    <option value="겨울쿨톤">
		  </datalist>
	</td></tr>
	<tr><td>내용</td><td><textarea rows ="8" cols="20" name="content" id="content"></textarea></td></tr>
	<tr><td>파일첨부</td><td><input type="file" name="file"></td><tr>


</table>

		<footer>
		 <nav aria-label="Page navigation example" class="d-flex justify-content-around mt-3 "> 		 	
  		 	 <ul class="pagination">
			
					<li><input type="submit" value="작성" id="writeBtn" class="btn btn-dark"></li>
					<li> <p onclick="location='boardList'" class="btn btn-dark ">목록</p></li>
				
			</ui>			
		</nav>
	</footer>


</form>
</div>
</body>
</html>