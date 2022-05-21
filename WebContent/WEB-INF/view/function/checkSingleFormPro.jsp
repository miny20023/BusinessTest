<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:if test="${statusCheck == 1 }">
	<script>
		alert("거래완료로 변경 완료");
		window.location.href='/BusinessTest/checkSingleForm.do?num='+${num};
	</script>
</c:if>

<c:if test="${statusCheck ==2 }">
	<script>
		alert("거래중으로 변경 완료");
		window.location.href='/BusinessTest/checkSingleForm.do?num='+${num};
	</script>
</c:if>