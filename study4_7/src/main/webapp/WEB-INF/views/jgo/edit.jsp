<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="page-header">
				<h3>
					중고게시판 - <small>글 수정</small>
				</h3>
			</div>
			<form:form action="modify" method="post" cssClass="col-12"
				modelAttribute="jgo">
				<table class="table table-striped table-bordered">
					<colgroup>
						<col width="20%" />
						<col />
					</colgroup>
					<tr>
						<th>글번호</th>
						<td>${jgo.jgNo}<form:hidden path="jgNo" /> <form:errors
								path="jgNo" />
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><form:input path="jgTitle"
								cssClass="form-control input-sm" required="required"
								pattern=".{2,}" title="2글자 이상 입력" /> <form:errors
								path="jgTitle" /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${jgo.jgWriter}<form:hidden path="jgWriter" /> <form:errors
								path="jgWriter" />
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><form:input path="jgItemName"
								cssClass="form-control input-sm" required="required" /> <form:errors
								path="jgItemName" /></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><form:input path="itemPrice"
								cssClass="form-control input-sm" required="required" />
							<form:errors path="itemPrice" /></td>
					</tr>
					<!-- 이미징 -->
					<tr>
						<th><label for="gdsImg">이미지</label></th>
						<td>
							<div class="select_img">
								<input type="hidden" id="imgUrl" name="jgItemImg" value="">
								<img src="${jgo.itemImgNewName }" /><input type="file" id="gdsImg" name="file" />
							</div> <%=request.getRealPath("/") %>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><form:textarea cols="20" rows="20" path="jgContent"
								cssClass="form-control input-sm" /> <form:errors
								path="jgContent" /></td>
					</tr>
					<tr>
						<th>최근등록일자</th>
						<td>${jgo.jgModDate eq null ? jgo.jgRegDate : jgo.jgModDate }</td>
					</tr>
					<tr>
						<th>판매여부</th>
						<td><form:select path="sales">
								<form:option label="판매중" value="판매중" />
								<form:option label="판매완료" value="판매완료" />
								<form:option label="예약중" value="예약중" />
							</form:select>
					</tr>

					<tr>
						<td colspan="2">
							<div class="pull-right">
								<a href="list" class="btn btn-info btn-sm"> <span
									class="glyphicon glyphicon-list" aria-hidden="true"></span>
									&nbsp;목록으로
								</a>
								<button type="submit" class="btn btn-sm btn-primary">
									<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
									&nbsp;&nbsp;저장
								</button>

								<button type="submit" formaction="delete"
									class="btn btn-sm btn-danger">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									&nbsp;&nbsp;삭제
								</button>
							</div>
						</td>
					</tr>
				</table>
			</form:form>

		</div>
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
