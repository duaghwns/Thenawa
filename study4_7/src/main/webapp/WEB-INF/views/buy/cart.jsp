<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="list" tagdir="/WEB-INF/tags/list"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main role="main" class="main-content" style="clear:both;">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
 		
	       <div class="row align-items-center mb-2">
	       
	         <div class="col">
	           <h2 class="h5 page-title">구매 페이지</h2>
	         </div>
	         <div class="col-auto">
	           <form class="form-inline">
	             <div class="form-group d-none d-lg-inline">
	             </div>
	           </form>
	         </div>
	         
	       </div>
	       
	       <!-- item list div -->
	       <div class="row items-align-baseline">
	       			<!-- table container -->
	              	<div class="col-md-12 col-lg-12">
		                <div class="card shadow mb-4">
		                  <div class="card-body">
		                  
		                    <!-- table -->
		                      <table class="table table-borderless table-hover">
		                        <thead>	
		                          <tr>
		                            <th></th><th></th><th></th><th></th><th></th><th style='width:200px; min-width: 150px'></th><th></th>
		                          </tr>
		                        </thead>
		                        
		                        <!-- 컨트롤러에서 model에 저장한 dataList를 목록에 뿌림 -->
		                        <tbody id="tbody">
									<c:forEach items="${cartList }" var="item">
										<tr>
										  <td>
										  </td>
										  <td>
										    <div class='avatar avatar-md'>
										      <a href="${item.cartUrl }"  target='_blank'>
										        <img id='itemImg' src='${item.cartImg}' alt='...' class='avatar-img rounded-circle'>
										      </a>
										    </div>
										  </td>
										  <td colspan='4'>
										  	<a href="${item.cartUrl }"  target='_blank'>
										    <p class='mb-0 text-muted'>
										      <strong id='itemName' style='font-size:18px'>${item.cartName}</strong>
										    </p>
											</a>
										  </td>
										  <td></td>
										  <td colspan='2'>
										    <p class='mb-0 text-muted'>
										      <strong style='font-size:20px' id='itemPrice'>
										      	<c:if test="${item.cartPrice eq 0 }">판매준비</c:if>
										      	<c:if test="${item.cartPrice ne 0 }">
										      		<fmt:formatNumber value="${item.cartPrice }" pattern="###,###,###" />원
										      	</c:if>
										      </strong>
										    </p>
										  </td>
										</tr>
									</c:forEach>
		                        </tbody>
		                      </table>
		                  </div> <!-- .card-body -->
		                </div> <!-- .card-shadow -->
	              	</div><!-- end-table container -->
	              	
	              	<div class="row items-align-baseline col-md-12 col-lg-12" id="ads">
	              	
		              	<div class="col-md-12 col-lg-8">
		              		<div class="card shadow mb-4">
			                  <div class="card-body">
								  <div class="form-row">
					                  <div class="form-group col-md-6">
					                    <label for="lastname">받는 사람</label>
					                    <input type="text" id="lastname" class="form-control" value="${member.memName }">
					                  </div>
					              </div>
				                  <div class="form-group">
				                    <label for="inputEmail4">연락처</label>
				                    <input type="email" class="form-control" id="inputHp" value="${member.memHp }">
				                  </div>
				                  <div class="form-group">
				                    <label for="inputAddress5">배송 받을 주소</label>
				                    <input type="text" class="form-control" onclick="execDaumPostcode()" id="inputAdd1" value="${member.memAdd1 }" readonly>
				                  </div>
				                  <div class="form-row">
				                    <div class="form-group col-md-6">
				                      <label for="inputCompany5">상세주소</label>
				                      <input type="text" class="form-control" id="inputAdd2" value="${member.memAdd2 }">
				                    </div>
				                    <div class="form-group col-md-6">
				                      <label for="inputZip5">우편번호</label>
				                      <input type="text" class="form-control" onclick="execDaumPostcode()" id="inputZip" value="${member.memZip }" readonly>
				                    </div>
				                 </div>
					         </div>
					       </div>
		              	</div>
		              	
		              	<div class="col-md-12 col-lg-4">
		              		<div class="card shadow mb-4">
			                  <div class="card-body">
			                  		<div style="height:200px">
			                  			<strong style='font-size:25px; left:10px; top:30px; position:relative' id='itemPrice'>
			                  				총 <fmt:formatNumber value="${totalPrice }" pattern="###,###,###" />원
			                  			</strong>
			                  		</div>
			                  		<hr>
				              		<div>
				              			<button type="button" class="btn btn-primary btn-block" id="btn-buy">결제</button>
				              		</div>
				              		<br>
				              		<div>
				              			<button type="button" class="btn btn-danger btn-block" id="btn-cancel">취소</button>
				              		</div>
				             </div>
				           </div>
		              	</div>
	              		
	              	</div>
	              	
       		</div>
 		</div> <!-- col-12 end -->
    </div> <!-- row end -->
  </div> <!-- container-end -->
</main> <!-- main -->

<!-- 다음주소api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$("#btn-cancel").click(function(){
		location.replace("/data/cpu");
	});
	$("#btn-buy").click(function(){
		location.replace("/data/cart/cash?totalPrice="+${totalPrice });
	});
	
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
                    $('#inputAdd2').val(extraAddr);
                } else {
                	$('#inputAdd2').val("");
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#inputZip').val(data.zonecode);
                $('#inputAdd1').val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $('#inputAdd2').focus();
            }
        }).open();
    }
</script>
