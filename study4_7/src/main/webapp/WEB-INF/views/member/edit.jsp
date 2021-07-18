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
                <form:form id="editForm" modelAttribute="member" action="edit" method="post">
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
                  <div class="form-row">
                    <div class="form-group col-md-5">
                      <label for="memName">이름</label>
                      <form:input id="memName" path="memName" cssClass="form-control" value="${member.memName }" />
                      <form:errors style="color:red;"  path="memName" />
                    </div>
                    
                    <!-- input 태그는 readonly="readonly", form:input태그는 readonly="true"를 씀 -->
                    
                    <div class="form-group col-md-5">
                      <label for="memId">아이디</label>
                      <form:input id="memId" path="memId" cssClass="form-control" value="${member.memId }" readonly="true" />
                    </div>
                    <div class="form-group col-md-2">
                      <label for="memSex">성별</label>
                      <form:input id="memSex" path="memSex" cssClass="form-control" value="${member.memSex }" readonly="true" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="memBir">생일</label>
                    <input type="date" class="form-control" id="memBir" name="memBir" value="${member.memBir }" readonly="readonly" />
                  </div>
                  <div class="form-group">
                    <label for="memHp">핸드폰번호</label>
                    <form:input cssClass="form-control" id="memHp" path="memHp" value="${member.memHp }" />
                    <form:errors style="color:red;"  path="memHp"/>
                  </div>
                  <div class="form-group input-group">
                    <label for="memMail">이메일&nbsp;&nbsp;</label>
                    <form:input cssClass="form-control" id="memMail" path="memMail" value="${member.memMail }" />
                    <form:errors style="color:red;"  path="memMail"/>
                    <div class="input-group-append" style="margin-right:40px;">
                       <form:button id="sendMail" style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem;" name="sendMail" onclick="fn_emailSend()">인증번호발송</form:button>
                    </div>
                    <form:input path="inputKey" id="inputKey" cssClass="form-control required number" placeholder="이메일 인증번호" />
                    <form:hidden path="emailKey" id="emailKey" cssClass="form-control" value="" />
                    <form:hidden path="emailConfirm" id="emailConfirm" value="Y" />
                  </div>
                  <div class="form-row">
	                  <div class="form-group col-md-6">
	                    <label for="memAdd1">주소</label>
	                    <form:input path="memAdd1" cssClass="form-control required" id="address" value="${member.memAdd1 }" />
						<form:errors style="color:red;"  path="memAdd1"/>
	                  </div>
	                  <div class="form-group col-md-2">
	                  	<label for="memZip">우편번호</label>
	                  	<form:input path="memZip" cssClass="form-control required" id="postcode" placeholder="우편번호" value="${member.memZip }"/>
                        <form:errors style="color:red;"  path="memZip"/>
	                  </div>
	                  <div class="form-group col-md-4">
	                  	<form:button style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem; margin-top:27px;" onclick="execDaumPostcode()">우편번호찾기</form:button>
	                  </div> 
                  </div>
                  <div class="form-row">
	                  <div class="form-group col-md-6">
		                  <label for="memAdd2">상세주소(층, 호수)</label>
		                  <form:input path="memAdd2" cssClass="form-control" style="margin-right:40px;" id="detailAddress" value="${member.memAdd2 }"/>
	                  </div>
	                  <div class="form-group col-md-6">
		                  <label for="extraAddress">참고항목(동)</label>
		                  <form:input path="extraAddress" cssClass="form-control" id="extraAddress" placeholder="참고항목" />
	                  </div>
	                  
	                  	
	                </div>
                  <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="memRegDate">가입일</label>
                      <input type="date" class="form-control" id="memRegDate" value="${member.memRegDate }" readonly="readonly" />
                    </div>
                    <div class="form-group col-md-6">
                      <label for="memMileage">마일리지</label>
                      <input type="text" class="form-control" id="memMileage" value="${member.memMileage }" readonly="readonly" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="memPurpose">PC 사용목적</label>
                    	<br>
	                    <form:radiobutton style="display:inline-block; margin-right:5px;" path="memPurpose" value="GAME" label="게임"/>
	                    <form:radiobutton style="display:inline-block; margin-right:5px;" path="memPurpose" value="WORD" label="문서작업"/>
	                    <form:radiobutton style="display:inline-block; margin-right:5px;" path="memPurpose" value="STREAM" label="인터넷방송"/>
	                    <form:radiobutton style="display:inline-block;" path="memPurpose" value="ETC" label="기타"/>
                    	<form:errors style="color:red;"  path="memPurpose"/>
                  </div>
                  <hr class="my-4">
                  <div class="row mb-4">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="memPass">현재 비밀번호*(필수)</label>
                        <form:password cssClass="form-control" id="memPass" path="memPass" required="required"/>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <p class="mb-2">현재 비밀번호는 필수입력입니다.</p>
                      <ul class="small text-muted pl-4 mb-0">
                        <li>이메일을 변경할 경우 인증이 필요합니다.</li>
                      </ul>
                    </div>
                  </div>
                  <hr class="my-4">
                  <form:button id="submitBtn" style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem;">수정정보 저장</form:button>
                  <form:button style="color:#fff; background-color:#1b68ff; border-color:#1b68ff; border-radius:0.25rem; padding:0.375rem 0.75rem;" onclick="location.href='/member/passedit'">비밀번호 변경</form:button>
                </form:form>
              </div> <!-- /.card-body -->
            </div> <!-- /.col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
    </main> <!-- main -->
    
    <!-- script 부분 -->
    <!-- 다음주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function execDaumPostcode() {
    	event.preventDefault();
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    
 	// 이메일 인증 스크립트
    function fn_emailSend(){
    	event.preventDefault();
    	if($("#memMail").val() == ""){
    		alert("이메일을 입력해주세요.");
    	}else{
    		alert("인증메일을 발송했습니다. 메일을 확인해주세요");
        	var param={email : $("#memMail").val()};
        	$.ajax({
        		url : "email",
        		type : "post",
        		data : param,
        		success : function (data){	//data가 생성된 6자리 숫자 랜덤키
        			alert(data);
        			$("#emailKey").val(data);
        		}
        	});	
    	}	
    }
 	
 	
 	// 이메일을 변경하는 경우
 	$("#memMail").keyup(function(){
    	$("#emailConfirm").attr("value", "N"); // 이메일 인증여부 value값을 'N'으로 변경
    });
 	
 	// 이메일 인증여부 변경(이메일 인증키와 입력 인증키 비교)
 	$("#inputKey").keyup(function(){
 		if($("#emailKey").val()==$("#inputKey").val()){
 			$("#emailConfirm").attr("value", "Y"); // 값이 같으면 컨펌여부 Y로 변경
 		}
 	});
 	
 	// submit시 이메일, 비밀번호 확인 여부 검사(둘다 변경안할 경우 디폴트로 'Y'값을 가짐)
 	$("#submitBtn").click(function(){
 		event.preventDefault(); //저장 버튼의 submit기능 막기
 		
 		var emailOK = $("#emailConfirm").val();
 		var memPass = "<c:out value='${member.memPass}'/>"; //현재 비밀번호 변수에 저장
 		
 		if($("#memPass").val() == ""){
 			alert("현재 비밀번호를 입력해주세요");
 		}
 		
 		if($("#memPass").val() != memPass){
 			alert("현재 비밀번호와 맞지않습니다.");
 		}
 		
 		if(emailOK == 'Y' && $("#memPass").val() == memPass){	// 이메일인증 여부와 현재비밀번호 비교
 			$("#editForm").submit(); //editForm을 서브밋
 		}else if(emailOK == 'N'){
 			alert("이메일 인증을 해주세요.");
 		}
 	});
 	
</script>
