<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.demo.vo.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="css/jquery.lightbox.css" media="screen" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>

	<div  class="container">
<h3 style="text-align:center">${article.no }번 글보기</h3>

<form action="replyWriteForm" method="post">
      <input type="hidden" name="no" value="${article.no }" >
<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
	<tr><td>작성자</td><td><input value="${article.id }"  readonly style="background:lightgray"></td></tr>
	<tr><td>글제목</td><td><input  value="${article.title }" readonly style="background:lightgray"></td></tr>
	<tr><td>글내용</td><td><textarea rows ="8" cols="10" readonly style="background:lightgray" >${article.content}</textarea></td></tr>
	<tr><td>첨부된파일</td><td><div id="div1" class="div"><a href="uploadImg/${article.fileName }"><img src="uploadImg/${article.fileName }" height="50"></a></div></td><tr>


</table>
	<h3 style="text-align:center">댓글</h3>
<!-- 
<table class="table table-striped"
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
        <form name="commentInsertForm" id="commentInsertForm">
            <div class="input-group" id='input'>
               <input type="hidden" name="bno" value="${article.no}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="commentInsertBtn">등록</button>
               </span>
              </div>
       
        </form>
    </div>
 
    <div class="container">
        <div class="commentList" id="commentList"></div>
    </div>
</div>


<%@ include file="comment.jsp" %>


<center>

&nbsp;&nbsp; <p class="btn btn-primary" onclick="history.back()">목록으로 가기</p>
&nbsp;&nbsp; <p class="btn btn-primary" onclick="window.close()">홈으로</p>

</center>
</form>
</div>
<script type="text/javascript" src="js/jquery.1.2.3.js"></script>
<!-- Add jQuery lightBox plugin script to the end of the DOM -->
<!-- Make sure there is a jQuery framework, loaded, before the plugin script loads -->
<script type="text/javascript" src="js/jquery.lightbox.min.js"></script>
<!-- Activate the jQuery lightBox plugin -->
<script type="text/javascript">
$(function() {
	// When DOM is ready, attach the lightBox to the proper elements

	// Left column
	//$('.galleries-set1 .gallery a').lightBox();

	// Right column

	$('#div1 a').lightBox();
});
</script>
</body>
</html>