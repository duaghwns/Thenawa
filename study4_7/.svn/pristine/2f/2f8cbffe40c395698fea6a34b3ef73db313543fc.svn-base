<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="wrapper vh-100">
      <div class="row align-items-center h-100">
        <form class="col-lg-3 col-md-4 col-10 mx-auto text-center" action="login" method="post">
	        <c:if test="${param.msg ne null}">
	        <br>
			    <h4 style="color:red;">${param.msg}</h4>
			</c:if>
			<c:if test="${not empty cookie.SAVE_ID}">
				<c:set value="checked" var="checked" />
			</c:if>
          <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="/">
            <svg version="1.1" id="logo" class="navbar-brand-img brand-md" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
              <g>
                <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
                <polygon class="st0" points="96,69 33,69 42,51 105,51 	" />
                <polygon class="st0" points="78,33 15,33 24,15 87,15 	" />
              </g>
            </svg>
          </a>
          <h1 class="h5 mb-3 mt-3">로그인</h1>
          <div class="form-group">
            <label for="inputEmail" class="sr-only">아이디</label>
            <input type="text"  class="form-control form-control-lg" name="userId" placeholder="ID" required="" autofocus="" value="${cookie.SAVE_ID.value}">
          </div>
          <div class="form-group">
            <label for="inputPassword" class="sr-only">비밀번호</label>
            <input type="password" class="form-control form-control-lg" name="userPass" placeholder="PASSWORD" required="">
          </div>
          <div class="checkbox mb-3">
            <label>
              <input type="checkbox" name="rememberMe" value="Y" ${checked }> ID 기억하기</label>
          </div>
          <button class="btn btn-lg btn-primary mr-2" style="width:47%;" type="submit">로그인</button>
          <button class="btn btn-lg btn-primary" style="width:47%;" type="button" onclick="location.href='/join/join'">회원가입</button>
          <div class="find_info mt-3">
          	<a href="/login/findId">아이디찾기</a><span style="padding:0 10px;">|</span><a href="/login/findPw">비밀번호찾기</a>
          </div>  
        </form> 
      </div>
    </div>