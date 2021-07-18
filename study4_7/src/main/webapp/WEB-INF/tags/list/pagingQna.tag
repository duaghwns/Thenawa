<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="linkPage" required="true" %>
<%@attribute name="searchVO" required="true"  type="com.study.common.vo.PagingVO"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!-- START : 페이지네이션  -->
		<nav aria-label="Table Paging" class="mb-0 text-muted">
			<ul class="pagination justify-content-center mb-0">
				<!-- 첫 페이지  -->
				<li class="page-item"><a class="page-link" href="${linkPage }?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>


				<!-- 이전 페이지 -->
				<c:if test="${searchVO.firstPage>1 }">
					<li class="page-item"><a class="page-link" href="${linkPage }?curPage=${searchVO.firstPage-1 }" data-page="${searchVO.firstPage-1 }"><span aria-hidden="true">&lt;</span></a></li>
				</c:if>

				<!-- 페이지 넘버링  -->
				
				<c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" var="i">
					<c:if test="${i eq searchVO.curPage }">
						<li  class="page-item active"><a class="page-link" href="#">${i }</a></li>
					</c:if>
					<c:if test="${i ne searchVO.curPage }">
						<li class="page-item"><a class="page-link" href="${linkPage }?curPage=${i }" data-page="${i }">${i }</a></li>
					</c:if>
				
				</c:forEach>
				

				<!-- 다음  페이지  -->
				<c:if test="${searchVO.lastPage < searchVO.totalPageCount }">
					<li class="page-item"><a class="page-link" href="${linkPage }?curPage=${searchVO.lastPage+1 }" data-page="${searchVO.lastPage+1 }"><span aria-hidden="true">&gt;</span></a></li>
				</c:if>

				<!-- 마지막 페이지 -->
				<li class="page-item"><a class="page-link" href="${linkPage }?curPage=${searchVO.totalPageCount }" data-page="${searchVO.totalPageCount }"><span aria-hidden="true">&raquo;</span></a></li>
			</ul>
		</nav>
		<!-- END : 페이지네이션  --> 