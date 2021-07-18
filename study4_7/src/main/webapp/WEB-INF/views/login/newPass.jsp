<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="wrapper vh-100">
      <div class="row align-items-center h-100">
        <form:form cssClass="col-lg-3 col-md-4 col-10 mx-auto text-center" id="id_form" action="newPass" method="post" modelAttribute="member">  
          <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="/">
            <svg version="1.1" id="logo" class="navbar-brand-img brand-md" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
              <g>
                <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
                <polygon class="st0" points="96,69 33,69 42,51 105,51 	" />
                <polygon class="st0" points="78,33 15,33 24,15 87,15 	" />
              </g>
            </svg>
          </a>
          <h1 class="h5 mb-3 mt-3">새로운 비밀번호</h1>
          <div class="form-group">
            <label for="newMemPass" class="sr-only">새 비밀번호</label>
            <input type="hidden" class="form-control form-control-lg" name="memId" value="${user.memId }"/>
            <form:password id="newMemPass" cssClass="form-control form-control-lg" path="newMemPass" placeholder="변경할 비밀번호"/>
            <form:errors path="newMemPass" />
          </div>
          <div class="form-group">
            <label for="newPassConfirm" class="sr-only">새 비밀번호 확인</label>
            <form:password id="newPassConfirm" cssClass="form-control form-control-lg" path="newPassConfirm" placeholder="변경할 비밀번호 확인" />
            <form:errors path="newPassConfirm" />
          </div>
          <button class="btn btn-xl btn-primary mr-2" style="width:100%;" type="submit" onclick="f_confirm()">입력완료</button>
          <div class="find_info mt-3">
          	<a href="/login/findId">아이디찾기</a><span style="padding:0 10px;">|</span><a href="/login/findPw">비밀번호찾기</a>
          </div>  
        </form:form> 
      </div>
    </div>
    
    <script>
    	function f_confirm(){
    		event.preventDefault();
    		
    		if($("#newMemPass").val() != $("#newPassConfirm").val()){
    			alert("비밀번호 확인이 일치하지 않습니다.");
    		}else{
    			$("#id_form").submit();
    		}
    	}
    </script>