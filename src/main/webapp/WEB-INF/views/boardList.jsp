<!DOCTYPE html>
<html lang="ko">
<head>
 <link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<style type="text/css">

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

/* aside {
  float: left;
} */

section {
 text-align:center;
  width: 900px;


.nav_factor {
  text-decoration: none;
  color: white;
  margin-right: 2rem;
}

footer {
  height: 60px;
}  
}

.searchDiv{
text-align: right;
}

</style>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.example.demo.vo.BoardVO, java.util.List" %>

  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %> <!-- 현재 페이지를 세션에 추가해줌 -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="01_nav_footer.css">
  <link rel="stylesheet" href="03_community.css">

  <title>Community</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

	<script type="text/javascript">
	

function a(url){
	const id=getCookie("id");
	if(id){
		location.href=url;
	}else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    window.close();

   }
   
}

function getCookie(cname) {
	  let name = cname + "=";
	  let decodedCookie = decodeURIComponent(window.opener.document.cookie);
	  let ca = decodedCookie.split(';');
	  for(let i = 0; i <ca.length; i++) {
	    let c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if (c.indexOf(name) == 0) {
	      return c.substring(name.length, c.length);
	    }
	  }
	  return "";
	}



$(document).ready(function(){
	
	<% String ids = (String) session.getAttribute("id"); %> 
	
	
	$("#searchBtn").click(function(){
		const searchType=$("#searchType").val();
		const keyword=$("#keyword").val();
		//alert(searchType+":"+keyword);
		$.post('search',{searchType,keyword},function(data){
			$('#boardTable > tbody').empty();
			console.log(data[0].no);
			if(data.length>=1){
				data.forEach(function(item){
					str='<tr>'
					str +="<td>"+item.no+"</td>";
					str+="<td><a href = 'viewArticle?no=" + item.no + "'>" + item.title + "</a></td>";
					str+="<td>" + item.id + "</td>";
					str+="<td >"+item.writeDate+"</td>";
					str+="</tr>"
					$('#boardTable').append(str);
        		})				 
			}
			
			
		
			});
		});
		

	
	});	
	


</script>
  
  
  
</head>
<body>

  <nav class="d-flex fixed-top align-items-center justify-content-between navbar navbar-expand-md navbar-dark bg-dark fixed-top ">
    <a href="02_home.html"><img  src="./images/logo.png"   height="50px" alt=""></img></a>
    <div class="me-2">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">

          <li class="nav-item">
            <div class="nav-link text-white" id='loginOK'>  <%=ids %>님~ 자유롭게 글을 작성해보세요!</div>
          </li>
          <!--   <li class="nav-item">
            <a class="nav-link text-white" href="boardList">Community</a>
		<li class="nav-item">
            <a class="nav-link text-white" href="basketList">ColorBox</a>
      
       -->
          <!-- </li>
          <li class="nav-item">
            <a class="nav-link" href="exampleModal" data-bs-toggle="modal" data-bs-target="#exampleModal">Login</a>
          </li> -->
        </ul>
      </div>
    </div>
  </nav>

  <!-- 03_community.html -->
  <div class="main">
  
    <h1>Community <i class="fas fa-bullhorn fa-x"></i></h1>

    <!-- Sidebar -->   
    <aside class="row row-cols-lg-1 mt-5">
      <ul class="list-group">
        <li class="list-group-item text-primary col-lg-12">

             <a href="#" class="a_style btn btn-light">ColorBox</a>
        </li>
         <li class="list-group-item text-primary col-lg-12">

             <a href="scrapList" class="a_style btn btn-light">ScrapBox</a>
        </li>
    
       
      </ul>
    </aside> 
    <!-- Board -->
   <!--  <form action="getBoardList.jsp" method="get">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right">
						<select id="searchCondition" name="searchCondition">
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
						</select>
						<input id="searchKeyword" name="searchKeyword" type="text">
						<input type="submit" value="검색 ">
					</td>
				</tr>		
			</table>
		</form> -->
		<br>
		<br>
		 <div class="searchDiv" >
			 <select id="searchType">	 	
			 	<option value="title">마이컬러</option>
			 	<option value="id">아이디</option>
			 </select>
		<input type="text" id="keyword" name="keyword" style="width: 230px" placeholder="마이컬러 or 아이디로 찾기 !"/>
		 	<button type="button" id="searchBtn" class="btn btn-outline-dark">검색</button>
		
		 </div>
    <section>
   
      <div class="row row-cols-lg-10 mt-5">
        <table class="table table-striped table-hover" id="boardTable">
          <thead class="table-dark">
      <tr><th>번호</th><th>마이컬러<i class="fas fa-palette"></i></th><th>아이디</th><th>작성일</th><tr>
          </thead>
          <tbody>
            <tr>
              <c:forEach items="${boardList}" var="article">

		<tr>
			<td>${article.no }</td>
			<td><a href="viewArticle?no=${article.no }">${article.title }</a></td>
			<td>${article.id }</td>
			<td><fmt:formatDate pattern="yyyy/MM/dd" value="${article.writeDate }"/></td>
		</tr>
	</c:forEach>

            </tr>
          </tbody>
        </table>
  
      </div>
   
<footer>
		 <nav aria-label="Page navigation example" class="d-flex justify-content-around mt-3 "> 		 	
  		 	 <ul class="pagination">
			
<li><a href="javascript:a('boardWriteForm')" class="btn btn-secondary btn-lg">글 작성하러 가기</a></li>
			
			</ui>			
		</nav>
</footer>
   </section>   
    <!--   <footer>

      <nav aria-label="Page navigation example" class="d-flex justify-content-around mt-3 ">
    <ul class="pagination">


          <li class="page-item"><a class="page-link" href="#">Previous</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul> 
      </nav>
    </section>
  </div>
  </footer>
 -->
  
  
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>  
</body>
</html>