<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="list"  tagdir="/WEB-INF/tags/list"%>

	<main role="main" class="main-content" style="clear:both;">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <!-- table 바로 위 부분 -->
              <div class="row align-items-center mb-2">
              
                <div class="col">
                  <h2 class="h5 page-title">Shop deonawa</h2>
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
              	<div class="col-md-12 col-lg-8">
	                <div class="card shadow mb-4">
	                  <div class="card-body">
	                  	<div class="row">
		                    <!-- 검색 폼  -->
							<list:search searchVO="${searchVO }" actionPage="${link }" />
	                  	</div>
	                  
	                  	<div class="row">
	                  	<!-- 상단 정렬 탭 -->
							<list:align searchVO="${searchVO }" actionPage="${link }" 
								searchAlign='${{"hot":"인기상품순","new":"신상품순","low":"낮은 가격순", "high":"높은 가격순"}}'>
							</list:align>
						</div>
	                  
	                    <!-- table scroll bar -->
	                  	<div class="col-12" style="height:600px; overflow:auto">
	                      <table class="table table-borderless table-hover">
	                        <thead>	
	                          <tr>
	                            <th></th><th></th><th></th><th></th><th></th><th style='width:200px; min-width: 150px'></th><th></th>
	                          </tr>
	                        </thead>
	                        
	                        <!-- 컨트롤러에서 model에 저장한 dataList를 목록에 뿌림 -->
	                        <tbody id="tbody">
								<c:forEach items="${dataList }" var="item">
									<tr>
									  <td>
									    <div class='custom-control custom-checkbox'>
									      <input type='checkbox' class='custom-control-input' id='${item.id}'>
									      <input type="hidden" id="itemUrl" value="${item.url }"> 
									      <label class='custom-control-label' for='${item.id}'></label>
									    </div>
									  </td>
									  <td>
									    <div class='avatar avatar-md'>
									      <a href="${item.url }"  target='_blank'>
									        <img id='itemImg' src='${item.img}' alt='...' class='avatar-img rounded-circle'>
									      </a>
									    </div>
									  </td>
									  <td colspan='4'>
									  	<a href="${item.url }"  target='_blank'>
									    <p class='mb-0 text-muted'>
									      <strong id='itemName'>${item.name}</strong>
									    </p>
									    <small class='mb-0 text-muted'>${item.name}/${item.year}/<fmt:formatNumber value="${item.price }" pattern="###,###,###" />원 ...
										</small>
										</a>
									  </td>
									  <td colspan='2'>
									    <p class='mb-0 text-muted'>
									      <strong style='font-size:17px' id='itemPrice'>
									      	<c:if test="${item.price eq 0 }">판매준비</c:if>
									      	<c:if test="${item.price ne 0 }">
									      		<fmt:formatNumber value="${item.price }" pattern="###,###,###" />원
									      	</c:if>
									      </strong>
									    </p>
									  </td>
									  <td>
								  		<c:if test="${item.price eq 0 }">
									  		<button class='btn mb-2 btn-primary' type='button' style='width:90px; height:35px' id='btn_add' disabled>
										      <span class='fe fe-arrow-right fe-10 mr-2'> 담기</span>
										    </button>
								  		</c:if>
								      	<c:if test="${item.price ne 0 }">
										    <button class='btn mb-2 btn-primary' type='button' style='width:90px; height:35px' id='btn_add'>
										      <span class='fe fe-arrow-right fe-10 mr-2'> 담기</span>
										    </button>
								      	</c:if>

									  </td>
									</tr>
									    
								</c:forEach>
	                        </tbody>
	                      </table>
	                  	</div>
	                  	<!-- 페이징 Paging -->
	                  	<list:paging searchVO="${searchVO }" linkPage="${link }"></list:paging>
	                  </div> <!-- .card-body -->
	                </div> <!-- .card-shadow -->
              	</div><!-- end-table container -->
                
                <!-- 담은 목록 컨테이너 -->
                <div class="col-md-12 col-lg-4">
                  <div class="card shadow mb-4">
                    <div class="card-header">
                      <strong class="card-title mb-0"><span class="fe fe-shopping-cart fe-16 mr-2"></span>장바구니</strong>
                    </div>
                    
                    <!-- 장바구니에 담기는 곳 -->
                    <div class="card-body" style="height:570px; overflow:auto" id="cartList">
                    	<table class="table table-borderless table-hover">
                    		<!-- 장바구니에 담기는 아이템, 스크립트에서 추가 -->
                    		<tbody id="cartTr">
                    		
                    		</tbody>
			            </table>
                    </div>
                    <hr>
                    <div>
                      <table style="position:relative; margin:0 auto; width:100%">
                      	<tr>
                      	  <td>
                      	    <p class='mb-0 text-muted' style="position:relative; margin:0 auto; width:80%;">
                  	  		  <strong style='font-size:20px' id="totalPrice"></strong>
                  	  	    </p>
                      	  </td>
                      	  <td>
                      	    <!-- 구매버튼 -->
                      	    <button type="button" class="btn mb-2 btn-primary" id="btn-buy" style="position:relative; margin:0 auto; width:80%;">구매</button>
                      	  </td>
                      	</tr>
                      	<tr>
                      	  <td>
                      	    <!-- 희망구매가격을 입력받음 -->
                      	    <input type="text" id="input-price" placeholder="희망구매가격" class="form-control" style="position:relative; width:80%; margin:0 auto; bottom: 4px">
                      	  </td>
                      	  <td>
                      	    <!-- 추천받기 버튼 -->
                      	    <button type="button" class="btn mb-2 btn-danger" id="recommend" style="position:relative; margin:0 auto; width:80%;">추천받기</button>
                      	  </td>
                      	</tr>
                      </table>
                    </div>
                  </div><!-- card-body -->
                </div><!-- card-shadow -->
              </div><!-- end-담은 목록 컨테이너 -->
              
              <!-- 광고 3개 들어가는 컨테이너 -->
              <div class="row items-align-baseline" id="ads">
                
              </div> <!-- end-광고 컨테이너 -->
              
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
        <!-- 알림 버튼 눌렀을 때 오른쪽에 나오는거 -->
        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">제품 목록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <!-- 추천버튼 클릭시 스크립트에서 채워넣음 -->
                <div class="list-group list-group-flush my-n3" id="recList" style="height:570px; overflow:auto">
                
                </div> <!-- / .list-group -->
                
              <div class="modal-footer">
                <p class='mb-0 text-muted' style="position:relative; margin:0 auto; width:80%;">
                  <!-- 추천목록에 담긴 제품들의 총 가격이 반영되는 부분 -->
                  <strong style='font-size:20px' id="toPrice"></strong>
                </p>
              </div>
              <div class="modal-footer">
                <button type="button" onclick="f_buy()" class="btn btn-danger btn-block" data-dismiss="modal">장바구니에 담기</button>
              </div>
              </div>
            </div>
          </div>
        </div>
      </main> <!-- main -->

	<script>
		
        // 장바구니  (ajax 로 localstorage 와의 상호작용, 로그인시에는 cart table을 사용함)
        var v_tblName = "CartDB";
        var v_datas = []; // 전체 json을 담을 빈 배열 생성
        if(JSON.parse(localStorage.getItem(v_tblName))){ // localStorage에 CartDB가 존재한다면 v_datas에 적용
        	v_datas = JSON.parse(localStorage.getItem(v_tblName));
        }
       	
    	// v_cart1 은 아이템 id 담기 전까지
        var v_cart1 = "<tr><td><a class='text-muted my-2' id='del'  style='cursor: pointer;'><span class='fe fe-x fe-16'></span></a><input type='hidden' id='cartItem' value='";
        // v_cart2 는 카트 No 담기 전까지
        var v_cart2 = "'><input type='hidden' id='cartNo' value='";
        // v_cart3 은 제품 url 담기 전까지
        var v_cart3 = "'><a class='text-muted my-2' href='";
        // v_cart4 는 이미지 소스 담기 전까지
        var v_cart4 = "'  target='_blank'>&nbsp;<img src='";
        // v_cart5 는 제품명 전까지
        var v_cart5 = "' alt='...' class='avatar-img rounded-circle' style='width:60px; height: 60px'>&nbsp;<strong style='font-size:12px' id='iname'>";
        // v_cart6 은 가격 전까지
        var v_cart6 = "</strong></a><strong style='font-size:18px' id='itemPrice'>&nbsp;";
        // v_cart7 는 마무리
        var v_cart7 = "원</strong></td></tr>";
       	
        // 페이지 로드가 끝나면 데이터를 장바구니 목록에 추가함
        $(document).ready(f_makeList());
        
        // 장바구니 테이블 데이터를 리스트에 뿌림
        function f_makeList(){
        	$('#totalPrice').html("0 원")
        	
        	$.ajax({
	            type:"post", 
	            url:'<c:url value="/data/cart/list" />',
	    		dataType : 'json', 
	            data:"link=${link }&curPage=${searchVO.totalPageCount }&searchAlign=${searchVO.searchAlign}&searchWord=${searchVO.searchWord }",
	            success:function(p_rslt){
	            	
	        		var v_inner = "";
	        		var v_totalPrice = 0;
	            	
	            	if(p_rslt.count >= 0){ // 로그인 했다면 정보를 가져다 넣음
	            		if(p_rslt.count > 0 && v_datas.length > 0){ // 해당 유저의 cart 테이블에 데이터가 들어있다면
			        		// cart 테이블의 정보를 장바구니 목록에 추가
	            			for(var i=0; i < p_rslt.data.length; i++){
			        			var v_data = p_rslt.data[i];
			        			v_totalPrice += parseInt(v_data.cartPrice);
			        			v_inner += v_cart1 + v_data.cartItem + v_cart2 + v_data.cartNo + v_cart3 + v_data.cartUrl + v_cart4 + v_data.cartImg
		        							+ v_cart5 + v_data.cartName + v_cart6 + parseInt(v_data.cartPrice).toLocaleString('ko-KR') + v_cart7;
			        		}
	            			// 로컬 스토리지 CartDB의 정보를 장바구니 목록에 추가
		            		for(var i=0; i<v_datas.length; i++){
		            			var v_data = v_datas[i];
		            			v_totalPrice += parseInt(v_data.price);
		            			v_inner += v_cart1 + v_data.id + v_cart2 + v_cart3 + v_data.url + v_cart4 + v_data.img
								+ v_cart5 + v_data.name + v_cart6 + parseInt(v_data.price).toLocaleString('ko-KR') + v_cart7;
		            			
		            			// ajax로 cart 테이블에 추가
		            			f_add(v_data);
		            		}
	            		}else if(p_rslt.count <= 0 && v_datas.length > 0){ // 로컬스토리지에만 데이터가 들어있다면
	            			// 로컬 스토리지 CartDB의 정보를 장바구니 목록에 추가
	            			for(var i=0; i<v_datas.length; i++){
		            			var v_data = v_datas[i];
		            			v_totalPrice += parseInt(v_data.price);
		            			v_inner += v_cart1 + v_data.id + v_cart2 + v_cart3 + v_data.url + v_cart4 + v_data.img
								+ v_cart5 + v_data.name + v_cart6 + parseInt(v_data.price).toLocaleString('ko-KR') + v_cart7;
		            			
		            			// ajax로 cart 테이블에 추가
		            			f_add(v_data);
	            			}
	            		}else if(p_rslt.count > 0 && v_datas.length <= 0){ // 유저의 cart 테이블에만 데이터가 들다면
	            			// cart 테이블의 정보를 장바구니 목록에 추가
	            			for(var i=0; i < p_rslt.data.length; i++){
			        			var v_data = p_rslt.data[i];
			        			v_totalPrice += parseInt(v_data.cartPrice);
			        			v_inner += v_cart1 + v_data.cartItem + v_cart2 + v_data.cartNo + v_cart3 + v_data.cartUrl + v_cart4 + v_data.cartImg
		        							+ v_cart5 + v_data.cartName + v_cart6 + parseInt(v_data.cartPrice).toLocaleString('ko-KR') + v_cart7;
			        		}
	            		}
	            	
	            		// 로그인했으면 localStorage 데이터를 서버 DB로 다 옮기고 localStorage는 비운 후 저장
            			v_datas = [];
            			localStorage.setItem(v_tblName, JSON.stringify(v_datas));
	            		
	         			$('#cartTr').html(v_inner);
	         			$('#totalPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원")
	            	}else{ // 로그인 안했다면 localStorage 의 데이터를 가져다 넣음
	            		for(var i=0; i<v_datas.length; i++){
	            			var v_data = v_datas[i];
	            			v_totalPrice += parseInt(v_data.price);
	            			v_inner += v_cart1 + v_data.id + v_cart2 + v_data.no + v_cart3 + v_data.url + v_cart4 + v_data.img
							+ v_cart5 + v_data.name + v_cart6 + parseInt(v_data.price).toLocaleString('ko-KR') + v_cart7;
	            		}
	         			$('#cartTr').html(v_inner);
	         			$('#totalPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원")
	            	}
	            	f_del();
	            }
				, error : function(req, st, err) {
					console.log('----------------------------');
					console.log('request', req);
					console.log('status', st);
					console.log('errors', err);
					console.log('----------------------------');
				}
        	});
        }
       	
        // 현재 페이지에 존재하는 제품목록에 붙은 담기 버튼 전부에 클릭 이벤트 걸기
        var v_btn = document.querySelectorAll("#btn_add");
        for(var i=0; i<v_btn.length; i++){
        	v_btn[i].onclick = function(){
        		var v_id = $(this).closest('tr').find('.custom-control-input').attr('id');
        		var v_img = $(this).closest('tr').find('#itemImg').attr('src');
        		var v_name = $(this).closest('tr').find('#itemName').html();
        		var v_url = $(this).closest('tr').find('#itemUrl').val();
        		var v_price = $(this).closest('tr').find('#itemPrice').html().replace("원", "").replaceAll(",","").replaceAll("판매준비", "0");
                
                var v_data = {};
                v_data.id = v_id;
                v_data.img = v_img; 
                v_data.name = v_name; 
                v_data.url = v_url; 
                v_data.price = v_price; 
                
        		// 장바구니 목록 innerHTML 에 들어가는 부분
        		var v_inner = v_cart1 + v_id + v_cart2 + v_cart3 + v_url + v_cart4 + v_img + v_cart5 + v_name 
                				+ v_cart6 + parseInt(v_price).toLocaleString('ko-KR') + v_cart7;
                
                $('#cartTr').html($('#cartTr').html() + v_inner);
                
				// 총액을 불러다 숫자로 변환 후 금액을 더함
            	var v_total = parseInt($('#totalPrice').html().replace("원", "").replaceAll(",","").replace(" ",""));
            	var v_sum = v_total + parseInt(v_price);
            	
            	// 더한 금액을 문자열로 변환한 후 적용
            	var v_sumStr = v_sum.toLocaleString('ko-KR') + " 원";
            	$('#totalPrice').html(v_sumStr);
				
            	f_add(v_data);
				f_del();
        	}
        }
        
        // 데이터 추가(파라미터는 데이터)
        function f_add(p_data){
			$.ajax({
	            type:"post", 
	            url:'<c:url value="/data/cart/add" />',
	            data:"cartItem="+p_data.id, // post로 전송시 쓰임
	            success:function(p_rslt){
	            	if(p_rslt == -1){ // 로그인 안했다
						// 데이터를 담아서 로컬 스토리지에 저장
	            		v_datas.push(p_data);
	            		localStorage.setItem(v_tblName, JSON.stringify(v_datas));
	            	}else{
	            		return p_rslt;
	            	}
	            }
				, error : function(req, st, err) {
					console.log('----------------------------');
					console.log('request', req);
					console.log('status', st);
					console.log('errors', err);
					console.log('----------------------------');
				}	
	        });
        }

        // 삭제 버튼 클릭시 실행
       	function f_del(){
        	var v_del = document.querySelectorAll("#del");
        	for(var j=0; j<v_del.length; j++){
        		v_del[j].onclick = function(){
        			
        			var v_no = $(this).closest('tr').find('#cartNo').val();
        			var v_itemId = $(this).closest('tr').find('#cartItem').val();
        			
        			// 마찬가지로 제거될때 총액에서 빠져나가는 것 구현
        			// 제거 대상 제품 가격과 이름 저장
        			var v_iprice = $(this).closest('tr').find('#itemPrice').html().replace("원", "").replaceAll(",","").replace("&nbsp;","");
        			var v_iname = $(this).closest('tr').find('#iname').html();
        			// 총 금액 숫자로 가져옴
        			var v_itotal = parseInt($('#totalPrice').html().replace("원", "").replaceAll(",","").replace(" ",""));
        			// 총 금액에서 제거되는 제품 가격 제거
        			var v_minus = v_itotal - parseInt(v_iprice);
        			
        			// 총 금액에 반영
        			var v_minStr = v_minus.toLocaleString('ko-KR') + " 원";
        			$('#totalPrice').html(v_minStr);
        			
        			// 제거될 상위 tr 태그 삭제
        			$(this).closest('tr').remove();
        			
        			// ajax 로 DB에서도 해당 제품 제거(cart_cnt = 0 으로 만듬)
        			$.ajax({
        	            type:"post", 
        	            url:'<c:url value="/data/cart/del" />',
        	            data:"cartItem="+v_itemId, // post로 전송시 쓰임
        	            success:function(p_rslt){
        	            	if(p_rslt == "no"){ // 로그인 안했다
        	            		// localStorage 에서 제거 누른 제품이랑 name이 일치하는거 찾아서 제거 후 저장
        	            		for(var i=0; i<v_datas.length; i++){
        	            			if(v_datas[i].name == v_iname){
        	            				v_datas.splice(i, 1);
        	            			}
        	            		}
        	            		localStorage.setItem(v_tblName, JSON.stringify(v_datas));
        	            	}
        	            }
        				, error : function(req, st, err) {
        					console.log('----------------------------');
        					console.log('request', req);
        					console.log('status', st);
        					console.log('errors', err);
        					console.log('----------------------------');
        				}	
        	        });
            	};
        	}
       	}
        
        // 추천목록에 있는 삭제버튼 (= DB연동없이 단순히 목록에서 제거되며, 총액만 깎이는 기능)
        function f_del2(){
        	var v_del2 = document.querySelectorAll("#del2");
        	for(var j=0; j<v_del2.length; j++){
        		v_del2[j].onclick = function(){
        			var v_iprice = $(this).closest('tr').find('#itemPrice').html().replace("원", "").replaceAll(",","").replace("&nbsp;","");
        			var v_iname = $(this).closest('tr').find('#iname').html();
        			// 총 금액 숫자로 가져옴
        			var v_itotal = parseInt($('#toPrice').html().replace("원", "").replaceAll(",","").replace(" ",""));
        			// 총 금액에서 제거되는 제품 가격 제거
        			var v_minus = v_itotal - parseInt(v_iprice);
        			
        			// 총 금액에 반영
        			var v_minStr = v_minus.toLocaleString('ko-KR') + " 원";
        			$('#toPrice').html(v_minStr);
        			$(this).closest('tr').remove();
        			
            		for(var i=0; i<v_recs.length; i++){
            			if(v_recs[i].name == v_iname){
            				v_recs.splice(i, 1);
            				break;
            			}
            		}
        		}
        	}
        }
        
        // p_item 이 p_search 문자열을 포함하면 p_item을 리턴하고 아니라면 blank 리턴
        function f_isHave(p_item, p_search){
        	if(p_item.includes(p_search)){
        		return p_item;
        	}
        	return "";
        }
        
        var v_recs = []; // 전체 json을 담을 빈 배열 생성
        var v_rec = {};
		// 추천받기 버튼 클릭 - 기존 장바구니 제품들과 추천 제품들을 다 담아주어야 결제창으로 넘어가서 보여줄 수 있음
		$("#recommend").click(function(){
	        // 추천에 필요한 배열
			var v_cart11 = "<tr><td><a class='text-muted my-2' id='del2'  style='cursor: pointer;'><span class='fe fe-x fe-16'></span></a><input type='hidden' id='cartItem' value='";
			$("#loadBox").click();
			v_recs = [];
			
			var v_budget = 0;
			// 입력받은 희망가격 정상동작
			if($("#input-price").val() > 0){
				v_budget = $("#input-price").val();
			}

        	$.ajax({
	            type:"post", 
	            url:'<c:url value="/data/cart/list" />',
	    		dataType : 'json', 
	            data:"link=${link }&curPage=${searchVO.totalPageCount }&searchAlign=${searchVO.searchAlign}&searchWord=${searchVO.searchWord }",
	            success:function(p_rslt){
	        		var v_inner = "";
	        		var v_totalPrice = 0;
	            	
	            	if(p_rslt.count >= 0){ // 로그인 했다면 정보를 가져다 넣음
	            		if(p_rslt.count > 0 && v_datas.length > 0){ // 해당 유저의 cart 테이블에 데이터가 들어있다면
			        		// cart 테이블의 정보를 장바구니 목록에 추가
	            			for(var i=0; i < p_rslt.data.length; i++){
			        			var v_data = p_rslt.data[i];
			        			v_rec = {};
			        			v_rec.id = v_data.cartItem;
			                    v_rec.img = v_data.cartImg; 
			                    v_rec.name = v_data.cartName; 
			                    v_rec.url = v_data.cartUrl; 
			                    v_rec.price = v_data.cartPrice; 
			        			v_recs.push(v_rec);
			        			v_totalPrice += parseInt(v_data.cartPrice);
			        			v_inner += v_cart11 + v_data.cartItem + v_cart2 + v_data.cartNo + v_cart3 + v_data.cartUrl + v_cart4 + v_data.cartImg
		        							+ v_cart5 + v_data.cartName + v_cart6 + parseInt(v_data.cartPrice).toLocaleString('ko-KR') + v_cart7;
			        		}
	            			// 로컬 스토리지 CartDB의 정보를 장바구니 목록에 추가
		            		for(var i=0; i<v_datas.length; i++){
		            			var v_data = v_datas[i];
		            			v_rec = {};
			        			v_rec.id = v_data.id;
			                    v_rec.img = v_data.img; 
			                    v_rec.name = v_data.name; 
			                    v_rec.url = v_data.url; 
			                    v_rec.price = v_data.price; 
			        			v_recs.push(v_rec);
		            			v_totalPrice += parseInt(v_data.price);
		            			v_inner += v_cart11 + v_data.id + v_cart2 + v_cart3 + v_data.url + v_cart4 + v_data.img
								+ v_cart5 + v_data.name + v_cart6 + parseInt(v_data.price).toLocaleString('ko-KR') + v_cart7;
		            			
		            			// ajax로 cart 테이블에 추가
		            			f_add(v_data);
		            		}
	            		}else if(p_rslt.count <= 0 && v_datas.length > 0){ // 로컬스토리지에만 데이터가 들어있다면
	            			// 로컬 스토리지 CartDB의 정보를 장바구니 목록에 추가
	            			for(var i=0; i<v_datas.length; i++){
		            			var v_data = v_datas[i];
		            			v_rec = {};
			        			v_rec.id = v_data.id;
			                    v_rec.img = v_data.img; 
			                    v_rec.name = v_data.name; 
			                    v_rec.url = v_data.url; 
			                    v_rec.price = v_data.price; 
			        			v_recs.push(v_rec);
		            			v_totalPrice += parseInt(v_data.price);
		            			v_inner += v_cart11 + v_data.id + v_cart2 + v_cart3 + v_data.url + v_cart4 + v_data.img
								+ v_cart5 + v_data.name + v_cart6 + parseInt(v_data.price).toLocaleString('ko-KR') + v_cart7;
		            			
		            			f_add(v_data);
	            			}
	            		}else if(p_rslt.count > 0 && v_datas.length <= 0){ // 유저의 cart 테이블에만 데이터가 들다면
	            			// cart 테이블의 정보를 장바구니 목록에 추가
	            			for(var i=0; i < p_rslt.data.length; i++){
			        			var v_data = p_rslt.data[i];
			        			v_rec = {};
			        			v_rec.id = v_data.cartItem;
			                    v_rec.img = v_data.cartImg; 
			                    v_rec.name = v_data.cartName; 
			                    v_rec.url = v_data.cartUrl; 
			                    v_rec.price = v_data.cartPrice; 
			        			v_recs.push(v_rec);
			        			v_totalPrice += parseInt(v_data.cartPrice);
			        			v_inner += v_cart11 + v_data.cartItem + v_cart2 + v_data.cartNo + v_cart3 + v_data.cartUrl + v_cart4 + v_data.cartImg
		        							+ v_cart5 + v_data.cartName + v_cart6 + parseInt(v_data.cartPrice).toLocaleString('ko-KR') + v_cart7;
			        		}
	            		}
	            		// 로그인했으면 localStorage 데이터를 서버 DB로 다 옮겼으니, localStorage는 비운 후 저장
            			v_datas = [];
            			localStorage.setItem(v_tblName, JSON.stringify(v_datas));
	            		
            			$("#recList").html(v_inner);
	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원")
	            	}else{ // 로그인 안했다면 localStorage 의 데이터를 가져다 넣음
	            		for(var i=0; i<v_datas.length; i++){
	            			var v_data = v_datas[i];
	            			v_rec = {};
		        			v_rec.id = v_data.id;
		                    v_rec.img = v_data.img; 
		                    v_rec.name = v_data.name; 
		                    v_rec.url = v_data.url; 
		                    v_rec.price = v_data.price; 
		        			v_recs.push(v_rec);
	            			v_totalPrice += parseInt(v_data.price);
	            			v_inner += v_cart11 + v_data.id + v_cart2 + v_data.no + v_cart3 + v_data.url + v_cart4 + v_data.img
							+ v_cart5 + v_data.name + v_cart6 + parseInt(v_data.price).toLocaleString('ko-KR') + v_cart7;
	            		}
	            		$("#recList").html(v_inner);
	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원")
	            	}
	            	
	            	var v_cpu = "";
	            	var v_main = "";
	            	var v_cooler = "";
	            	var v_case = "";
	            	var v_ssd = "";
	            	var v_hdd = "";
	            	var v_memory = "";
	            	var v_gpu = "";
	            	var v_power = "";
	            	
	            	// 희망 구매 가격의 여분이 0 이하이면 경고
	            	if(v_budget - v_totalPrice <= 0){
	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>희망구매가격이 너무 작게 설정되어있습니다.</strong></td></tr>");
	            	}else{
	            		// 현재 목록에 해당 제품이 존재하는지 보고, 존재한다면 담아줌
	            		for(var l=0; l<v_recs.length; l++){
	            			if(v_cpu == "") v_cpu = f_isHave(v_recs[l].id, "cpu");
	            			if(v_main == "") v_main = f_isHave(v_recs[l].id, "main");
	            			if(v_cooler == "") v_cooler = f_isHave(v_recs[l].id, "co");
	            			if(v_case == "") v_case = f_isHave(v_recs[l].id, "case");
	            			if(v_ssd == "") v_ssd = f_isHave(v_recs[l].id, "ssd");
	            			if(v_hdd == "") v_hdd = f_isHave(v_recs[l].id, "hdd");
	            			if(v_memory == "") v_memory = f_isHave(v_recs[l].id, "memory");
	            			if(v_gpu == "") v_gpu = f_isHave(v_recs[l].id, "gpu");
	            			if(v_power == "") v_power = f_isHave(v_recs[l].id, "po");
	            		}
	            		var v_docs = {"cpu":v_cpu, "main":v_main, "cooler":v_cooler, "case":v_case, "ssd":v_ssd,
	            						"hdd":v_hdd, "memory":v_memory, "gpu":v_gpu, "power":v_power, "budget":v_budget};
	                	$.ajax({
	        	            type:"post", 
	        	            url:'<c:url value="/data/item/rec" />',
	        	    		dataType : 'json', 
	        	            data:v_docs,
	        	            success:function(p_result){
	        	            	if(p_result.cpu){ // 추천으로 가져온 cpu가 존재할 시 목록에 추가
	        	            		v_rec = {};
				        			v_rec.id = p_result.cpu.id;
				                    v_rec.img = p_result.cpu.img; 
				                    v_rec.name = p_result.cpu.name; 
				                    v_rec.url = p_result.cpu.url; 
				                    v_rec.price = p_result.cpu.price; 
				        			v_recs.push(v_rec);
		        	            	v_inner = v_cart11 + p_result.cpu.id + v_cart2 + v_cart3 + p_result.cpu.url + v_cart4 + p_result.cpu.img
									+ v_cart5 + p_result.cpu.name + v_cart6 + parseInt(p_result.cpu.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.cpu.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_cpu){ // 목록에 cpu가 존재하지 않지만 추천으로 가져온 cpu가 존재하지 않는 경우
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 CPU가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	
	        	            	if(p_result.main){ // 추천으로 가져온 main가 존재할 시 목록에 추가
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.main.id;
				                    v_rec.img = p_result.main.img; 
				                    v_rec.name = p_result.main.name; 
				                    v_rec.url = p_result.main.url; 
				                    v_rec.price = p_result.main.price; 
				        			v_recs.push(v_rec);
	        	            		v_inner = v_cart11 + p_result.main.id + v_cart2 + v_cart3 + p_result.main.url + v_cart4 + p_result.main.img
									+ v_cart5 + p_result.main.name + v_cart6 + parseInt(p_result.main.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.main.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_main){ // 목록에 main가 존재하지 않지만 추천으로 가져온 main가 존재하지 않는 경우
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 메인보드가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	
	        	            	if(p_result.memory){ // 추천으로 가져온 memory가 존재할 시 목록에 추가
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.memory.id;
				                    v_rec.img = p_result.memory.img; 
				                    v_rec.name = p_result.memory.name; 
				                    v_rec.url = p_result.memory.url; 
				                    v_rec.price = p_result.memory.price; 
				        			v_recs.push(v_rec);
	        	            		v_inner = v_cart11 + p_result.memory.id + v_cart2 + v_cart3 + p_result.memory.url + v_cart4 + p_result.memory.img
									+ v_cart5 + p_result.memory.name + v_cart6 + parseInt(p_result.memory.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.memory.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_memory){ // 목록에 memory가 존재하지 않지만 추천으로 가져온 memory가 존재하지 않는 경우
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 메모리가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	
	        	            	if(p_result.power){ 
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.power.id;
				                    v_rec.img = p_result.power.img; 
				                    v_rec.name = p_result.power.name; 
				                    v_rec.url = p_result.power.url; 
				                    v_rec.price = p_result.power.price; 
				        			v_recs.push(v_rec);
	        	            		v_inner = v_cart11 + p_result.power.id + v_cart2 + v_cart3 + p_result.power.url + v_cart4 + p_result.power.img
									+ v_cart5 + p_result.power.name + v_cart6 + parseInt(p_result.power.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.power.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_power){ 
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 POWER가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	
	        	            	if(p_result.ssd){ 
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.ssd.id;
				                    v_rec.img = p_result.ssd.img; 
				                    v_rec.name = p_result.ssd.name; 
				                    v_rec.url = p_result.ssd.url; 
				                    v_rec.price = p_result.ssd.price; 
				        			v_recs.push(v_rec);
	        	            		v_inner = v_cart11 + p_result.ssd.id + v_cart2 + v_cart3 + p_result.ssd.url + v_cart4 + p_result.ssd.img
									+ v_cart5 + p_result.ssd.name + v_cart6 + parseInt(p_result.ssd.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.ssd.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_ssd){ 
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 SSD가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	if(p_result.hdd){ 
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.hdd.id;
				                    v_rec.img = p_result.hdd.img; 
				                    v_rec.name = p_result.hdd.name; 
				                    v_rec.url = p_result.hdd.url; 
				                    v_rec.price = p_result.hdd.price; 
				        			v_recs.push(v_rec);
	        	            		v_inner = v_cart11 + p_result.hdd.id + v_cart2 + v_cart3 + p_result.hdd.url + v_cart4 + p_result.hdd.img
									+ v_cart5 + p_result.hdd.name + v_cart6 + parseInt(p_result.hdd.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.hdd.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_hdd){ 
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 HDD가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	if(p_result.cooler){ 
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.cooler.id;
				                    v_rec.img = p_result.cooler.img; 
				                    v_rec.name = p_result.cooler.name; 
				                    v_rec.url = p_result.cooler.url; 
				                    v_rec.price = p_result.cooler.price; 
				        			v_recs.push(v_rec);
	        	            		v_inner = v_cart11 + p_result.cooler.id + v_cart2 + v_cart3 + p_result.cooler.url + v_cart4 + p_result.cooler.img
									+ v_cart5 + p_result.cooler.name + v_cart6 + parseInt(p_result.cooler.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.cooler.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_cooler){ 
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 COOLER가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	if(p_result.cases){ 
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.cases.id;
				                    v_rec.img = p_result.cases.img; 
				                    v_rec.name = p_result.cases.name; 
				                    v_rec.url = p_result.cases.url; 
				                    v_rec.price = p_result.cases.price; 
				        			v_recs.push(v_rec);
				        			console.log(v_recs);
	        	            		v_inner = v_cart11 + p_result.cases.id + v_cart2 + v_cart3 + p_result.cases.url + v_cart4 + p_result.cases.img
									+ v_cart5 + p_result.cases.name + v_cart6 + parseInt(p_result.cases.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.cases.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_case){ 
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 CASE가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	if(p_result.gpu){ 
	        	            		v_rec = {};
	        	            		v_rec.id = p_result.gpu.id;
				                    v_rec.img = p_result.gpu.img; 
				                    v_rec.name = p_result.gpu.name; 
				                    v_rec.url = p_result.gpu.url; 
				                    v_rec.price = p_result.gpu.price; 
				        			v_recs.push(v_rec);
	        	            		v_inner = v_cart11 + p_result.gpu.id + v_cart2 + v_cart3 + p_result.gpu.url + v_cart4 + p_result.gpu.img
									+ v_cart5 + p_result.gpu.name + v_cart6 + parseInt(p_result.gpu.price).toLocaleString('ko-KR') + v_cart7;
		        	            	v_totalPrice += parseInt(p_result.gpu.price);
		        	            	$("#recList").html($("#recList").html() + v_inner);
		    	         			$('#toPrice').html(v_totalPrice.toLocaleString('ko-KR') + " 원");
	        	            	}else if(!v_gpu){ 
	        	            		$("#recList").html($("#recList").html()+"<tr><td><strong style='font-size:18px'>조건에 맞는 그래픽카드가 존재하지 않습니다.</strong></td></tr>");
	        	            	}
	        	            	f_del2();
	        	            }
	        				, error : function(req, st, err) {
	        					console.log('----------------------------');
	        					console.log('request', req);
	        					console.log('status', st);
	        					console.log('errors', err);
	        					console.log('----------------------------');
	        				}
	        	        });
	            	}
	            }
				, error : function(req, st, err) {
					console.log('----------------------------');
					console.log('request', req);
					console.log('status', st);
					console.log('errors', err);
					console.log('----------------------------');
				}
        	});
		});
		
		// 하단 광고 삼형제
		// v_ad1 은 상품 url 입력받기 전까지
		var v_ad1 = "<div class='col-md-12 col-lg-4'><div class='card shadow eq-card mb-6'><div class='card-body mb-n3'><div class='row items-align-baseline h-100'><div class='col-md-6 my-3'><a target='_blank' id='ads-url' href='";
		// v_ad2 는 상품 id 입력받기 전까지
		var v_ad2 = "'><input type='hidden' id='ads-id' value='";
		// v_ad3 은 이미지 src 입력받기 전까지
		var v_ad3 = "'><img style='width: 150px; height: 150px' id='ads-img' alt='' src='";
		// v_ad4 은 상품 url 입력받기 전까지
		var v_ad4 = "'></a></div><div class='col-md-6 my-4'><a target='_blank' href='";
		// v_ad5 는 상품명 입력받기 전
		var v_ad5 = "'><p class='mb-0'><strong class='mb-0 text-uppercase text-muted'></strong></p><h3 id='ads-name'>";
		// v_ad6 는 상품 간략 설명 입력받기 전
		var v_ad6 = "</h3><p class='text-muted'>";
		// v_ad7 는 상품 가격 입력받기 전
		var v_ad7 = "</p></a></div><div class='col-md-6 border-top py-3'><p class='mb-1'><strong class='text-muted'>가격</strong></p><h4 class='mb-0' id='ads-price'>";
		// v_ad8 는 하부 껍데기
		var v_ad8 = "</h4></div><div class='col-md-6 border-top py-3'><button type='button' id='btn_addCart' class='btn mb-2 btn-outline-primary' style='position:relative; float: right; top: 10px;'>담기</button></div></div></div></div></div>";
        
    	$.ajax({
            type:"post", 
            url:'<c:url value="/data/ads/" />',
    		dataType : 'json', 
            data:"link=${link }&curPage=${searchVO.totalPageCount }&searchAlign=${searchVO.searchAlign}&searchWord=${searchVO.searchWord }",
            success:function(p_ads){
	                for(var i = 0; i < 3; i++){
	                	if(i == 0){
	        	        	$('#ads').html($('#ads').html()+ v_ad1 + p_ads.adsCpu.url + v_ad2 + p_ads.adsCpu.id + v_ad3 + p_ads.adsCpu.img + 
	        	        			v_ad4 + p_ads.adsCpu.url + v_ad5 + p_ads.adsCpu.name + v_ad6 + p_ads.adsCpu.name + "/" + 
	        	        			p_ads.adsCpu.year + v_ad7 + p_ads.adsCpu.price.toLocaleString('ko-KR') + " 원" + v_ad8);
	                	}else if(i == 1){
	        	        	$('#ads').html($('#ads').html()+ v_ad1 + p_ads.adsGpu.url + v_ad2 + p_ads.adsGpu.id + v_ad3 + p_ads.adsGpu.img +
	        	        			v_ad4 + p_ads.adsGpu.url + v_ad5 + p_ads.adsGpu.name + v_ad6 + p_ads.adsGpu.name + "/" + 
	        	        			p_ads.adsGpu.year + v_ad7 + p_ads.adsGpu.price.toLocaleString('ko-KR') + " 원" + v_ad8);
	                	}else{
	        	        	$('#ads').html($('#ads').html()+ v_ad1 + p_ads.adsMain.url + v_ad2 + p_ads.adsMain.id + v_ad3 + p_ads.adsMain.img +
	        	        			v_ad4 + p_ads.adsMain.url + v_ad5 + p_ads.adsMain.name + v_ad6 + p_ads.adsMain.name + "/" + 
	        	        			p_ads.adsMain.year + v_ad7 + p_ads.adsMain.price.toLocaleString('ko-KR') + " 원" + v_ad8);
	                	}
	                	f_addCart();
	                }
            }
            , error : function(req, st, err) {
				console.log('----------------------------');
				console.log('request', req);
				console.log('status', st);
				console.log('errors', err);
				console.log('----------------------------');
			}
    	});

    	// 광고 칸에 있는 제품을 장바구니에 넣기
    	function f_addCart(){
        	var v_addBtns = document.querySelectorAll("#btn_addCart");
        	for(var h=0; h<v_addBtns.length; h++){
        		v_addBtns[h].onclick = function(){
        			var v_adsId = $(this).closest(".card-body").find('#ads-id').val();
        			var v_adsPrice = $(this).closest(".card-body").find('#ads-price').html().replace("원", "").replaceAll(",","").replaceAll("판매준비", "0");
        			var v_adsName = $(this).closest(".card-body").find('#ads-name').html();
        			var v_adsUrl = $(this).closest(".card-body").find('#ads-url').attr('href');
        			var v_adsImg = $(this).closest(".card-body").find('#ads-img').attr('src');
        			
                    var v_adData = {};
                    v_adData.id = v_adsId;
                    v_adData.img = v_adsImg; 
                    v_adData.name = v_adsName; 
                    v_adData.url = v_adsUrl; 
                    v_adData.price = v_adsPrice;
                    
            		// 장바구니 목록 innerHTML 에 들어가는 부분
            		var v_inner = v_cart1 + v_adsId + v_cart2 + f_add(v_adData) + v_cart3 + v_adsUrl + v_cart4 + v_adsImg + v_cart5 + v_adsName 
                    				+ v_cart6 + parseInt(v_adsPrice).toLocaleString('ko-KR') + v_cart7;
                    
                    $('#cartTr').html($('#cartTr').html() + v_inner);
                    
    				// 총액을 불러다 숫자로 변환 후 금액을 더함
                	var v_total = parseInt($('#totalPrice').html().replace("원", "").replaceAll(",","").replace(" ",""));
                	var v_sum = v_total + parseInt(v_adsPrice);
                	
                	// 더한 금액을 문자열로 변환한 후 적용
                	var v_sumStr = v_sum.toLocaleString('ko-KR') + " 원";
                	$('#totalPrice').html(v_sumStr);
                    
                    
                    f_del();
        		}
    		}
    	}
    	
    	$("#btn-buy").click(function(){
    		location.replace("/data/cart/buy");
    	});
    	
    	// 추천 목록을 장바구니에 담기
    	function f_buy(){
			$.ajax({
	            type:"post", 
	            url:'<c:url value="/data/cart/allDel" />',
	            data:"cartNo=", // post로 전송시 쓰임
	            success:function(p_rslt){
	    			v_datas = v_recs;
	    			localStorage.setItem(v_tblName, JSON.stringify(v_datas));
	        		location.reload();
	            }
				, error : function(req, st, err) {
					console.log('----------------------------');
					console.log('request', req);
					console.log('status', st);
					console.log('errors', err);
					console.log('----------------------------');
				}	
	        });
    	}


	</script>