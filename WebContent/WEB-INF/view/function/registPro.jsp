<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:if test="${select_check == 1}">
	<script>
		alert("지역을 선택해주세요.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${select_check == 2}">
	<script>
		alert("카테고리를 선택해주세요.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${select_check == 3}">
	<script>
		alert("비즈니스 등록 완료");
		location.href = "/BusinessTest/main.do";
	</script>
</c:if>