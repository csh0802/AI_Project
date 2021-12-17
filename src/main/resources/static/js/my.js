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

						image.src = '../media/test.png';

						image.onload = function() {
							context.drawImage(image, 0, 0);
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

			});
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
});

