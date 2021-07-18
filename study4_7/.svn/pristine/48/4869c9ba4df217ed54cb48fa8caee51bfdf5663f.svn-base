<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
		<div class="page-header">
			<h3>
				자유게시판 - <small>글 수정</small>
			</h3>
		</div>
		<form:form action="modify" method="post" cssClass="col-12"  modelAttribute="free">
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="20%" />
					<col />
				</colgroup>
				<tr>
					<th>글번호</th>
					<td>
						${free.boNo}<form:hidden path="boNo"/>
						<form:errors path="boNo"/>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<form:input path="boTitle" cssClass="form-control input-sm" required="required" pattern=".{2,}" title="2글자 이상 입력" />
						<form:errors path="boTitle"/>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${free.boWriter }<form:hidden path="boWriter"/>
						<form:errors path="boWriter"/>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<form:password path="boPass" cssClass="form-control input-sm" required="required" pattern=".{4,20}$" title="4글자 이상 20글자 이하로 문자, 숫자, 특수문자 1개 이상 필요"/>
						<form:errors path="boPass"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<form:textarea path="boContent" cssClass="form-control input-sm"/>
						<form:errors path="boContent"/>
					</td>
				</tr>
				<tr>
					<th>IP</th>
					<td>${free.boIp }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${free.boHit }</td>
				</tr>
				<tr>
					<th>최근등록일자</th>
					<td>${free.boModDate eq null ? free.boRegDate : free.boModDate }</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-right">
							<a href="list" class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록으로
							</a>
							<button type="submit"  class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span> &nbsp;&nbsp;저장
							</button>

							<button type="submit" formaction="delete" class="btn btn-sm btn-danger">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;삭제
							</button>
						</div>
					</td>
				</tr>
			</table>
		</form:form>

	</div>
	</div>
	</main>


