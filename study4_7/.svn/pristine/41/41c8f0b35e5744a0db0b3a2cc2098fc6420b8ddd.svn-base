<%@page import="com.study.login.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="page-header">
				<h3>
					자유게시판 - <small>글 등록</small>
				</h3>
			</div>
			<form:form action="regist" method="post" modelAttribute="board">
				<input type="hidden" name="boWriter" value="${sessionScope.USER_INFO.userName }">
				<input type="hidden" name="boPass" value="0" />
				<table class="table table-striped table-bordered">
					<colgroup>
						<col width="20%" />
						<col />
					</colgroup>
					<tr>
						<th>제목</th>
						<td><form:input path="boTitle" required="required"
								pattern=".{2,}" title="2글자 이상 입력"
								cssClass="form-control input-sm" /> <form:errors path="boTitle" /></td>
					</tr>
					<tr>
						<th>IP</th>
						<td><input type="hidden" name="boIp"
							value="${request.getRemoteAddr() }"><%=request.getRemoteAddr()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><form:textarea path="boContent" cssClass="form-control" />
							<form:errors path="boContent" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="pull-left">
								<a href="list" class="btn btn-default btn-sm"> <span
									class="glyphicon glyphicon-list" aria-hidden="true"></span>
									&nbsp;&nbsp;목록
								</a>
							</div>
							<div class="pull-right">
								<button type="submit" class="btn btn-sm btn-primary">
									<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
									&nbsp;&nbsp;저장
								</button>
							</div>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</main>


