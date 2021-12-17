$(document).ready(function() {

	const id = $.cookie("id");
	if (id) {
		$("#loginSpan").html(id + "님 환영힙니다.<a href='#' class='get-started-btn2 scrollto' id='logoutBtn' >로그아웃</a>");
	}

	$("#loginBtn").click(function() {
		const id = $("#id").val();
		const pw = $("#pw").val();



		$.post('../login', { id, pw }, function(data) {
			data = JSON.parse(data);
			if (data.id) {
				$.cookie("id", data.id);
				$("#loginSpan").html(data.id + "님 환영힙니다.<a href='#' class='get-started-btn2 scrollto' id='logoutBtn' >로그아웃</a>");
			} else {
				alert(data.msg);
			}

		});
	});

	$(document).on("click", "#logoutBtn", function() {
		$.post('../logout', {}, function(data) {
			data = JSON.parse(data);
			if (data.msg == "ok") {
				$.removeCookie("id");
				location.reload();
			} else {
				alert(data.msg);
			}
		});
	});
	$(document).on('click', "#colorInsertBtn", function() {
		const pColor = $("#colorText").val();
		if (pColor) {
			$.post('../insertColorBox', { id, pColor }, function(data) {
				if (data.msg) {
					alert(data.msg);
				}
			});
		} else {
			alert("컬러입력하세요");
		}
	});
	$("#fileUploadBtn").click(function() {
		let formData = new FormData();
		formData.append('image', $("#file")[0].files[0]);

		$.ajax({
			type: 'post',
			url: '../personDetect',
			cache: false,
			data: formData,
			processData: false,
			contentType: false,
			success: function(data) {
				data = JSON.parse(data);
				if (data.result) {
					alert(data.result);
				} else {
					alert("data.result없음");
				}
			}

		});
	});
	$("#faceDetectBtn").click(function() {
		let formData = new FormData();
		formData.append('image', $("#file")[0].files[0]);

		$.ajax({
			type: 'post',
			url: '../objectDetect',
			cache: false,
			data: formData,
			processData: false,
			contentType: false,
			success: function(data) {
				data = JSON.parse(data);
				$("#drawCanvas").attr('width', data.info.size.width + 'px');
				$("#drawCanvas").attr('height', data.info.size.height + 'px');
				$("#drawCanvas").attr('style', "border: 1px solid #993300");
				const canvas = document.getElementById("drawCanvas");
				const context = canvas.getContext("2d");				
				var fileList = file.files ;

	      // 읽기
	      var reader = new FileReader();
	      reader.readAsDataURL(fileList [0]);

	      //로드 한 후
	      reader.onload = function  () {
	          //로컬 이미지를 보여주기
	          //document.querySelector('#divleftImg').src = reader.result;

	          //썸네일 이미지 생성
	          var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
	          tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
	          tempImage.onload = function () {
	              //리사이즈를 위해 캔버스 객체 생성
	              

	              //캔버스 크기 설정
	              canvas.width = 300; //가로 100px
	              canvas.height = 400; //세로 100px

	              //이미지를 캔버스에 그리기
	              context.drawImage(this, 0, 0, 300, 400);

	              //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
	              var dataURI = canvas.toDataURL("image/jpeg");

	              //썸네일 이미지 보여주기
	              document.querySelector('#divleftImg').src = dataURI;

	              context.strokeStyle = 'yellow';
					context.lineWidth = 3;


					const x = (data.faces[0].roi.x)
					const y = (data.faces[0].roi.y)

					const width = (data.faces[0].roi.width)
					const height = (data.faces[0].roi.height)


					console.log(x, y, width, height);

					context.strokeRect(x, y, width, height);
	          };
	      };
				
					
					
				
			}

		});
	});
	$("#celebrityDetection").click(function() {
		$("#resultDiv").text("");
		let formData = new FormData();
		formData.append('image', $("#file")[0].files[0]);
		
		$.ajax({
			type: 'post',
			url: '../celebrityDetect',
			cache: false,
			data: formData,
			processData: false,
			contentType: false,
			success: function(data) {
				data = JSON.parse(data);
				//console.log(data.info.size.width)
				if (data.info.faceCount == 1) {
					$("#drawCanvas").attr('width', data.info.size.width + 'px');
					$("#drawCanvas").attr('height', data.info.size.height + 'px');
					$("#drawCanvas").attr('style', "border: 1px solid #993300");
					const canvas = document.getElementById("drawCanvas");
					const context = canvas.getContext("2d");
					
					

					var jsonArray = new Array();
					if (data.info.faceCount > 0) {
						let faces = data.info.faceCount;
						for (let i = 0; i < faces; i++) {
							var jsonObj = new Object();
							jsonObj.celebrity = data.faces[i].celebrity.value;
							jsonObj.confidence = (data.faces[i].celebrity.confidence) * 100 + "%";

							jsonObj = JSON.stringify(jsonObj);
							//String 형태로 파싱한 객체를 다시 json으로 변환
							jsonArray.push(JSON.parse(jsonObj));
						}
						console.log(jsonArray);
						for (let i = 0; i < jsonArray.length; i++) {
							var result = jsonArray[i].celebrity + "을(를) " + jsonArray[i].confidence + "정도 닮았습니다.<br>";
							console.log(result);
							$("#resultDiv").append(result);
						}
						var celebrity = data.faces[0].celebrity.value;
						//console.log(celebrity);
						$.post('../celeImg', { celebrity }, function() {
							console.log(data);
							$("#celeImg").attr("src","/upload/newCele.png");
						});

					} else {
						$("#resultDiv").text("닮은꼴 연예인이 없네요 ㅠㅠ");
					}
				}else if(data.info.faceCount>1){
					alert("얼굴이 2개이상 검출되었습니다 한개의 얼굴만 들어간 사진을 넣어주세요~");
				}else{
					alert("얼굴이 검출되지 않았습니다 사진을 다시한번 확인해 주세요");
				}


			},
			error: function(e) {
				console.log("ERROR : ", e);
				alert("사진을 첨부해주세요");
			}

		});
	});




	$(document).on('click',"#colorInsertBtn",function(){
			const pColor=$("#colorText").val();
			if(pColor){
				$.post('../insertColorBox',{id,pColor},function(data){
					if(data.msg){
						alert(data.msg);
					}
				});
			}else{
				alert("컬러입력하세요");
			}
		});
	$("#basketBtn").click(function(){
		const id = $.cookie("id");
		if(id){
			$.post("../basketList",{id},function(){
				window.open("basketList");
			});
		}else{
			alert("로그인 해야 이용 가능합니다.");
		}
	});
		

		$("#getPcolorBtn").click(function(){
		let formData = new FormData();
		formData.append('image', $("#file")[0].files[0]);
		
		$.ajax({
			type : 'post',
			url : '../getPcolor',
			cache : false,
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				data=JSON.parse(data);
				if(data.pColor){
					alert(data.pColor);
				}else if(data.msg){
					alert(data.msg);
				}else{
					alert("data없음")
				}
			}
			
		});  
	});
	$("#insertPcolorBtn").click(function(){
		$.post('insertPcolorInColorBox',{id},function(data){
			data = JSON.parse(data);
			if(data.success){
				alert(data.success);
			}else{
				alert(data.msg);
			}
		});
	});
	$("#updateColorBoxBtn").click(function(data){
		alert(data);
	});

	
	$("#file").on('change', function() {
      var fileName = $("#file").val();
      $(".upload-name").val(fileName);
   });

			
	$("#ItemBtn").click(function(){
		const id = $.cookie("id");
		if(id){
			$.post("../item",{id},function(){
				window.open("item");
			});
		}else{
			alert("로그인 해야 이용 가능합니다.");
		}
	});
	$("#getItemBtn").click(function(){
		$.post('selectItem',{},function(data){
			console.log(data);
			data=JSON.parse(data)
			console.log(data);
		
		const resultDiv = document.getElementById("resultDiv") // html에 id가 resultDiv인 것 가져오기 
		for(let i=0; i<data.length; i++){ // db 데이터 반복문으로 pColor에 맞는 것만 가져오기 
			const link = document.createElement("a"); //링크 변수 만들어서 html에 a태그 만들기
			link.setAttribute("href",data[i]["siteLink"]) // 만든 a태그에 href걸고 db에 사이트링크 가져오기 (pColor에 맞는 것만)
			link.setAttribute("target","_blank") // a=href 를 새 창으로 띄우게 하기

			
			const itemImg = document.createElement("img"); //이미지 태그 만들기
			itemImg.setAttribute("src",data[i]["imgUrl"]) // 이미지 경로 (<img src="">) 설정 위 for안에 있으므로 이미지경로 전부다 가져옴
			itemImg.setAttribute("width",200); //사이즈 설정
			itemImg.setAttribute("height",200);
			link.appendChild(itemImg) // 링크 안에 이미지를 넣음 (케이스안에 사진을 넣는 느낌)
			resultDiv.appendChild(link) // html에 resultDiv에 링크를 띄움 (링크안에 이미지가 들어가 있음)
			
			const itemName = document.createTextNode(data[i]["itemName"]); // db에 itemName 데이터 다 가져오기
			resultDiv.appendChild(itemName) // html resultDiv에 텍스트로 출력
			
			$("#resultDiv").append("<hr>");
			
			itemContainer.appendChild(resultDiv) //컨테이너 안에 넣기
			}
		})
	})
	
	
	

});
	
