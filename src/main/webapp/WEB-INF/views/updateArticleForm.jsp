<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<title>Insert title here</title>


</head>
<body>

  <nav class="d-flex fixed-top align-items-center justify-content-between navbar navbar-expand-md navbar-dark bg-dark fixed-top ">
    <a href="02_home.html"><img  src="./images/logo.png"   height="50px" alt=""></img></a>
    <div class="me-2">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">

      </div>
    </div>
  </nav>

  
	<div  class="container">
	
<h3 style="text-align:center">${article.no }번 게시글 수정</h3>

<form action="updateArticle" method="post" enctype="multipart/form-data">
		
		
		<input type="hidden" name="no" value="${article.no }">

		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tr><td>아이디</td><td><input name="id" id="id" value="${article.id }" readonly style="background:lightgray"></td></tr>
					<tr><td>마이컬러</td><td>
					<input list="browsers" name="title" id="title" value="${article.title }">
					  <datalist id="browsers">
					    <option value="봄웜톤">
					    <option value="여름쿨톤">
					    <option value="가을웜톤">
					    <option value="겨울쿨톤">
					  </datalist></td></tr>
					<tr><td>추천아이템</td><td><input name="content" value="${article.content }"  style="width:200px; height:200px; "></td></tr>
					<tr><td>파일첨부</td><td><input type="file" name="file" ></td></tr>
				
				
			
			</table>

	<footer>
		 <nav aria-label="Page navigation example" class="d-flex justify-content-around mt-3 "> 		 	
  		 	 <ul class="pagination">
			
					<li><input class="btn btn-dark page-item" type="submit" value="수정" ></li>
					<li><button onclick="history.back();" class="btn btn-dark ">취소</button></li>
				
			</ui>			
		</nav>
	</footer>
			
</form>

</div>
</body>
</html>