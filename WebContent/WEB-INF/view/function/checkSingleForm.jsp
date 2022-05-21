<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
						<table border="0" width="1080" cellpadding="0" cellspaceing="0" align="center">
							<tr height="40">
								<td align="center" width="180" style="border:1px solid gray;"><b>글번호</td>
								<td align="center" width="180" style="border:1px solid gray;">${article.num}</td>
								<td align="center" width="180" style="border:1px solid gray;"><b>작성자</td>
								<td align="center" width="180" style="border:1px solid gray;">${article.writer}</td>
								<td align="center" width="180" style="border:1px solid gray;"><b>등록일</td>
								<td align="center" width="180" style="border:1px solid gray;">${article.reg_date}</td>
							</tr>
							<tr height="40">
								<td align="center" width="180" style="border:1px solid gray;"><b>비즈니스명</td>
								<td align="center" width="540" colspan="3" style="border:1px solid gray;">${article.b_name}</td>
								<td align="center" width="180" style="border:1px solid gray;"><b>상태</td>
								<td align="center" width="180" style="border:1px solid gray;">${article.status}</td>
							</tr>
							<tr height="40">
								<td align="center" width="180" style="border:1px solid gray;"><b>카테고리</td>
								<td align="center" width="180" style="border:1px solid gray;">${article.category}</td>
								<td align="center" width="180" style="border:1px solid gray;"><b>지역</td>
								<td align="center" width="180" style="border:1px solid gray;">${article.location}</td>
								<td align="center" width="180" style="border:1px solid gray;"><b>가격</td>
								<td align="center" width="180" style="border:1px solid gray;">${article.price}</td>
							</tr>
							<tr height="400">
								<td align="center" width="180" style="border:1px solid gray;"><b>상세내용</td>
								<td align="center" width="900" colspan="5" style="border:1px solid gray;">${article.content}</td>
							</tr>
							<tr height="40">
								<td width="900" colspan="3"></td>
								<td align="right" width="180">
									<input type="button" value="거래중으로 변경" onclick="document.location.href='/BusinessTest/checkSingleFormPro.do?num=${article.num}&status=거래중'">
								</td>
								<td align="right" width="180">
									<input type="button" value="거래완료로 변경" onclick="document.location.href='/BusinessTest/checkSingleFormPro.do?num=${article.num}&status=거래완료'">
								</td>
								<td align="right" width="180">
									<input type="button" value="목록" onclick="document.location.href='/BusinessTest/checkForm.do?category=${article.category}'">
								</td>
							</tr>
						</table>
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