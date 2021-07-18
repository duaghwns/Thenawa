<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<main role="main" class="main-content" style="clear:both;">
	<div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
              <h2 class="h3 mb-4 page-title">Mypage</h2>
              <hr>
              <div class="my-4">
                <form action="delete" method="post">
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
                      <input type="text" id="memName" name="memName" class="form-control" value="${member.memName }" readonly="readonly">
                    </div>
                    <div class="form-group col-md-5">
                      <label for="memId">아이디</label>
                      <input type="text" id="memId" name="memId" class="form-control" value="${member.memId }" readonly="readonly">
                    </div>
                    <div class="form-group col-md-2">
                      <label for="memSex">성별</label>
                      <input type="text" id="memSex" name="memSex" class="form-control" value="${member.memSex }" readonly="readonly">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="memBir">생일</label>
                    <input type="date" class="form-control" id="memBir" name="memBir" value="${member.memBir }" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="memHp">핸드폰번호</label>
                    <input type="text" class="form-control" id="memHp" name="memHp" value="${member.memHp }" readonly="readonly">
                  </div>
                  <div class="form-group">
                    <label for="memMail">이메일</label>
                    <input type="email" class="form-control" id="memMail" name="memMail" value="${member.memMail }" readonly="readonly">
                  </div>
                  <div class="form-row">
	                  <div class="form-group col-md-6">
	                    <label for="memAdd1">주소</label>
	                    <input type="text" class="form-control" id="memAdd1" name="memAdd1" value="${member.memAdd1 }" readonly="readonly">
	                  </div>
	                  <div class="form-group col-md-4">
	                  	<label for="memAdd2">상세주소</label>
	                  	<input type="text" class="form-control" id="memAdd2" name="memAdd2" value="${member.memAdd2 }" readonly="readonly">
	                  </div>
	                  <div class="form-group col-md-2">
	                  	<label for="memZip">우편번호</label>
	                  	<input type="text" class="form-control" id="memZip" name="memZip" value="${member.memZip }" readonly="readonly">
	                  </div>
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="memRegDate">가입일</label>
                      <input type="date" class="form-control" id="memRegDate" value="${member.memRegDate }" readonly="readonly">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="memMileage">마일리지</label>
                      <input type="text" class="form-control" id="memMileage" value="${member.memMileage }" readonly="readonly">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="memPurpose">PC 사용목적</label>
                    <input type="text" class="form-control" id="memPurpose" name="memPurpose" value="${member.memPurpose }" readonly="readonly">
                  </div>
                  <hr class="my-4">
                  <button type="button" class="btn btn-primary" onclick="location.href='/member/edit'">정보 수정</button>
                  <button type="submit" class="btn btn-primary">탈퇴</button>
                </form>
              </div> <!-- /.card-body -->
            </div> <!-- /.col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
    </main> <!-- main -->