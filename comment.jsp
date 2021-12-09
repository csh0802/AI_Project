<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript">
var bno =${article.no}; //게시글 번호


$("#commentInsertBtn").click(function(){ //댓글 등록 버튼 클릭시 
   const insertData = $("#content").val();

   //var insertData = $("#commentInsertForm").serialize();//commentInsertForm의 내용을 가져옴
	//alert(insertData);
    commentInsert(insertData); //Insert 함수호출
});
 
 
//댓글 목록 
function commentList(){
	
    $.ajax({
        url : 'commentlist',
        type : 'get',
        data : {'bno':bno},
        cache: false,
        dataType: "json",
   
        
        success : function(data){
        	
 			  var a =''; 
 
           // console.log(data);
            data.commentList.forEach(function(item,index){
            	  a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                  a += '<div class="commentInfo'+item.cno+'">'+'댓글번호 : '+item.cno+' / 작성자 : '+item.writer;
                  a += '<a onclick="commentUpdate('+item.cno+',\''+item.content+'\');"> 수정 </a>';
                  a += '<a onclick="commentDelete('+item.cno+');"> 삭제 </a> </div>';
                  a += '<div class="commentContent'+item.cno+'"> <p> 내용 : '+item.content +'</p>';
                  a += '</div></div>';
                //console.log(item.content);
            });
        
            $(".commentList").html(a);
        },
   
    });
}  

//댓글 등록
function commentInsert(insertData){
/*     $.ajax({
        url : 'commentInsert',
        type : 'post',
        data : insertData,
        success : function(data){
        	console.log(data);
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $("#content").val('');
            } 
        }
    }); */
    $.post('commentInsert',{insertData},function(data){
    	if(data!=null){
    		commentList();
    		$("#content").val('');
    	}
    	
    });
    
    
    
    
    
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" id="updateContent" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}

//댓글 수정
function commentUpdateProc(cno){
    //var updateContent = $('[name=content_'+cno+']').val();
    var updateContent=$("#updateContent").val();
   // console.log(updateContent);

    
    $.post('commentUpdate',{updateContent,'cno':cno},function(data){
    	if(data!=null){
    		commentList(bno);
    	}
    	
    })
  
}
 
//댓글 삭제 
function commentDelete(cno){
	alert('삭제');
  
$.post('commentDelete',{cno},function(data){
	if(data!=null){
		commentList(bno);
	}
});

}
 

 $(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});

 
</script>



</head>
<body>
<div>

</div>
</body>
</html>