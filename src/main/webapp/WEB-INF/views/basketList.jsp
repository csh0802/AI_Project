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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.example.demo.vo.BoardVO, java.util.List" %>
    

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="01_nav_footer.css">
  <link rel="stylesheet" href="03_community.css">

  
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


</script>
  
<title>ColorBox</title>
  
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
            <a class="nav-link text-white" href="boardList">Community</a>
		<li class="nav-item">
            <a class="nav-link text-white" href="basketList">ColorBox</a>
      
         <!--  </li>
          <li class="nav-item">
            <a class="nav-link" href="exampleModal" data-bs-toggle="modal" data-bs-target="#exampleModal">Login</a>
          </li> -->
        </ul>
      </div>
    </div>
  </nav>

  

  <!-- 03_community.html -->
  <div class="main">
    <h1>ColorBox</h1>
      
    
   
    <!-- Board -->
 
    <section>
   
      <div class="row row-cols-lg-10 mt-5">
        <table class="table table-striped table-hover">
          <thead class="table-dark">
          
      <tr><th>No</th><th>진단결과</th><th>상의</th><th>하의</th><tr>
          </thead>
          <tbody>
            <tr>
              <c:forEach items="${blist}" var="colorBoxVO">
   <tr>
      <td>${colorBoxVO.id }</td>
      <td>${colorBoxVO.PColor}</td>
      <td>${colorBoxVO.top }</td>
      <td>${colorBoxVO.bottom }</td>
   </tr>
   </c:forEach>
            </tr>
          </tbody>
        </table>    
         
      </div>
   


      

  
  
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>  
</body>
</html>