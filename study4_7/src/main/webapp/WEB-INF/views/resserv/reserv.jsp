<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="reservRes" method="post">
	<main role="main" class="main-content" style="clear: both;">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="row align-items-center my-3">
						<div class="col">
							<h2 class="page-title">Reservation</h2>
						</div>
					</div>
					
					<div>
						<c:forEach items="${reserv }" var="res">
							<input type="hidden" value="${res.reservTime }" class="time_db">
							<input type="hidden" value="${res.reservDate }" class="date_db">
							<input type="hidden" value="${res.reservGisa }" class="gisa_db">
						</c:forEach>
					</div>
					
					<div id='calendar'></div>
					
					<!-- new event modal -->
					<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="varyModalLabel">예약</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
	
								<div class="modal-body p-4">
									<div class="form-row">
									
										<div class="form-group col-md-6">
											<label for="date-input">Date</label>
											<div class="input-group">
												<div class="input-group-prepend">
													<div class="input-group-text" id="button-addon-date">
														<span class="fe fe-calendar fe-16"></span>
													</div>	
												</div>
												<input type="text" class="form-control drgpicker" id="txt_date" name="reservDate" readonly>
											</div>
										</div>
												
										<div class="form-group col-md-6">
											<label for="startDate">Time</label>
											<div class="input-group">
												<div class="input-group-prepend">
													<div class="input-group-text" id="button-addon-time">
														<span class="fe fe-clock fe-16"></span>
													</div>
												</div>
												<select name="reservTime" id="selTime" class="form-control time-input" required>
													<option value="">Time</option>
												</select>
											</div>
										</div>
	
										<div class="form-group col-md-12">
											<label for="eventNote" class="col-form-label">요청사항</label>
											<textarea class="form-control" name="reservReq" id="eventNote" placeholder="요청사항을 입력해주세요"></textarea>
										</div>
								
									</div>
								</div>
	
								<div class="modal-footer d-flex justify-content-center">
									<button type="submit" id="btn_submit" class="btn mb-2 btn-primary">예약하기</button>
									<button type="button" class="btn mb-2 btn-primary" data-dismiss="modal" aria-label="Close">취소</button>
								</div>
							</div>
						</div>
					</div>
					
					<input type="hidden" name="reservMem" value="${reserv }">
					<input type="hidden" id="reservGisa" name="reservGisa">
		
					<!-- Error event modal -->
					<div class="modal fade" id="eventModal_warn" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="varyModalLabel">Error</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
		
								<div class="modal-body p-4">
									<div class="form-row">
										<div class="form-group col-md-12">
											<div class="input-group">
												<h5>날짜를 잘못 선택하셨습니다.</h5>
											</div>
										</div>
									</div>
								</div>
		
								<div class="modal-footer d-flex justify-content-center">
									<button type="button" class="btn mb-2 btn-primary" data-dismiss="modal" aria-label="Close">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Error event modal -->
				
				</div>
				<!-- .col-12 -->
			</div>
			<!-- .row -->
		</div>
		<!-- .container-fluid -->
	</main>
</form>

<script>

	/** full calendar */
	var calendarEl = document.getElementById('calendar');
	if (calendarEl) {
		var calendar = new FullCalendar.Calendar(calendarEl, {
			// plugins: ['dayGrid', 'timeGrid', 'list', 'bootstrap'],
			plugins : [ 'dayGrid', 'list', 'bootstrap' ],
			//  timeZone : 'UTC',
			themeSystem : 'bootstrap',
			header : {
				left : 'today, prev, next',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			// right: 'dayGridMonth'
			},
			buttonIcons : {
				prev : 'fe-arrow-left',
				next : 'fe-arrow-right',
				prevYear : 'left-double-arrow',
				nextYear : 'right-double-arrow'
			}

		});

		calendar.render();
		
		for (i in $(".fc-day")){
			console.log(i)
		}


		// 동적 태그 이벤트
		// 달력에 클릭 이벤트
		$(document).on("click", ".fc-day", function(){
	
			// 선택한 날짜
			var v_click_date = parseInt($(this).attr('data-date').replaceAll('-', ''))
	
			// 모달창의 date value값을 클릭한 날짜로 저장
			$("#txt_date").val($(this).attr('data-date'))
			
			// 오늘 날짜
			var v_today_year = new Date().getFullYear()
			var v_today_month = new String(new Date().getMonth() + 1)
			var v_today_date = new String(new Date().getDate())
	
			if (v_today_month.length == 1) {
				v_today_month = "0" + v_today_month
			}
	
			if (v_today_date.length == 1) {
				v_today_date = "0" + v_today_date
			}
	
			var v_today = parseInt(v_today_year + v_today_month + v_today_date)
	
			// 오늘 이전의 날짜 클릭시 다시 선택하도록
			if (v_click_date >= v_today) {
				$("#eventModal").modal()
			} else {
				$('#eventModal_warn').modal()
			}
	
			var v_time = [ "09:00~10:00", "11:00~12:00", "13:00~14:00", "15:00~16:00", "17:00~18:00", "19:00~20:00" ]
			var v_gisa = ["gisa_1", "gisa_2", "gisa_3", "gisa_4", "gisa_5", "gisa_6"];
	
			// 예약 시간 옵션 셀렉트박스에 추가
			$("#selTime").html('<option value="none">Time</option>');
			for (var i = 0; i < v_time.length; i++){
				$("#selTime").append('<option id="sel_opt" value=' + v_time[i] + '>' + v_time[i]);
			}
			
			// 예약기사 기본으로 gisa_1로 세팅
			$("#reservGisa").val(v_gisa[0]);
			
			// 시간 선택 시
			$("#selTime").change(function(){
				for (var i = 0; i < $(".gisa_db").length; i++){
					var v_dateDB = $(".date_db")[i].value;
					var v_dateSel = $(".form-control").val();
					var v_timeDB = $(".time_db")[i].value;
					var v_timeSel = $(this).val();
	
					if(v_dateDB == v_dateSel && v_timeDB == v_timeSel){
						// 선택한 날짜, 시간에 따른 기사 조회							
						if(v_gisa.indexOf($(".gisa_db")[i].value) != -1){
							var idx = v_gisa.indexOf($(".gisa_db")[i].value);
							v_gisa.splice(idx, 1);
	
							// 선택한 시간대에 예약이 꽉 차있을시
							if(v_gisa.length == 0){
								$('#selTime option:selected').prop('hidden', true);
								alert("해당 시간은 예약할 수 없습니다");
								$("#selTime").val("none").prop("selected",true);
								return;
							}
							// $("#reservGisa").val(v_gisa[0]);
						}
					}
				}
			});
		});
	
	}
	
	
</script>

