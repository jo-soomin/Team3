<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 입력</title>
<!-- include JQeury/CSS/JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/JS/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript"
	src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/JS/USER/userPFwrite.js?ver=3"></script>
<link
	href="${pageContext.request.contextPath}/resources/CSS/USER/userPFwrite.css?ver=3"
	rel="stylesheet">

<style type="text/css">
.PFtable textarea {
	display: table-cell;
	vertical-align: middle;
	height: 80px;
	width: 100%;
	border: 1px solid black;
	border-radius: 5px;
}
</style>

<script type="text/javascript">
	function minus(that) {

		that.parentNode.remove();

	}

	$(document).ready(function() {
		$(".input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var target = e.target;
		var field = $(target).parent().next().children().next();
		
		console.log(field);
		var files = target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
						alert("이미지파일을 올려주세요");
						return;
					}

					sel_file = f;

					var reader = new FileReader();
					reader.onload = function(e) {
						alert("g2");
						// 			$(".img_wrap img").attr("src",e.target.result);
// 						var img_html = "<img src=\"" + e.target.result
// 								+ "\" style=\"width: 100%; height: 100%;\" />";
						field.children("#photo").children('.img_wrap img').attr('src',e.target.result);
					}
					reader.readAsDataURL(f);

				});
	}

	// function pdfprint() {
	// 	  //pdf_wrap을 canvas객체로 변환
	// 	  alert("dd");
	// // 	  html2canvas(document.getElementById("pdfwrap")).then(function(canvas) {
	// // 	  });
	// 		var divHeight = $('#pdfwrap').height();
	// 		var divWidth = $('#div_id').width();
	// 		var ratio = divHeight / divWidth;

	// 	  html2canvas(document.body).then(function(canvas) {
	// // 	    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
	// // 	    var imgData = canvas.toDataURL('image/pngS'); //캔버스를 이미지로 변환
	// // 	    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
	// // 	    doc.save('sample-file.pdf'); //pdf저장
	// 		  var imgData = canvas.toDataURL('image/png');

	// 		    var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
	// 		    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	// 		    var imgHeight = canvas.height * imgWidth / canvas.width;
	// 		    var heightLeft = imgHeight;

	// 		        var doc = new jsPDF('p', 'mm');
	// 		        var position = 0;

	// 		        // 첫 페이지 출력
	// 		        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	// 		        heightLeft -= pageHeight;
	// 		         console.log(heightLeft);
	// 		        // 한 페이지 이상일 경우 루프 돌면서 출력
	// 		        while (heightLeft >= 20) {

	// 		          position = heightLeft - imgHeight;
	// 		          doc.addPage();
	// 		          doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	// 		          heightLeft += pageHeight;
	// 		        }

	// 		        // 파일 저장
	// 		        doc.save('sample_A4.pdf');
	// 	  });
	// 	}

	function pdfprint() {
		alert("dd");
		html2canvas(document.querySelector("#pdfwrap"), {
			scrollX: 0,
	        scrollY: -1000
		}).then(function(canvas) {
			
			
			document.body.appendChild(canvas);
		});
	}
</script>

</head>
<body>
	<%@ include file="../ALL/header_login.jsp"%>

	<div class="container">
		<div class="center" id="center">
			<div id="pdfwrap">
				<div id="PFinfo">
					<h1 id="item">포트폴리오 필수항목</h1>
					<table class="PFtable">
						<tr>
							<th>프로젝트명</th>
							<td class="PFinfo"><input type="text" name="project"></td>
						</tr>
						<tr>
							<th>수행기간</th>
							<td class="PFinfo"><input type="text" name="period"></td>
						</tr>
						<tr>
							<th>개발목표</th>
							<td class="PFinfo"><textarea rows="7" cols="60"
									name="objective"></textarea></td>
						</tr>
						<tr>
							<th>개발환경</th>
							<td class="PFinfo"><textarea rows="7" cols="60"
									name="DevelopmentEnvironment"></textarea></td>
						</tr>
						<tr>
							<th>구현기능</th>
							<td class="PFinfo"><textarea rows="7" cols="60"
									name="function"></textarea></td>
						</tr>
						<tr>
							<th>담당역할</th>
							<td class="PFinfo"><textarea rows="7" cols="60"
									name="position"></textarea></td>
						</tr>
						<tr>
							<th>참여도 / 기여도</th>
							<td class="PFinfo"><input type="text" name="contribution"></td>
						</tr>
					</table>
				</div>




				<div id="PFdetail">
					<div id="PFbtn">
						<button id="minus" onclick="minus(this);" style="float: left;">
							<!-- <img alt="minus" src="resources/IMG/minus.png" style="width: 20px; height: 20px;"> -->
							삭제
						</button>
						<input type="file" class="input_img" >
					</div>

					<div id="PFcenter" style="display: flex;">
					<div class="margin" style="flex: 0.1;"></div>
					<div id="main" style="flex: 2; display: flex;">
						<div id="photo" style="flex: 2;">
							<div class="img_wrap">
								<img style="width: 100%; height: 100%;" />
							</div>
						</div>
						<div id="between" style="flex: 0.1;"></div>
						<fieldset id="function" style="flex: 2;">
							<legend class="le">기능설명</legend>
							<textarea rows="10" cols="60" id="functioninfo"></textarea>
						</fieldset>
						</div>
						<div class="margin" style="flex: 0.1;"></div>
					</div>

					<div id="PFlast">
						<fieldset id="viewinfo">
							<legend class="le">화면설명</legend>
							<textarea rows="8" cols="90" id="viewinfo1"></textarea>
						</fieldset>
					</div>

				</div>

				<div id="filed"></div>
			</div>
			<button id="create_pdf" onclick="pdfprint();">포트폴리오 PDF변환</button>


			<button id="plus" onclick="plus();">
				<img id="plusbtn" alt="plusbtn" src="resources/IMG/plus.jpg">
			</button>








		</div>
	</div>
</body>


</html>