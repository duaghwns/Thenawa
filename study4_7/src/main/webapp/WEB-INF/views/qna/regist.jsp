<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<main role="main" class="main-content" style="clear:both;">
  <div class="container-fluid">
    <div class="row justify-content-center">
    	<div class="col-12">
    	<div class="row">
    	<div class="col-md-12 my-4">
           <h2 class="h4 mb-1" style="text-align:center;">Q&A게시판 - <small>글 쓰기</small></h2>
           <div class="card shadow">
           	<div class="card-body">
	           <form:form action="regist" method="post" modelAttribute="boardVO">
	           	<form:hidden path="boNo" value="${boardVO.boNo}"/>
		    	<table class="table table-bordered">
		    		<colgroup>
		    			<col width="15%" />
		    			<col width="50%" />
		    			<col width="15%" />
		    			<col width="20%" />
		    		</colgroup>
		    		<tbody>
			    		<tr>
			    			<th style="text-align:center; background-color:#f0f0f0;">작성자</th>
			    			<td><form:hidden path="boWriter" value="${USER_INFO.userId}"/>${USER_INFO.userId}</td>
			    			<th style="text-align:center; background-color:#f0f0f0;">비밀번호*</th>
			    			<td>
			    				<form:password path="boPass" maxlength="4" cssClass="form-control required" />
			    				<form:errors path="boPass" />
			    			</td>
			    		</tr>
			    		<tr>
			    			<th style="text-align:center; background-color:#f0f0f0;">글제목*</th>
			    			<td colspan="3">
			    				<form:input path="boTitle" cssClass="form-control required"/>
			    				<form:errors path="boTitle" />
			    			</td>
			    		</tr>
			    		<tr>
			    			<th style="text-align:center; background-color:#f0f0f0;">내용</th>
			    			<td colspan="3"><form:textarea path="boContent" cssClass="form-control" rows="15"/></td>
			    		</tr>
		    		</tbody>
		    	</table>
		    	<button type="submit" class="btn mb-2 btn-primary" style="float:right;">등록</button>
	    	</form:form>
	    	</div>
    	  </div>
    	 </div>
    	</div>
      </div>
	</div>
  </div>
</main>