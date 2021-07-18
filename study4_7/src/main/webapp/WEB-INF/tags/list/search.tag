<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="searchVO" required="true"   type="com.study.common.vo.PagingVO"%>
<%@attribute name="actionPage"  required="true"%>


<%@tag dynamic-attributes="dynamic" %>


	<!-- START : 검색 폼  -->
		<div class="col-sm-12 col-md-9">
<!-- 			<div class="col-sm-2">
				<select id="id_searchType" name="searchType" class="form-control input-sm">
					<c:forEach  items="${searchType }" var="option">
						<option value="${option.key }" ${searchVO.searchType eq option.key ? "selected='selected'" : "" }>${option.value }</option>							
					</c:forEach>
				</select>
			</div>
			<div>
				<c:forEach items="${dynamic }" var="option">
					<c:forEach items="${option.value }" var="i"> 
						<label for="id_${option.key }" class="col-sm-1 col-sm-offset control-label">${i.key }</label>
						<div class="col-sm-2">
							<select id="id_${option.key }" name="${option.key }" class="form-control input-sm">
								<option value="">-- 전체 --</option>
								<c:forEach items="${i.value}" var="code">
									<option value="${code.commCd}" ${searchVO[option.key] eq code.commCd ? "selected='selected'" : "" }>${code.commNm}</option>
								</c:forEach>
							</select>
						</div>
					</c:forEach>
				</c:forEach>
			</div> -->
		</div>
		<div class="col-sm-12 col-md-3">
			<form name="search" action="${actionPage }" method="get" class="form-horizontal">
				<input type="hidden" name="curPage" value="${searchVO.curPage }">
				<input type="hidden" name="searchAlign" value="${searchVO.searchAlign}">
				<div class="form-group">
					<div class="row">
						<input type="text" name="searchWord" class="form-control form-control-sm" value="${searchVO.searchWord }" placeholder="검색" style="width:80%;display:inline-block;">&nbsp;
						<button type="submit" class="btn btn-sm btn-primary " style="display:inline-block;">
							<i class="fe fe-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<!-- END : 검색 폼  -->