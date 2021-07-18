<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="list" tagdir="/WEB-INF/tags/list"%>
<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="row">
					<!-- Q&A table -->
					<div class="col-md-12 my-4">
						<a href="/jgo/list"><h2 class="h4 mb-1">중고 게시판</h2></a>
						<p class="mb-3">중고 물건 거래 게시판</p>

						<!-- 조회건수 -->
						<list:columnCount searchVO="${searchVO }" formPage="form"></list:columnCount>


						<div class="card shadow">
							<div class="card-body">
								<!-- 검색 폼  -->
								<form name="search" action="list" method="post">
									<input type="hidden" name="curPage"
										value="${searchVO.curPage }"> <input type="hidden"
										name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
									<div class="form-group input-group">
										<div class="col-sm-2">
											<select id="id_searchType" name="searchType"
												class="form-control">
												<option value="">검색분류</option>
												<option value="T"
													${searchVO.searchType eq "T" ? "selected='selected'" : ""}>제목</option>
												<option value="W"
													${searchVO.searchType eq "W" ? "selected='selected'" : ""}>작성자</option>
												<option value="C"
													${searchVO.searchType eq "C" ? "selected='selected'" : ""}>내용</option>
												<option value="S"
													${searchVO.searchType eq "S" ? "selected='selected'" : ""}>상품명</option>
											</select>
										</div>
										<div class="col-sm-2">
											<select id="id_searchType2" name="searchSales"
												class="form-control">
												<option value="">전체보기</option>
												<option value="판매중"
													${searchVO.searchSales eq "판매중" ? "selected='selected'" : ""}>판매중</option>
												<option value="판매완료"
													${searchVO.searchSales eq "판매완료" ? "selected='selected'" : ""}>판매완료</option>
												<option value="예약중"
													${searchVO.searchSales eq "예약중" ? "selected='selected'" : ""}>예약중</option>
											</select>
										</div>
										<div class="col-sm-2">
											<input type="text" name="searchWord"
												class="form-control input-sm"
												value="${searchVO.searchWord }" placeholder="검색어">
										</div>
										<div class="col-sm-2">
											<button type="submit" class="btn btn-sm btn-primary">
												<i class="fa fa-search"></i>검 색
											</button>
										</div>
								</form>
								<div class="col-sm-2 col-sm-offset-7 text-right">
									<a href="/jgo/regist" class="btn btn-primary btn-sm"> <span
										class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
										&nbsp;새글쓰기
									</a>
								</div>
							</div>
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
								<c:forEach items="${result}" var="vo">
									<tr class="text-center">
										<td>${vo.jgNo }</td>
										<td class="text-left"><a href="view?jgNo=${vo.jgNo }"><b>[${vo.jgItemName }]</b>
												${vo.jgTitle } [${vo.itemPrice }원] <b> [${vo.sales }]</b> 
												<c:if
													test="${vo.jgReplyCount ne 0}">
													<span style="color: red;">&nbsp;&#91;${vo.jgReplyCount}&#93;</span>
												</c:if></a></td>
										<td>${vo.jgWriter }</td>
										<td>${vo.jgRegDate }</td>
										<td>${vo.jgHit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 페이징 Paging -->
						<list:paging searchVO="${searchVO }" linkPage="${link }"></list:paging>
					</div>
					<!-- cardbody -->
				</div>
			</div>
			<!-- customized table -->
		</div>
		<!-- end section -->
	</div>
	</div>
	</div>
</main>
<script src="<%=request.getContextPath() %>/resources/js/list.js"></script>