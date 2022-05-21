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
		<script type="text/javascript" charset="UTF-8">
			function callAjax()
			{
				if($("#select_category").val() == '0')
				{
					alert('카테고리를 선택해주세요');	
				}
				else
				{
				$.ajax
				({
					url:"/BusinessTest/checkForm_data.do",
					type:"POST",
					dataType:"json",
					data:{select_category:$("#select_category").val()},
					success:function(result)
					{
						$("#call_list").empty();
						for(var i =0; i< result.length; i++)
						{
							var insertImg  = '';
							var insertImg1 = '<img src="resources/image/';
							var insertImg2 = '.gif" height="40" width="50">';
							if(result[i].standard == '최근 본')
							{
								insertImg = insertImg1 +'recent' + insertImg2;	
							}
							else if(result[i].standard == 'new')
							{
								insertImg = insertImg1 +'new' + insertImg2;	
							}
							else if(result[i].standard == '완료')
							{
								insertImg = insertImg1 +'complete' + insertImg2;	
							}
							else
							{
								insertImg = ' ';
							}
							
							var insertTr = '';
							insertTr += '<tr height="40" style="border:1px solid gray;">';
							insertTr += '<td align="center" width="50" style="border:1px solid gray;">'+insertImg+'</td>';
							insertTr += '<td align="center" width="50" style="border:1px solid gray;">'+result[i].num+'</td>';
							insertTr += '<td align="center" width="250" style="border:1px solid gray;"><a href="/BusinessTest/checkSingleForm.do?num='+result[i].num+'">'+result[i].b_name+'</a></td>';
							insertTr += '<td align="center" width="150" style="border:1px solid gray;">'+result[i].price+'</td>';
							insertTr += '<td align="center" width="100" style="border:1px solid gray;">'+result[i].writer+'</td>';
							insertTr += '<td align="center" width="100" style="border:1px solid gray;">'+result[i].location+'</td>';
							insertTr += '<td align="center" width="100" style="border:1px solid gray;">'+result[i].category+'</td>';
							insertTr += '<td align="center" width="100" style="border:1px solid gray;">'+result[i].reg_date+'</td>';
							insertTr += '<td align="center" width="100" style="border:1px solid gray;">'+result[i].status+'</td>';
							insertTr += '</tr>';
							$("#call_list").append(insertTr);
						}
					},
					error:function()
					{
						alert('ajax 연결 실패');
					}
				});
				}
			}
		</script>
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
					
					<!--  카테고리 검색 div -->
					<div>
		<form method="post" name=list_view style=margin:0;>
			<select name="select_category" id="select_category";>
				<option value="0">--선택--</option>
				<option value="이커머스">이커머스</option>
				<option value="소셜미디어">소셜미디어</option>
				<option value="프로그램/SAAS">프로그램/SAAS</option>
			</select>
			<input type="button" id="result_list" onclick="callAjax();" value="조회"/>
		</form>
		</div>
		
		<!-- 카테고리 조회 후 리스트 출력 div -->
		<div>
			<table border="1" width="1000" cellpadding="0" cellspaceing="0" align="center">
			<thead>
				<tr height="40" style="border:1px solid gray;">
					<td align="center" width="50" style="border:1px solid gray;">구분</td>
					<td align="center" width="50" style="border:1px solid gray;">번호</td>
					<td align="center" width="250" style="border:1px solid gray;">제목</td>
					<td align="center" width="150" style="border:1px solid gray;">가격</td>
					<td align="center" width="100" style="border:1px solid gray;">작성자</td>
					<td align="center" width="100" style="border:1px solid gray;">지역</td>
					<td align="center" width="100" style="border:1px solid gray;">카테고리</td>
					<td align="center" width="100" style="border:1px solid gray;">등록일</td>
					<td align="center" width="100" style="border:1px solid gray;">상태</td>	
				</tr>
			</thead>
				
				<!-- 리스트 내용 출력 -->
				<tbody id="call_list">
					<script>
					function call()
					{
						const urlParams = new URLSearchParams(window.location.search)
						if(urlParams.has('category'))
						{
							$('#select_category').val(urlParams.get('category'));
							callAjax();
						}
					}
					call();
					</script>
				</tbody>
			</table>
		</div>
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