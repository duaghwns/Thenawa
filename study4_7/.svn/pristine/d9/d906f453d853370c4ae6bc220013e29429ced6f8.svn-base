<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="searchVO" required="true"   type="com.study.common.vo.PagingVO"%>
<%@attribute name="actionPage"  required="true"%>
<%@attribute name="searchAlign" required="true" type="java.util.Map"%>

	<!-- START : 정렬 폼  -->
		<div class="col-8">
 			<form name="search" action="${actionPage }" method="get" class="form-horizontal">
				<input type="hidden" name="curPage" value="1"> 
				<input type="hidden" name="searchWord" value="${searchVO.searchWord }"> 
				
				<ul class="nav nav-pills nav-fill mb-3" id="pills-tab" role="tablist">
					<c:forEach  items="${searchAlign }" var="option">
						<li class="nav-item">
							<button type="submit" name='searchAlign' value='${option.key }'
								role="tab" aria-controls="pills-home" style="width:120px; height:40px;margin:0px;margin-top: 5px"
								${searchVO.searchAlign eq option.key ? "class='btn mb-2 btn-outline-primary active' aria-selected='true'" : "class='btn mb-2 btn-outline-primary' aria-selected='false'" }>
								${option.value }</button>
						</li>
					</c:forEach>
				</ul>
			</form>
		</div>
	<!-- END : 정렬 폼  -->