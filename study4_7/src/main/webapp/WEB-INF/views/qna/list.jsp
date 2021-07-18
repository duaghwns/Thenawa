<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="list"  tagdir="/WEB-INF/tags/list"%>

<main role="main" class="main-content" style="clear:both;">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <!-- Q&A table -->
                <div class="col-md-12 my-4">
                  <h2 class="h4 mb-1">Q&A 게시판</h2>
                  <p class="mb-3">회원들 끼리 질문글과 답변글을 등록할 수 있는 게시판</p>
				
				<!-- 조회건수 -->
				<list:columnCount searchVO="${QnasearchVO }" formPage="form"></list:columnCount>
				
				
                  <div class="card shadow">
                    <div class="card-body">
                     <!-- 검색 폼  -->
					<form name="search" action="list" method="post">
						<input type="hidden" name="curPage" value="${QnasearchVO.curPage }"> <input type="hidden" name="rowSizePerPage" value="${QnasearchVO.rowSizePerPage }">
						<div class="form-group input-group">
							<div class="col-sm-2">
								<select id="id_searchType" name="searchType" class="form-control">
									<option value="">검색분류</option>
									<option value="T" ${QnasearchVO.searchType eq "T" ? "selected='selected'" : ""}>제목</option>
									<option value="W" ${QnasearchVO.searchType eq "W" ? "selected='selected'" : ""}>작성자</option>
									<option value="C" ${QnasearchVO.searchType eq "C" ? "selected='selected'" : ""}>내용</option>
								</select>
							</div>
							<div class="col-sm-2">
								<input type="text" name="searchWord" class="form-control input-sm" value="${QnasearchVO.searchWord }" placeholder="검색어">
							</div>
							<div class="col-sm-2">
								<button type="submit" class="btn btn-sm btn-primary">
									<i class="fa fa-search"></i>검 색
								</button>
							</div>
						</div>
					</form>
                      <!-- table -->
                      <table class="table table-bordered table-hover">
                        <thead>
                          <tr>
                            <th style="text-align:center; width:10%;">글번호</th>
                            <th style="text-align:center; width:50%;">제목</th>
                            <th style="text-align:center; width:10%;">작성자</th>
                            <th style="text-align:center; width:10%;">조회수</th>
                            <th style="text-align:center; width:20%;">등록일</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${qnaList }" var="qna">
                          <tr> 
                            <td style="text-align:center; width:5%;">${qna.boNo }</td>
                            <td style="width:50%;">
                            	<a href="view?boNo=${qna.boNo }">
                            		<!-- 답글 레벨이 0이 아니라면 제목 앞에 레벨만큼 ㄴRe 표시 -->
                            		<c:if test="${qna.boGroupDepth ne 0}">
                            			<span style="color:red; font-style:italic; padding-left:${qna.boGroupDepth * 20}px;">ㄴRe&nbsp;</span>
                            		</c:if>
                            		${qna.boTitle }
                            		<!-- 댓글이 있다면 갯수 표시 -->
                            		<c:if test="${qna.boReplyCount ne 0}">
                            			<span style="color:red;">&nbsp;&#91;${qna.boReplyCount}&#93;</span>
                            		</c:if>
                            	</a>
                            </td>
                            <td style="text-align:center; width:15%;">${qna.boWriter }</td>
                            <td style="text-align:center; width:10%;">${qna.boHit }</td>
                            <td class="text-muted"  style="text-align:center; width:20%;">${qna.boRegDate }</td>
                          </tr>
                         </c:forEach>
                        </tbody>
                      </table>
	                  <a href="regist" class="btn btn-sm btn-primary">글쓰기</a>
                      <list:pagingQna searchVO="${QnasearchVO }" linkPage="list"></list:pagingQna>
                    </div><!-- cardbody -->
                  </div>
                </div> <!-- customized table -->
              </div> <!-- end section -->
             </div>
           </div>
         </div>
     </main>
     <script src="<%=request.getContextPath() %>/resources/js/list.js"></script>