<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>테스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/styles-a.css" rel="stylesheet" type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="main.do">테스트</a>

		<!-- Sidebar Toggle 목록 보여주는 아이콘버튼 -->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>

	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">메인</div>
						<a class="nav-link" href="main.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Main
						</a>
						<div class="sb-sidenav-menu-heading">등록</div>
						<a class="nav-link" href="registForm.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 비즈니스 등록
						</a>

						<div class="sb-sidenav-menu-heading">조회</div>
						<a class="nav-link" href="checkForm.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 비즈니스 조회
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					${sessionScope.dto.id}
				</div>
			</nav>
		</div>

		<!-- 페이지 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<center>
						<b>비즈니스 등록</b> <br>
						<form method="post" name="writeform" action="/BusinessTest/registPro.do">
							<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">
								<tr>
									<td align="right" colspan="2"><a href="checkForm.do"> 글목록</a></td>
								</tr>
								<tr>
									<td width="70" align="center">작성자</td>
									<td width="330"><input type="text" size="40" maxlength="40" name="writer" value="${sessionScope.dto.id}" disabled></td>
									<input type="hidden" name="writer" value="${sessionScope.dto.id }">
								</tr>
								<tr>
									<td width="70" align="center">비즈니스명</td>
									<td width="330"><input type="text" size="40" maxlength="40" name="b_name"></td>
								</tr>
								<tr>
									<td width="70" align="center">지역</td>
									<td width="330">
										<select name="location">
											<option value="0">-선택-</option>
            								<option value="서울">서울</option>
            								<option value="부산">부산</option>
            								<option value="대구">대구</option>
            								<option value="인천">인천</option>
            								<option value="광주">광주</option>
            								<option value="대전">대전</option>
            								<option value="울산">울산</option>
            								<option value="강원">강원</option>
            								<option value="경기">경기</option>
            								<option value="경남">경남</option>
            								<option value="경북">경북</option>
            								<option value="전남">전남</option>
            								<option value="전북">전북</option>
            								<option value="제주">제주</option>
            								<option value="충남">충남</option>
            								<option value="충북">충북</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="70" align="center">카테고리</td>
									<td width="330">
										<select name="category">
											<option value='0'>--선택--</option>
											<option value="이커머스">이커머스</option>
											<option value="소셜미디어">소셜미디어</option>
											<option value="프로그램/SAAS">프로그램/SAAS</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="70" align="center">금액</td>
									<td width="330"><input type="number" size="10" maxlength="15" name="price">원</td>
								</tr>
								<tr>
									<td width="70" align="center">상세내용</td>
									<td width="330"><textarea name="content" rows="20" cols="42"></textarea></td>
								</tr>
								<tr>
									<td colspan=2 align="center">
									<input type="submit" value="글쓰기">
									<input type="reset" value="다시작성">
									<input type="button" value="목록보기" OnClick="window.location='/BusinessTest/checkForm.do'"></td>
								</tr>
							</table>
						</form>
					</center>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src=" <c:url value="/resources/js/scripts-a.js"/> "></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
</body>
</html>