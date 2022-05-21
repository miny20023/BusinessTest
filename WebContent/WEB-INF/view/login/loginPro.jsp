<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${status==10}">
	<c:redirect url="main.do"></c:redirect>
</c:if>

<c:if test="${status != 10 }">
	<script>
		alert("로그인 실패");
		history.go(-1);
	</script>
</c:if>