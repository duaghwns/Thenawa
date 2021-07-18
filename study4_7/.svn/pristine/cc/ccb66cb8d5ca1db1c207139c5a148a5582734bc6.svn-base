<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<main role="main" class="main-content" style="clear:both;">
<div class="container-fluid">
	<div class="row justify-content-center">
	<div class="col-12 col-lg-10">
		<form:errors path="member.*" cssClass = "errorblock" element = "div"/>
	</div>
	</div>
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
              <h2 class="page-title">회원가입</h2>
	 <div class="card my-4">
                <div class="card-header">
                  <strong>Validation</strong>
                </div>
                <div class="card-body">
                  <form:form id="example-form" modelAttribute="member" action="memberInsert" method="POST">
                    <div>
                   	 <h3>이용약관동의(필수)</h3>
                      <section>
                        <label for="agreeYn">
	                        <p>정보통신망법 규정에 따라 회원가입 신청하시는 분께 수집하는 개인정보에 대하여 알려드립니다.</p>
							<p>1. 개인정보의 수집 항목</p>
							<p>2. 개인정보의 수집 및 이용목적</p>
							<p>3. 개인정보의 보유 및 이용기간</p>
							<p>위 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
						</label>
                        <form:checkbox path="agreeYn" id="agreeYn" cssClass="required" value="Y" />&nbsp;이용약관동의(필수) 
                        <form:errors path="agreeYn"/>
                      </section>
                      <h3>회원가입란 작성</h3>
                      <section>
                      <div class="form-group">
                          <form:hidden path="confirmY" id="confirmY" cssClass="form-control" value="Y" />
                       </div>
                        <div class="form-group input-group">
                          <label for="memId">아이디 *</label>
                          <form:input path="memId" id="memId" minlength="5" cssClass="form-control required" />
                          <form:errors path="memId"/>
	                        <div class="input-group-append">
	                          <form:button style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem;" onclick="fn_idChk()">중복확인</form:button>
	                          <form:hidden cssClass="form-control" path="idCheck" id="idCheck" value="N" equalTo="#confirmY"/>
	                          <form:errors path="idCheck"/>
	                        </div>
                        </div>
                        <div class="form-group">
                          <label for="memPass">비밀번호 *</label>
                          <form:password path="memPass" id="memPass" minlength="8" cssClass="form-control required" />
                          <form:errors path="memPass"/>
                        </div>
                        <div class="form-group">
                          <label for="passConfirm">비밀번호 확인 *</label>
                          <form:password path="passConfirm" id="passConfirm" equalTo="#memPass" cssClass="form-control required" />
                        </div>
                        <div class="form-group">
                          <label for="memName">이름 *</label>
                          <form:input path="memName" id="memName" minlength="2" cssClass="form-control required" />
                          <form:errors path="memName" />
                        </div>
                        <div class="form-group">
                        <label for="memSex">성별 *</label>
	                        <form:radiobutton style="display:inline-block; margin-right:5px;" path="memSex" value="M" label="남자"/>
	                        <form:radiobutton style="display:inline-block;" path="memSex" value="F" label="여자"/>
	                        <form:errors path="memSex"/>
                     	 </div>
                     	 <div class="form-group input-group">
                     	 	<label for="memBir">생일 *</label>
                            <input type="date" class="form-control required" id="memBir" name="memBir" value="" />
                            <form:errors path="memBir" />
                          </div>
                          <div class="form-group">
                          <label for="memHp">핸드폰번호 *(-포함)</label>
                          <form:input path="memHp" id="memHp" type="text" cssClass="form-control required" rangelength="[13,14]" />
                          <form:errors path="memHp"/>
                        </div>
                        <div class="form-group input-group">
                          <label for="memMail">이메일 *</label>
                          <form:input path="memMail" id="memMail" cssClass="form-control required email" />
                          <form:errors path="memMail"/>
                          <div class="input-group-append" style="margin-right:40px;">
                          	<form:button id="sendMail" style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem;" name="sendMail" onclick="fn_emailSend()">인증번호발송</form:button>
                          </div>
                          	<form:input path="inputKey" id="inputKey" cssClass="form-control required number" equalTo="#emailKey" placeholder="이메일 인증번호" />
                          	<form:hidden path="emailKey" id="emailKey" cssClass="form-control" value="" />
                        </div>
                        <div class="form-group input-group">
                        	<label>주소 *</label>
                        	<form:input path="memZip" cssClass="form-control required" id="postcode" placeholder="우편번호" />
                        	<form:errors path="memZip"/>
							<form:button style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem; margin-right:40px;" onclick="execDaumPostcode()">우편번호찾기</form:button>
							<form:input path="memAdd1" cssClass="form-control required" id="address" placeholder="주소" />
							<form:errors path="memAdd1"/>
							
                        </div>
                        <div class="form-group input-group">
							<form:input path="memAdd2" cssClass="form-control" style="margin-right:40px;" id="detailAddress" placeholder="상세주소" />
							<form:input path="extraAddress" cssClass="form-control" id="extraAddress" placeholder="참고항목" />
						</div>
						<div class="form-group">
                        <label for="memPurpose">pc사용목적 *</label>
                        	<form:radiobutton style="display:inline-block; margin-right:5px;" path="memPurpose" value="GAME" label="게임"/>
                        	<form:radiobutton style="display:inline-block; margin-right:5px;" path="memPurpose" value="WORD" label="문서작업"/>
                        	<form:radiobutton style="display:inline-block; margin-right:5px;" path="memPurpose" value="STREAM" label="인터넷방송"/>
                        	<form:radiobutton style="display:inline-block;" path="memPurpose" value="ETC" label="기타"/>
                        	<form:errors path="memPurpose"/>
                     	 </div>
                        <div class="help-text text-muted">(*)필수</div>
                      </section>
                    </div>
                  </form:form>
                </div> <!-- .card-body -->
              </div> <!-- .card -->
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
</main> <!-- main -->