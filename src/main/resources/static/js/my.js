$(document).ready(function() {

	const id = $.cookie("id");
	if (id) {
		$("#loginSpan").html(id + "님 환영힙니다.<a href='#' class='get-started-btn2 scrollto' id='logoutBtn' >로그아웃</a>");
	}

	$("#loginBtn").click(function() {
		const id = $("#id").val();
		const pw = $("#pw").val();

		alert(id + ":" + pw);

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
				const image = new Image();

				image.src = '../media/test.png';

				image.onload = function() {
					context.drawImage(image, 0, 0);
					context.strokeStyle = 'yellow';
					context.lineWidth = 3;


					const x = (data.faces[0].roi.x)
					const y = (data.faces[0].roi.y)

					const width = (data.faces[0].roi.width)
					const height = (data.faces[0].roi.height)


					console.log(x, y, width, height);

					context.strokeRect(x, y, width, height);
				}
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
					const image = new Image();

					image.src = '../media/test.png';

					image.onload = function() {
						context.drawImage(image, 0, 0);
					}


		var fileCheck = document.getElementById("file").value;
		if (!fileCheck) {
			alert("파일을 첨부해 주세요");
			return false;
		} else {
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

					if (data != null) {
						data = JSON.parse(data);

						console.log(data);
						var faceCount = data.info.faceCount;
						console.log(faceCount);
						if (faceCount > 1) {
							alert("한명의 얼굴만 분석 가능합니다!!");
						} else {
							var result = data;
							localStorage.setItem('result', JSON.stringify(result));
							window.location = "celebrity.html";
						}
					} else {
						alert("페이지 오류");
					}

					/*if (data == null) {
						alert("사진첨부 필요");
					} else if(data!=null){
						data = JSON.parse(data);
						console.log(data.info.faceCount);
						
						alert("한명의 얼굴만 분석 가능합니다!!");
					}else{
						
						var result = data;
						localStorage.setItem('result', JSON.stringify(result));
						window.location = "celebrity.html";
					}*/


				},
				error: function(e) {
					console.log("ERROR : ", e);

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
		
	$("#fileUploadBtn").click(function(){
	let formData = new FormData();
	formData.append('image', $("#file")[0].files[0]);
		
		$.ajax({
			type : 'post',
			url : '../personDetect',
			cache : false,
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				data=JSON.parse(data);
				if(data.result){
					alert(data.result);
				}else{
					alert("data.result없음");
				}
			}
			
		});
	});
		$("#faceDetectBtn").click(function(){
		let formData = new FormData();
		formData.append('image', $("#file")[0].files[0]);
		
		$.ajax({
			type : 'post',
			url : '../objectDetect',
			cache : false,
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				data=JSON.parse(data);
				$("#drawCanvas").attr('width',data.info.size.width+'px');
				$("#drawCanvas").attr('height',data.info.size.height+'px');
				$("#drawCanvas").attr('style',"border: 1px solid #993300");
				const canvas=document.getElementById("drawCanvas");
				const context=canvas.getContext("2d");
				const image=new Image();
				
				image.src='../media/test.png';
				
				image.onload=function(){
					context.drawImage(image,0,0);
					context.strokeStyle = 'yellow';
					context.lineWidth = 3;
					
					
						const x=(data.faces[0].roi.x)	
						const y=(data.faces[0].roi.y)
										
						const width=(data.faces[0].roi.width)	
						const height=(data.faces[0].roi.height)
						
					
						console.log(x,y,width,height);
					
						context.strokeRect(x,y,width,height);
					}
				}	
				
			});
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
	});
	
