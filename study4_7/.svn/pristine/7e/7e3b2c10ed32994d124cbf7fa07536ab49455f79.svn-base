<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="list" tagdir="/WEB-INF/tags/list"%>
<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="page-header">
				<h3>
					자유게시판 - <small>FREELIST</small>
				</h3>
			</div>

			<div class="col-sm-2 col-sm-offset-7 text-right">
				<a href="regist" class="btn btn-primary btn-sm"> <span
					class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
					&nbsp;새글쓰기
				</a>
			</div>


			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col width="10%" />
					<col />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${results}" var="vo">
						<tr class="text-center">
							<td>${vo.boNo }</td>
							<td class="text-left"><a href="view?boNo=${vo.boNo }">
									${vo.boTitle } </a></td>
							<td>${vo.boWriter }</td>
							<td>${vo.boRegDate }</td>
							<td>${vo.boHit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 Paging -->
			<list:paging searchVO="${searchVO }" linkPage="${link }"></list:paging>
		</div>
	</div>
</main>