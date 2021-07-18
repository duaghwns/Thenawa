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
	           <h2 class="h2 page-title">구매가 완료되었습니다</h2>
	         </div>
	         <div class="col-auto">
	           <form class="form-inline">
	             <div class="form-group d-none d-lg-inline">
	             </div>
	           </form>
	         </div>
	         
	       </div>
	       
       		
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
       		</div>
       		
       		<div class="row items-align-baseline col-md-12 col-lg-12" id="ads">
       		
				<div class="col-md-12 col-lg-8">
              		<div class="card shadow mb-4">
	                  <div class="card-body">
						  <div class="form-row">
			                  <div class="form-group col-md-6">
					             <h4 class="h4 page-title">주문 정보</h4>
					          </div>
			                  <div class="form-group col-md-6">
			                    <label for="lastname">받는 사람</label>
			                    <input type="text" id="lastname" class="form-control" value="${member.memName }" readonly>
			                  </div>
			              </div>
		                  <div class="form-group">
		                    <label for="inputEmail4">연락처</label>
		                    <input type="email" class="form-control" id="inputHp" value="${member.memHp }" readonly>
		                  </div>
		                  <div class="form-group">
		                    <label for="inputAddress5">배송 받을 주소</label>
		                    <input type="text" class="form-control" onclick="execDaumPostcode()" id="inputAdd1" value="${member.memAdd1 }" readonly>
		                  </div>
		                  <div class="form-row">
		                    <div class="form-group col-md-6">
		                      <label for="inputCompany5">상세주소</label>
		                      <input type="text" class="form-control" id="inputAdd2" value="${member.memAdd2 }" readonly>
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
		            <div>
	           			<button type="button" class="btn btn-primary btn-block" id="btn-reserv">방문설치 예약</button>
	           		</div>
	           		<br>
	           		<div>
	           			<button type="button" class="btn btn-danger btn-block" id="btn-home">홈으로</button>
	           		</div>
	           	  </div>
	           	</div>
	          </div>
			</div>
 		</div> <!-- col-12 end -->
    </div> <!-- row end -->
  </div> <!-- container-end -->
</main> <!-- main -->


<script type="text/javascript">
	$("#btn-home").click(function(){
		location.replace("/data/cpu");
	});
	$("#btn-reserv").click(function(){
		location.replace("/reserv/reserv");
	});
</script>