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
						$("#drawCanvas").attr('width', data[1].result2.info.size.width + 'px');
						$("#drawCanvas").attr('height', data[1].result2.info.size.height + 'px');
						$("#drawCanvas").attr('style', "border: 1px solid #993300");
						const canvas = document.getElementById("drawCanvas");
						const context = canvas.getContext("2d");
						const image = new Image();
						var fileList = file.files ;

						// 읽기
						var reader = new FileReader();
						reader.readAsDataURL(fileList [0]);
			  
						//로드 한 후
						reader.onload = function  () {
							//로컬 이미지를 보여주기
							//document.querySelector('#divleftImg').src = reader.result;
			  
							//썸네일 이미지 생성
							 //drawImage 메서드에 넣기 위해 이미지 객체화
							image.src = reader.result; //data-uri를 이미지 객체에 주입
							image.onload = function () {
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
			  
								
						


						image.onload = function() {
							
							context.strokeStyle = 'yellow';
							context.lineWidth = 3;


							const x = (data[1].result2.faces[0].roi.x)
							const y = (data[1].result2.faces[0].roi.y)


							const width = (data[1].result2.faces[0].roi.width)
							const height = (data[1].result2.faces[0].roi.height)


							console.log(x, y, width, height);

							context.strokeRect(x, y, width, height);

							if (data[2].pColor) {
								alert(data[2].pColor);
							} else if (data[2].msg) {
								alert(data[2].msg);
							} else {
								alert("data없음")
							}
						}

					}


				}


			}
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
					if (data == "이미지가 없습니다") {
						alert("사진첨부 필요");

					} else {
						console.log(data);
						var result = data;
						localStorage.setItem('result', JSON.stringify(result));
						window.location = "celebrity.html";
					}

				},
				error: function(e) {
					console.log("ERROR : ", e);
				}
			});

		}
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
	$("#getItemBtn").click(function(){
		$.post('selectItem',{},function(data){
			console.log(data);
			data=JSON.parse(data)
			console.log(data);
		
		const resultDiv = document.getElementById("resultDiv")
		for(let i=0; i<data.length; i++){
			const link = document.createElement("a");
			link.setAttribute("href",data[i]["siteLink"])
			link.setAttribute("target","_blank")

			
			const itemImg = document.createElement("img");
			itemImg.setAttribute("src",data[i]["imgUrl"])
			itemImg.setAttribute("width",200);
			itemImg.setAttribute("height",200);
			link.appendChild(itemImg)
			resultDiv.appendChild(link)
			
			const itemName = document.createTextNode(data[i]["itemName"]);
			//itemName.setAttribute("title",data[i]["itemName"])
			resultDiv.appendChild(itemName)
			document.body.appendChild(resultDiv)
			}
		});
	});
});

		
