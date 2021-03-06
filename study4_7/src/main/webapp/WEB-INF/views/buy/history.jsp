<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="list" tagdir="/WEB-INF/tags/list"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main role="main" class="main-content" style="clear: both;">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-12">

				<div class="row align-items-center mb-2">

					<div class="col">
						<h2 class="h5 page-title">구매 내역</h2>
					</div>
					<div class="col-auto">
						<form class="form-inline" action="/excel/download" method="get">
							<div class="form-group d-none d-lg-inline">
						       <button class="btn mb-2 btn-success" type="submit">구매내역.xlsx</button>
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
								<div class="accordion w-100" id="accordion1">

									<c:forEach items="${dateList }" var="date" varStatus="var">
										<div class="card shadow">
											<div class="card-header" id="heading1">
												<a role="button" href='#collapse${var.count }' data-toggle="collapse" data-target='#collapse${var.count }' aria-expanded="false" aria-controls="collapse${var.count }"> 
													<strong id='itemName' style='font-size: 18px'>구매날짜: ${date }</strong>
												</a>
											</div>
											<c:if test="${var.first }">
												<div id='collapse${var.count }' class="collapse show" aria-labelledby="heading${var.count }" data-parent="#accordion1">
											</c:if>
											<c:if test="${var.count > 1 }">
												<div id='collapse${var.count }' class="collapse" aria-labelledby="heading${var.count }" data-parent="#accordion1">
											</c:if>
												<div class="card-body col-md-12 col-lg-12" style="margin: 0">
													<table class="table table-borderless table-hover">
														<thead>
															<tr>
																<th></th>
																<th></th>
																<th></th>
																<th></th>
																<th></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${orderList }" var="item">
																<c:if test="${date eq item.cartDate}">
																	<tr>
																		<td style='width: 50px;'></td>
																		<td style='width: 100px;'>
																			<div class='avatar avatar-md' style='width: 150px;'>
																				<a href="${item.cartUrl }" target='_blank'> <img id='itemImg' src='${item.cartImg}' alt='...' class='avatar-img rounded-circle'>
																				</a>
																			</div>
																		</td>
																		<td style='width: 400px;'><a href="${item.cartUrl }" target='_blank'>
																				<p class='mb-0 text-muted'>
																					<strong id='itemName' style='font-size: 18px'>${item.cartName}</strong>
																				</p>
																		</a></td>

																		<td style='width: 200px;'>
																			<p class='mb-0 text-muted'>
																				<strong style='font-size: 20px' id='itemPrice'> 
																				<c:if test="${item.cartPrice eq 0 }">판매준비</c:if> 
																				<c:if test="${item.cartPrice ne 0 }">
																						<fmt:formatNumber value="${item.cartPrice }" pattern="###,###,###" />원
																				</c:if>
																				</strong>
																			</p>
																		</td>

																		<td style='width: 200px;'><strong style='font-size: 20px' id='itemState'>배송준비중</strong></td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
								<!-- .card-body -->
							</div>
							<!-- .card-shadow -->
						</div>
						<!-- end-table container -->
					</div><!-- col-12 end -->
				</div><!-- row end -->
			</div><!-- col-12 end -->
		</div><!-- row end -->
	</div><!-- container-end -->
</main><!-- main -->

<script type="text/javascript">
	
</script>