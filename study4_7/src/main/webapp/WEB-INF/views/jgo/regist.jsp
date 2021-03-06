<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<style>
	.select_img img {margin: 20px 0;}
</style>
<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="page-header">
				<h3>
					중고게시판 - <small>글 등록</small>
				</h3>
			</div>
		</div>

		<form:form action="regist" method="post" modelAttribute="jgo"
			enctype="multipart/form-data">
			<input type="hidden" name="jgWriter"
				value="${sessionScope.USER_INFO.userName }">
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="20%" />
					<col />
				</colgroup>
				<tr>
					<th>제목</th>
					<td><form:input path="jgTitle" required="required"
							pattern=".{2,}" title="2글자 이상 입력"
							cssClass="form-control input-sm" /> <form:errors path="jgTitle" /></td>
				</tr>

				<tr>
					<th>상품명</th>
					<td><form:input path="jgItemName" required="required"
							pattern=".{2,}" title="2글자 이상 입력"
							cssClass="form-control input-sm" /> 
							<form:errors path="jgItemName" /></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><form:input path="itemPrice" required="required"
							cssClass="form-control input-sm" /> <form:errors
							path="itemPrice" /></td>
				</tr>
				<!-- 이미징 -->
				<tr>
					<th><label for="gdsImg">이미지</label></th>
					<td>
						<div class="select_img">
							<input type="hidden" id="imgUrl" name="jgItemImg" value="" >
							<img src="" /><input type="file" id="gdsImg" name="file">
						</div>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><form:textarea path="jgContent" id="p_content"
							cssClass="form-control" cols="20" rows="20" /> <form:errors path="jgContent" /></td>
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
</main>
<script>
	$("#gdsImg").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result)
								.width(100);
						$("#jgItemImg").attr("value", data.target.result)
						console.log($("img").src)
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
	
	
</script>

