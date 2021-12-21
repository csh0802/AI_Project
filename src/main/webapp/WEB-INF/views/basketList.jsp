<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>옛다 컬너 - My Color Box</title>
  <style>
    .navbar-custom {
      height: 50px;
    }
    
    header {
      height: 50px;
    }

    section {
      height: 400px;
      width: 100%;
      background-image: url('../img/gradient-bg.jpg');
      background-size: cover;
      display: flex;
      justify-content: center;
      
    }

    .container {
      height: 400px;
      width: 100%;
    }

    .colorBox {
      width: 80%;
      height: 250px;
      background-color: rgb(248, 248, 248);
      box-shadow: 20px 20px 50px grey
    }

    #sectionline {
      padding-left: 30px;
      padding-right: 30px;
    }

    #simulatorDiv {
      width: 100%;
      text-align: center;
    }

    .simul-container {
      align-self: center;
      padding-top: 50px;
      padding-left: 200px;
      padding-right: 200px;
      height: 600px;
      
    }

    .box {
      width: 300px;
      height: 50px;
      outline: 1px;
      outline-style: solid;
      outline-color: gray;
    }
    
  </style>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.example.demo.vo.BoardVO, java.util.List" %>
    

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!--jquery lib-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!--bootstrap css-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

  <!--javascript 영역-->
  <script src="../js/my.js"></script>
  
  <script>
    
  $(document).ready(function(){
		
		const id = $.cookie("id");
		if(!id){
			 alert("로그인 후 이용 가능합니다.")
			    window.close();
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
	

  

	});

    
  </script>
</head>
<body>
  <!--Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top navbar-custom">
    <div class="container-fluid align-items-center">
      <a class="navbar-brand" href="#">
        <img src="../img/logo.png" alt="" width="30" height="24">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="colorBox.html">MyColorBox</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick='window.open("boardList", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=300,width=800,height=500");'>Community</a>
          </li>
        </ul>
        <form>
        <span class="d-flex align-items-center" id="loginSpan">
          
            <input class="form-control me-2 form-control-sm " style="background-color: lightgrey;" placeholder="ID" aria-label="ID" id="id">
            <input class="form-control me-2 form-control-sm " style="background-color: lightgrey;" placeholder="PW" aria-label="PW" id="pw" type="password">
            <button class="btn btn-outline-light btn-sm" id="loginBtn">Login</button>        
        </span>
      </form>
      </div>
    </div>
  </nav> 
  <!--header 영역-->
  <header>

  </header>

  <!--My Color Box 영역-->
  <section>
    <div class="container">
      <center>
        <div class="mt-4">
          <h2 style="font-weight: bold; color: rgb(51, 51, 51);"><img src="../img/model.png" width="50px">My Color Box</h2>
        </div> 
        <div class="colorBox mt-4" id="colorBox">
          <div id="pcolor1">
                      <button  onclick='window.open("test", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=300,width=800,height=800");'>test</button>
            
          </div>
          <div id="bestColor"> 

          </div>
          <div id="worstColor">

          </div>
          
  
      </div>
        </div>
        </center>
    </div>
  </section>
  <div id="sectionline">
    <hr>
  </div>

  <!--색조합 시뮬레이터-->
	
	
  <div id="simulatorDiv" class="mt-5">
    <div class="d-flex justify-content-center">
      <h4 style="font-weight: bold; color: rgb(51, 51, 51);" > 색 조합 시뮬레이터 </h4>
    </div>

    <div id="simulContainer" class="simul-container mt-4">
      <!--얼굴 색 선택-->
      <div class="d-flex align-items-center justify-content-around">
        <div id="faceLabel" style="text-align: center;">
          <h5>얼굴</h5>
          <div class="dropdown">
            <button class="btn btn-sm dropdown-toggle" type="button" id="pcolorSelect" data-bs-toggle="dropdown" aria-expanded="false">
              퍼스널컬러
           
            </button>
            <ul class="dropdown-menu" aria-labelledby="pcolorSelect">
              <li><button class="dropdown-item" type="button" id="spring">봄 웜</button></li>
              <li><button class="dropdown-item" type="button" id="summer">여름 쿨</button></li>
              <li><button class="dropdown-item" type="button" id="autumn">가을 웜</button></li>
              <li><button class="dropdown-item" type="button" id="winter">겨울 쿨</button></li>
            </ul>
          </div>
        </div>
        <div id="fcolorDiv" class="box">
        </div>        
      </div>

      <div class="mt-3 mb-3">
        <hr>
      </div>

      <!--상의 색상 선택-->
      <div class="d-flex align-items-center justify-content-around mb-4">
        <div id="topLabel" style="text-align: center;">
          <h5>상의</h5>
          <div class="dropdown">
            <button class="btn btn-sm dropdown-toggle" type="button" id="topcolorSelect" data-bs-toggle="dropdown" aria-expanded="false">
              색상선택
            </button>
            <ul class="dropdown-menu" aria-labelledby="topcolorSelect">
            
            <c:forEach var="name" items='${spring }' varStatus="status">
            <li><button class="dropdown-item" type="button">${status.count } : <c:out value="${name}" /></button></li>
    		</c:forEach>
           
            </ul>
            
          </div>
        </div>
        <div id="topcolorDiv" class="box">
        </div>        
      </div>

      <!--하의 색상 선택-->
      <div class="d-flex align-items-center justify-content-around mb-4">
        <div id="btmLabel" style="text-align: center;">
          <h5>하의</h5>
          <div class="dropdown">
            <button class="btn btn-sm dropdown-toggle" type="button" id="btmcolorSelect" data-bs-toggle="dropdown" aria-expanded="false">
              색상선택
            </button>
            <ul class="dropdown-menu" aria-labelledby="btmcolorSelect">
              <li><button class="dropdown-item" type="button">색상1</button></li>
              <li><button class="dropdown-item" type="button">색상2</button></li>
              <li><button class="dropdown-item" type="button">색상3</button></li>
              <li><button class="dropdown-item" type="button">색상4</button></li>
            </ul>
          </div>
        </div>
        <div id="btmcolorDiv" class="box">
        </div>        
      </div>

      <!--신발 색상 선택-->
      <div class="d-flex align-items-center justify-content-around mb-4">
        <div id="shoeLabel" style="text-align: center;">
          <h5>신발</h5>
          <div class="dropdown">
            <button class="btn btn-sm dropdown-toggle" type="button" id="shcolorSelect" data-bs-toggle="dropdown" aria-expanded="false">
              색상선택
            </button>
            <ul class="dropdown-menu" aria-labelledby="shcolorSelect">
              <li><button class="dropdown-item" type="button">색상1</button></li>
              <li><button class="dropdown-item" type="button">색상2</button></li>
              <li><button class="dropdown-item" type="button">색상3</button></li>
              <li><button class="dropdown-item" type="button">색상4</button></li>
            </ul>
          </div>
        </div>
        <div id="shcolorDiv" class="box">
        </div>        
      </div>

    </div>
  </div>
  
</body>
</html>