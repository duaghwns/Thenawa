<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table {
	width: 1000px;
}

a {
	text-decoration: none;
}

#content {
	margin-bottom: 100px;
}
</style>
<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="row">
					<div class="col-md-12 my-4">
						<a href="/jgo/list"><h3>
								중고장터 - <small>View</small>
							</h3></a>
					</div>
					<div class="card shadow">
						<div class="card-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th style="text-align: center;">글번호</th>
										<td>${jgo.jgNo }</td>
										<th style="text-align: center;">글제목</th>
										<td colspan="4">${jgo.jgTitle }</td>
									</tr>
									<tr>
										<th style="text-align: center;">상품명</th>
										<td>${jgo.jgItemName }</td>
										<th style="text-align: center;">가격</th>
										<td>${jgo.itemPrice }원</td>
										<th style="text-align: center;">조회수</th>
										<td>${jgo.jgHit }</td>
									</tr>
									<tr>
										<th style="text-align: center;">작성자명</th>
										<td>${jgo.jgWriter }</td>
										<th style="text-align: center;">판매상태</th>
										<td colspan="3">${jgo.sales }</td>
									</tr>
									<tr>
										<th style="text-align: center;">내용</th>
										<td colspan="6"><c:if test="${jgo.itemImgNewName != NULL }"><img src="/profile${jgo.itemImgNewName}" /></c:if>
										<div id="content" style="white-space: pre;">
												<br> <br> <br> ${jgo.jgContent }
											</div></td>
									</tr>
									<tr>
										<td>
											<div class="pull-left">
												<a href="list" class="btn btn-default btn-sm"> <span
													class="glyphicon glyphicon-list" aria-hidden="true"></span>
													&nbsp;&nbsp;목록
												</a>
											</div>
											<div class="pull-right">
											<c:if test="${jgo.jgWriter eq sessionScope.USER_INFO.userName}">
												<a href="edit?jgNo=${jgo.jgNo }"
													class="btn btn-success btn-sm"> <span
													class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													&nbsp;&nbsp;수정
												</a>
											</c:if>
											</div>
											
										</td>
										<th>최근등록일자</th>
										<td colspan="5">${jgo.jgModDate eq null ? jgo.jgRegDate : jgo.jgModDate}</td>
									</tr>
								</tbody>
							</table>

							<table class="table table-striped table-bordered">
								<tr>
									<td colspan="2"><br>
									<br>
										<hr> <br> <!-- // START : 댓글 등록 영역  -->
										<form name="frm_reply"
											action="<c:url value='/reply/replyRegist' />" method="post"
											onclick="return false;">
											<input type="hidden" name="reParentNo" value="${jgo.jgNo}">
											<input type="hidden" name="reCategory" value="jgo">
											<div class="form-group row">
												<label class="col-sm-2  control-label">댓글</label>
												<div class="col-sm-8">
													<textarea rows="3" name="reContent" class="form-control"></textarea>
												</div>
												<div class="col-sm-2">
													<button id="btn_reply_regist" type="button"
														class="btn btn-sm btn-info">등록</button>
												</div>
											</div>
										</form> <!-- // END : 댓글 등록 영역  --> <!-- // START : 댓글 목록 영역  -->
										<div id="id_reply_list_area"></div>
										<div class="row text-center" id="id_reply_list_more">
											<a id="btn_reply_list_more"
												class="btn btn-sm btn-default col-sm-10 col-sm-offset-1">
												<span class="glyphicon glyphicon-chevron-down"
												aria-hidden="true"></span> 더보기
											</a>
										</div> <!-- // END : 댓글 목록 영역  --> <!-- START : 댓글 수정용 Modal -->
										<div class="modal fade" id="id_reply_edit_modal" role="dialog"
											love="malja">
											<div class="modal-dialog">
												<!-- Modal content-->
												<div class="modal-content">
													<form name="frm_reply_edit"
														action="<c:url value='/reply/replyModify' />"
														method="post" onclick="return false;">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">×</button>
															<h4 class="modal-title">댓글수정</h4>
														</div>
														<div class="modal-body">
															<input type="hidden" name="reNo" data-re-no="">
															<textarea rows="3" name="reContent" class="form-control"></textarea>
														</div>
														<div class="modal-footer">
															<button id="btn_reply_modify" type="button"
																class="btn btn-sm btn-info">저장</button>
															<button type="button" class="btn btn-default btn-sm"
																data-dismiss="modal">닫기</button>
														</div>
													</form>
												</div>
											</div>
										</div> <!-- END : 댓글 수정용 Modal -->
										</div>
										<!-- card body -->
										</div>
										<!-- card shadow -->
										</div>
										<!-- col-md-12 my-4 -->
										</div> <!-- row -->
										</div>
										<!-- col-12 -->
										</div>
										<!-- row justify-content-center -->
										</div>
										<!-- container-fluid -->
										</main> <!-- START : 댓글 처리 스크립트 --> <script type="text/javascript">
	
// 상단에 전역변수 - 공통함수 - 이벤트 함수 - 초기화처리  
var replyParam = {"curPage":1, "rowSizePerPage":10, 
		              "reCategory":"jgo", "reParentNo":${jgo.jgNo}
                  }

// 댓글목록을 구하는 함수
function fn_reply_list(){
	
	$.ajax({ 
		  type :"POST"
		, url : '<c:url value="/reply/replyList" />' 		
		, dataType : 'json' 
		, data : replyParam	
		, success : function(data) {
				console.log('data', data);
				if(data.result){				
					// find : (.+)   repl : str += '$1';
					$reply_list_area = $('#id_reply_list_area');
					$.each(data.data, function(i, el) {    
						console.log(i, el)	//el이 replyVO하고 reply.xml 한번 직접 작성해보세요.
						
						var str = '<div class="row" data-re-no="' + el.reNo + '">';
						str += '<div class="col-sm-2 text-right">'+el.reMemId+'</div>';
						str += '<div class="col-sm-6">';
						str += '<pre>'+el.reContent+'</pre>';
						str += '</div>';
						if(el.reMeodDate!=null){
							str += '<div class="col-sm-2">'+el.reModDate+'</div>';
						}else{
							str += '<div class="col-sm-2">'+el.reRegDate+'</div>';
						}
						str += '<div class="col-sm-2">';
						//수정 삭제 버튼은 로그인했을 때
						//세션에 있는 내 아이디랑 작성했을 때 저장된
						//댓글의 작성자 ID랑 같을 때만 el 직접 문자열로.
						if(el.reMemId == '${sessionScope.USER_INFO.userId}'){							
							str += '<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info">수정</button>';
							str += '<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger">삭제</button>';
						}
						str += '</div>';
						str += '</div>';
						$reply_list_area.append(str); //id_reply_list_area영역에  추가 
					});
					replyParam.curPage += 1;
					// 더보기 버튼 처리  
					if(data.count < replyParam.rowSizePerPage ){
						$('#btn_reply_list_more').hide();
					}
				}
		  }  
		, error : function(req, st, err) {
				console.log('----------------------------');
				console.log('request', req);
				console.log('status', st);
				console.log('errors', err);
				console.log('----------------------------');
			}	 	
	}); // ajax
} // fn_reply_list

$(document).ready(function() {
	
	// 수정버튼 클릭
	$('#id_reply_list_area').on('click','button[name=btn_reply_edit]',function(e){
		// 모달창 띄우기 , 현재 클릭한 버튼의 영역에서 reNo, reContext 를
		// this : javascript 객체 -> jQuery 객체 $(this) 
		$btn = $(this);
		$div = $btn.closest('div.row');
		
		// 모달창 내의 폼에 복사 
		// var f = document.forms.frm_reply_edit;
	    // f.reNo.value = $div.data('re-no');
		$('form[name=frm_reply_edit] input[name=reNo]').val($div.data('re-no'));
		$('form[name=frm_reply_edit] textarea[name=reContent]').val($div.find('div pre').text());
		$('#id_reply_edit_modal').modal();
		
	}); // btn_reply_edit.click
	
	// 모달창의 (수정)저장버튼 btn_reply_modify 클릭
	$("#btn_reply_modify").click(function(e) {
		//아작스로 /reply/replyModify
		// 성공하면 
		// 예: 35 댓글 수정 성공 
		// 모달 폼에 있는 textarea 의 값을 
		// div.row[data-re-no=35] div pre  의 문자열 변경  
		// 모달 폼의 reNo, reContent 는 '' 설정
		// 모달창 $('#모달아이디').modal('hide')
		
		e.preventDefault();		// 이벤트 전파방지. 엔터 등으로 서브밋 되는 것 방지
		$btn = $(this);
		$divn = $btn.closest('div.modal_body input[name=reNo]');
		
		res = confirm("글을 수정하시겠습니까?");
		if(res){
			params = $('form[name=frm_reply_edit]').serialize();
			$.ajax({
				type :"POST" 						// 전송 방식 설정 (Defaut : GET)
			  , url : '<c:url value="/reply/replyModify" />'			// 요청 페이지 URL정보
			  , dataType : 'json'  					// 서버로부터 전달받을 데이터 유형 (html, xml, json, script)
			  , data : params						// 서버에 전송할 파라미터 정보
			  , success : function(data) {
					console.log('data',data);
					if(data.result) {
						// 서버에 정보 전송
						// 모달 창 안의 텍스트를 데이터베이스에 등록하고, 
						
						// 35번 댓글 수정을 성공했다면?
						// modal form에 있는 textarea의 값을 div.class[data-re-no=35]의 textarea에 넣기
						
						var $rn = $('form[name=frm_reply_edit] input[name=reNo]').val()
						var $rc = $('form[name=frm_reply_edit] textarea[name=reContent]').val()
						 
						$('div.row[data-re-no='+$rn+']').find('pre').text($rc)
						
						// modal form의 reNo, reContent는 ''으로 설정
						$('form[name=frm_reply_edit] input[name=reNo]').val('')
						$('form[name=frm_reply_edit] textarea[name=reContent]').val('')
						
						/* replyParam.curPage = 1;
						$('#id_reply_list_area').html('');
						fn_reply_list(); */
						
						$('#id_reply_edit_modal').modal('hide');
					} else {
						alert(data.msg);
					}
				} 		 		// 요청에 성공한 경우 호출되는 함수 (data, status, xhr )
			  , error :	function(req, st, err) {
					console.log('----------------------------------');
					console.log('request', req);
					console.log('status', st);
					console.log('errors', err);
					console.log('----------------------------------');
					if(req.status == 401) {		// 로그인이 안 되어있으면 로그인 페이지로 이동
						window.location.href = '<c:url value="/login/login.wow" />'
					}
				}			// 요청에 실패한 경우 호출되는 함수 (xhr, status, error)
			}); 	// ajax
		}
		
	}); // btn_reply_modify.click

	// 삭제버튼 클릭
	$('#id_reply_list_area').on('click','button[name=btn_reply_delete]',function(e){
		$btn = $(this);
		$div = $btn.closest('div.row');
		res = confirm("글을 삭제하시겠습니까?");
		if(res){
			params = "reNo=" + $div.data('re-no');
			$.ajax({ 
				  type :"POST"
				, url : '<c:url value="/reply/replyDelete" />' 		
				, dataType : 'json' 
				, data : params	
				, success : function(data) {
						console.log('data', data);
						if(data.result){
							$div.remove();
						}else{
							alert(data.msg);
						}
				  }  
				, error : function(req, st, err) {
						console.log('----------------------------');
						console.log('request', req);
						console.log('status', st);
						console.log('errors', err);
						console.log('----------------------------');
					}	 	
			}); // ajax			
		}  // confirm		
		
		
	}); // btn_reply_delete.click

	// 더보기 버튼 클릭
	$('#btn_reply_list_more').click(function(e) {
		fn_reply_list();
	}); // #btn_reply_list_more.click
	
	// 등록버튼 클릭
	$("#btn_reply_regist").click(function(e) {
		e.preventDefault();
		res = confirm("글을 등록하시겠습니까?");
		if(res){
			params = $('form[name=frm_reply]').serialize();
			$.ajax({ 
				  type :"POST"
				, url : '<c:url value="/reply/replyRegist" />' 		
				, dataType : 'json' 
				, data : params	
				, success : function(data) {
						console.log('data', data);
						if(data.result){
							replyParam.curPage = 1;
							document.forms.frm_reply.reContent.value = '';
							// $('from[name=frm_reply] textarea[name=reContent]').val('');							
							// 현재 목록영역 remove()
							$('#id_reply_list_area').html('');
							// 목록조회 함수 호출 
							fn_reply_list();
						}else{
							alert(data.msg);
						}
				  }  
				, error : function(req, st, err) {
						console.log('----------------------------');
						console.log('request', req);
						console.log('status', st);
						console.log('errors', err);
						console.log('----------------------------');
					}	 	
			}); // ajax			
		}  // confirm		
	}); // #btn_reply_regist.click

	// 초기화 함수 호출
	fn_reply_list();
	
}); // ready

</script> <!-- END : 댓글 처리 스크립트 -->