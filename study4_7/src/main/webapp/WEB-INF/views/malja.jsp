<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file= "/WEB-INF/inc/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@include file= "/WEB-INF/inc/top.jsp" %>
	<br>
	<br><br><br><br><br>kkllkk
	<form action="/jgo/ckImage.ajax" method="post" enctype="multipart/form-data" style="padding-left: 200px">
		<input type="file" name="upload">
		<input type="submit" value="전송">
		
	</form>
	
</body>
</html>