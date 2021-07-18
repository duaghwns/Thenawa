<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main role="main" class="main-content" style="clear:both;">
<div class="container-fluid">
	<div class="row justify-content-center">
	
	<h4 class="my-3">${resultMessageVO.title}</h4>

	</div>
			<div class="card my-4">
                <div class="alert alert-success" role="alert">
					<strong>${resultMessageVO.message}</strong>
				</div>
				<div class="card-body input-group">
					
						<a href="/"
							class="btn btn-primary"> 
							<span class="fe fe-24 fe-home" aria-hidden="true"></span>
							&nbsp;Home
						</a>
				
						&nbsp;&nbsp;
						<a href="#" onclick="history.back()" class="btn btn-outline-secondary">
							<span class="fe fe-24 fe-arrow-left" aria-hidden="true"></span>
							&nbsp;뒤로가기
						</a> 
					
						&nbsp;&nbsp;
						<c:if test="${not empty resultMessageVO.url}">
							<a href="<c:url value='${resultMessageVO.url}' />" class="btn btn-warning"> 
								<!-- <span class="fe-corner-down-left" aria-hidden="true"></span> -->
								&nbsp;${resultMessageVO.urlTitle}
							</a>
						</c:if>
					
				</div>
			</div>
		</div>
</main> <!-- main -->