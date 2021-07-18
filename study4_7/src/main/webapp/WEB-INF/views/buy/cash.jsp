<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="list" tagdir="/WEB-INF/tags/list"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main role="main" class="main-content" style="clear:both;">
 	              	
	<div class="card-body bg-white mt-0 shadow col-md-8 col-lg-8">
		<p style="font-weight: bold">카카오페이 현재 사용가능</p>
		<div class="row items-align-baseline col-md-6 col-lg-6">
			결제금액 <input class="form-control" type="text" name="cp_item" value="${totalPrice }" readonly>
		</div>
		<hr>
		<div class="row items-align-baseline">
			<div class="col-md-6 col-lg-6"></div>
			<div class="col-md-2 col-lg-2"></div>
			<div class="col-md-4 col-lg-4">
				<button type="button" class="btn btn-primary btn-block" id="charge_kakao">충 전 하 기</button>
				<button type="button" class="btn btn-danger btn-block" id="btn-cancel">취 소</button>
			</div>
		</div>
	</div>
	              	
</main> <!-- main -->


<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		$("#btn-cancel").click(function(){
			location.replace("/data/cart/buy");
		});
	    $('#charge_kakao').click(function () {
	        // getter
	        var IMP = window.IMP;
	        IMP.init('imp93263756');
	        var money = $('input[name="cp_item"]').val();
	        console.log(money);
	
	        IMP.request_pay({
	            pg: 'inicis',
	            merchant_uid: 'merchant_' + new Date().getTime(),
	
	            name: '주문명 : 주문명 설정',
	            amount: money,
	            buyer_email: '${member.memMail }',
	            buyer_name: '${member.memName }',
	            buyer_tel: '${member.memHp }',
	            buyer_addr: '${member.memAdd1 } ${member.memAdd2 }',
	            buyer_postcode: '${member.memZip }'
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	                var msg = '결제가 완료되었습니다.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
	/*                 $.ajax({
	                    type: "GET", 
	                    url: "/user/mypage/charge/point", //충전 금액값을 보낼 url 설정
	                    data: {
	                        "amount" : money
	                    },
	                }); */
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	            }
	            alert(msg);
	            document.location.href="bought"; //alert창 확인 후 이동할 url 설정
	        });
	    });
	</script>