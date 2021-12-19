$(document).ready(function() {

	const id = $.cookie("id");
	if (id) {
		$("#loginSpan").html("<div class='nav-link text-white' >"+id + "님 환영합니다.  <button class='btn btn-outline-light btn-sm' id='logoutBtn'>Logout</button> </div>");
	}

	$("#loginBtn").click(function() {
		const id = $("#id").val();
		const pw = $("#pw").val();



		$.post('../login', { id, pw }, function(data) {
			data = JSON.parse(data);
			if (data.id) {
				$.cookie("id", data.id);
				$("#loginSpan").html("<div class='nav-link text-white' >"+data.id + "님 환영합니다.  <button class='btn btn-outline-light btn-sm' id='logoutBtn'>Logout</button> </div>");
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
$("#celebrityDetection").click(function() {
		$("#resultDiv").text("");

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
			});

		}
	});
	$("#getPcolorBtn").click(function() {
		var fileCheck = document.getElementById("file").value;
		if (!fileCheck) {
			alert("파일을 첨부해주세요");
			return false;
		} else {
			let formData = new FormData();
			formData.append('image', $("#file")[0].files[0]);

			$.ajax({
				type: 'post',
				url: '../getPcolor',
				cache: false,
				data: formData,
				processData: false,
				contentType: false,
				success: function(data) {
					//console.log(data);
					if (data == "null1") {
						alert("사진에 사람이 탐지되지 않았습니다.")
					} else if (data == "null2") {
						alert("사진에 사람이 여러명 탐지됩니다.한명의 사람이 나오는 사진을 넣어주세요");
					} else {
						data = JSON.parse(data);
						localStorage.setItem('pColorResult', JSON.stringify(data));
						console.log(data);
						$("#drawCanvas").attr('width', data[1].result2.info.size.width + 'px');
						$("#drawCanvas").attr('height', data[1].result2.info.size.height + 'px');
						$("#drawCanvas").attr('style', "border: 1px solid #993300");
						const canvas = document.getElementById("drawCanvas");
						const context = canvas.getContext("2d");
						const image= new Image();
						
						

						canvas.width = 200; //가로 100px
						canvas.height = 260; //세로 100px
						
						const path = "getImg/test.png";
						image.src = path;
						image.onload = function() {
							context.drawImage(image, 0, 0);
							context.strokeStyle = 'yellow';
							context.lineWidth = 3;


							

							if (data[2].pColor) {
								alert(data[2].pColor);
								
								
							} else if (data[2].msg) {
								alert(data[2].msg);
							} else {
								alert("data없음")
							}
						}
						$.cookie("pColor",data[2].pColor);
						console.log(data[2].pColor);
						const pColor = data[2].pColor;
						if(pColor=="봄 웜톤"){
							window.location="springwarm.html";
						}else if(pColor=="여름 쿨톤"){
							window.location="summercool.html";
						}else if(pColor=="가을 웜톤"){
							window.location="autumnwarm.html";
						}else if(pColor=="겨울 쿨톤"){
							window.location="wintercool.html";
						}
						
					}


				


			}
		
		

	});

	

	
	$("#basketBtn").click(function() {
		const id = $.cookie("id");
		if (id) {
			$.post("../basketList", { id }, function() {
				window.open("basketList");
			});
		} else {
			alert("로그인 해야 이용 가능합니다.");
		}
	});


	$("#insertPcolorBtn").click(function() {
		$.post('insertPcolorInColorBox', { id }, function(data) {
			data = JSON.parse(data);
			if (data.success) {
				alert(data.success);
			} else {
				alert(data.msg);
			}

		});
	});
	$("#updateColorBoxBtn").click(function(data) {
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
	
}
});
});