<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<main role="main" class="main-content" style="clear:both;">
	<div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
              <h2 class="h3 mb-4 page-title">회원정보 수정</h2>
              <hr>
              <div class="my-4">
                <form:form id="editForm" modelAttribute="member" action="passedit" method="post">
                  <div class="row mt-5 align-items-center">
                    <div class="col">
                      <div class="row align-items-center">
                        <div class="col-md-7">
                          <h4 class="mb-1">${member.memId }</h4>
                          <p class="small mb-3"><span class="badge badge-dark">${member.memAdd1 }</span></p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <hr class="my-4">
                  <div class="row mb-4">
                    <div class="col-md-6">
                      <div class="form-group">
                      	<!-- 쿼리문에 쓸 아이디를 담아줄 hidden id -->
                      	<form:hidden path="memId" value="${member.memId}"/>
                        <label for="memPass">현재 비밀번호*(필수)</label>
                        <form:password cssClass="form-control" id="memPass" path="memPass" required="required"/>
                        <label for="newMemPass" style="margin-top:5px;">새 비밀번호*(필수)</label>
                        <form:password cssClass="form-control" id="newMemPass" path="newMemPass" required="required"/>
                        <form:errors style="color:red;"  path="newMemPass"/>
                        <label for="newPassConfirm" style="margin-top:5px;">비밀번호확인*(필수)</label>
                        <form:password cssClass="form-control" id="newPassConfirm" path="newPassConfirm" required="required"/>
                        <form:errors style="color:red;"  path="newPassConfirm"/>
                      </div>
                    </div>
                  </div>
                  <hr class="my-4">
                  <form:button id="submitBtn" style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem;">수정정보 저장</form:button>
                </form:form>
              </div> <!-- /.card-body -->
            </div> <!-- /.col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
    </main> <!-- main -->
    
    <!-- script 부분 -->
    <script>
 	// 비밀번호 확인 여부 검사
 	$("#submitBtn").click(function(){
 		event.preventDefault(); //저장 버튼의 submit기능 막기
 		
 		var newMemPass = $("#newMemPass").val();
 		var newPassConfirm = $("#newPassConfirm").val();
 		var memPass = "<c:out value='${member.memPass}'/>"; //현재 비밀번호 변수에 저장
 		
 		if(newMemPass == "" || newPassConfirm == "" ){
 			alert("모두 필수로 입력해야합니다.");
 		}
 		
 		if($("#memPass").val() != memPass){
 			alert("현재 비밀번호와 맞지않습니다.");
 		}
 		
 		if(newMemPass == newPassConfirm && $("#memPass").val() == memPass){	// 이메일인증 여부와 현재비밀번호 비교
 			$("#editForm").submit(); //editForm을 서브밋
 		}else if(newMemPass != newPassConfirm){
 			alert("새 비밀번호와 비밀번호확인이 일치하지않습니다.");
 		}
 	});
 	
</script>
