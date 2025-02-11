<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 검색</title>
<!-- include JQeury/CSS/JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/JS/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/JS/JOB/jobSearch.js"></script>
<link href="${pageContext.request.contextPath}/resources/CSS/JOB/jobSearch.css" rel="stylesheet">

<script type="text/javascript">


</script>	
	
</head>
<body>
	<%@ include file="../ALL/header_login.jsp"%>
	<div class="container" id="main">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<h4>기업 정보 검색</h4>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>

				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="business" disabled="disabled" onchange="selected_overlap(this);">
							<option selected="selected" disabled="disabled">채용분야</option>
							<option value="웹프로그래밍">웹프로그래밍</option>
							<option value="프론트엔드">프론트엔드</option>
							<option value="백엔드">백엔드</option>
						</select>
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="languages" disabled="disabled" onchange="selected_overlap(this);">
							<option value="" selected="selected" disabled="disabled">언어선택</option>
							<option value="JAVA">JAVA</option>
							<option value="Javascript">Javascript</option>
							<option value="C">C</option>
							<option value="C++">C++</option>
							<option value="C#">C#</option>
							<option value="Python">Python</option>
							<option value="node.js">node.js</option>
						</select>
					</div>
				</div>


				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="location_front" disabled="disabled" onchange="selected_overlap(this);">
							<option value="" selected="selected" disabled="disabled">지역(시)</option>
							<option value="서울시">서울시</option>
							<option>파주시</option>
							<option>안양시</option>
							<option>인천광역시</option>
							<option>남양주시</option>
						</select>
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" disabled="disabled" id="location_back">
							<option value="" selected="selected" disabled="disabled">지역(구)</option>
							<option value="강남구">강남구</option>
							<option>3</option>
							<option>4</option>
						</select>
					</div>
				</div>

				<div class="col-md-1">
					<span id="span01">* 중복가능</span>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>

				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="target" disabled="disabled" onchange="selected_only(this);">
							<option selected="selected" disabled="disabled">전체</option>
							<option value="인턴">인턴</option>
							<option value="신입">신입</option>
							<option value="경력">경력</option>
						</select>
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="enddate" disabled="disabled" onchange="selected_only(this);">
							<option value="" selected="selected" disabled="disabled">마감일</option>
							<option value="상시모집">상시모집</option>
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}월">${i}월</option>
						</c:forEach>	
						</select>
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="totalmember" disabled="disabled" onchange="selected_only(this);">
							<option value="" selected="selected" disabled="disabled">인원</option>
							<option>무관</option>
						<c:forEach var="i" begin="10" end="100" step="10">
							<option value="${i}인">${i}인</option>
						</c:forEach>
						</select>
					</div>
				</div>


				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="salary" disabled="disabled" onchange="selected_only(this);">
							<option value="" selected="selected" disabled="disabled">연봉</option>
							<option value="협상">협상 후 책정</option>
						<c:forEach var="i" begin="2000" end="9500" step="500">
							<option value="${i}만원">${i}만원 이상</option>
						</c:forEach>
							<option value="1억">1억 이상</option>
						</select>
					</div>
				</div>

				<div class="col-md-1" id="div_span02"></div>
			</div>


			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-2">
					<div class="form-group">
						<select class="form-control" id="select_search" onchange="searchType(this);">
							<option value="검색">검색</option>
							<option value="키워드">키워드</option>
						</select>
					</div>
				</div>
				<div class="col-md-6" id="div_text_search">
					<div class="form-group">
						<input type="text" id="search_company" class="form-control" placeholder="검색 또는 키워드 선택">
					</div>
				</div>

				<div class="col-md-2" id="div_btn">
					<button type="button" class="btn btn-success" id="btn_search" onclick="companySearch(1, 1, 0, 0, 1);">Search</button>
					<button type="button" class="btn btn-success" id="btn_reset"  onclick="companyReset()">reset</button>
				</div>
			</div>
	</div>
	<br />

	<!-- 검색결과 -->
	<div class="container" id="search_container">


		<c:choose>
			<c:when test="${empty newCompanyList}">
				<div style="text-align: center;">
					<h3>=============검색결과가 없습니다.=============</h3>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${newCompanyList}" var="dto">
					
					<div class="row">
						<div class="col-md-2">
							<div class="div_img_top">
								<div class="div_img_mid">
									<img alt=""
										src="${dto.imgurl}">
								</div>
							</div>
						</div>
						<div class="col-md-10">
							<div class="company_left">
								<h5>
									<a href="MAIN_mainDetail.do?companyseq=${dto.companyseq}"><b>${dto.business}</b></a>
									<span style="font-size: 10px;">&nbsp;&nbsp;상시모집</span><br />
								</h5>
								<span>${dto.oneintro}</span><br /> 
								<span>${dto.mainfield}</span><br /> 
								<span>${dto.languages}</span><br />

							</div>
							<div class="company_right">
								<b>${dto.companyname}</b><br />
								<span>${dto.location}</span><br/> 
								<span>${dto.salary}</span>
								<span>&nbsp;&nbsp;${dto.target}</span><br />
								<br /> 
								<input type="button" class="btn_compnay" value="기업정보" disabled="disabled" />
							</div>
						</div>
				
					</div>

				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
		
	<div class="container">	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="text-align: center;">
			<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination">
				
				<!-- mariaDB 페이징 -->
					<c:if test="${pagination.prev}">
						<li class="page-item">
							<a class="page-link" href="#" onClick="prev_maria('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
						</li>
					</c:if>
					
					<c:if test="${not empty pagination}">
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
								<a class="page-link" href="#" onClick="pagination_maria('${idx}', '${pagination.range}')"> ${idx} </a>
							</li>
						</c:forEach>
					</c:if>
						
					<c:if test="${pagination.next}">
						<li class="page-item">
							<a class="page-link" href="#" onClick="next_maria('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
						</li>
					</c:if>
				<!-- mariaDB 페이징  끝-->
					<!-- etc 페이징 -->
					
					<!-- etc 페이징  끝-->
				</ul>
			</div>
			<!-- pagination{e} -->
		</div>
		<div class="col-md-2"></div>
	</div>

	</div>
</body>
</html>