<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<nav class="topnav navbar navbar-light" style="float:right;">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="light">
              <i class="fe fe-sun fe-16"></i>
            </a>
          </li>
          <c:if test="${sessionScope.USER_INFO eq null }">
          	<li class="nav-item nav-notif" style="display:none;">
	          <a class="nav-link text-muted my-2" href="./#" id="loadBox" data-toggle="modal" data-target=".modal-notif">
	            <span class="fe fe-bell fe-16"></span>
	          </a>
	        </li>
          	<li class="nav-item">
	            <a class="nav-link text-muted my-2" href="/join/join">
	              	<span class="fe fe-user-plus fe-16"></span>&nbsp;회원가입 
	            </a>
	         </li>
	         <li class="nav-item">
	            <a class="nav-link text-muted my-2" href="/login/login">
	              	<span class="fe fe-log-in fe-16"></span>&nbsp;로그인
	            </a>
	         </li>
          </c:if>
          <c:if test="${sessionScope.USER_INFO ne null }">
	          <li class="nav-item">
	            <a class="nav-link text-muted my-2" href="/data/cart/buy">
	              <span class="fe fe-shopping-cart fe-16"></span>
	            </a>
	          </li>
	          <li class="nav-item nav-notif" style="display:none;">
	            <a class="nav-link text-muted my-2" href="./#" id="loadBox" data-toggle="modal" data-target=".modal-notif">
	              <span class="fe fe-bell fe-16"></span>
	            </a>
	          </li>
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle text-muted pr-0" style="padding-top:15px;" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	              <span class="sm mt-2">환영합니다 ${USER_INFO.userId} 님 </span>
	            </a>
	            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
	              <a class="dropdown-item" href="/member/mypage">마이페이지</a>
	              <a class="dropdown-item" href="/jgo/myList">내 글</a>
	              <a class="dropdown-item" href="/qna/myList">문의내역</a>
	              <a class="dropdown-item" href="/login/logout">로그아웃 <span class="fe fe-23 fe-log-out"></span></a>
	            </div>
	          </li>
          </c:if>
        </ul>
      </nav>
      <aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
          <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light d-print">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="/">
              <svg version="1.1" id="logo" class="navbar-brand-img brand-sm" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
                <g>
                  <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
                  <polygon class="st0" points="96,69 33,69 42,51 105,51 	" />
                  <polygon class="st0" points="78,33 15,33 24,15 87,15 	" />
                </g>
              </svg>
            </a>
          </div>
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item  w-100">
              <a href="/" class="nav-link">
                <i class="fe fe-home fe-16"></i>
                <span class="ml-3 item-text">Home</span>
              </a>
            </li>
          </ul>
          <p class="text-muted nav-heading mt-4 mb-1">
            <span>Menu</span>
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="#ui-elements" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-box fe-16"></i>
                <span class="ml-3 item-text">PC 주요부품</span>
              </a>
              <ul class="list-unstyled pl-4 w-100" id="ui-elements">
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/cpu"><span class="ml-1 item-text">CPU</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/mainboard"><span class="ml-1 item-text">메인보드</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/memory"><span class="ml-1 item-text">메모리</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/gpu"><span class="ml-1 item-text">그래픽카드</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/ssd"><span class="ml-1 item-text">SSD</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/hdd"><span class="ml-1 item-text">HDD</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/case"><span class="ml-1 item-text">CASE</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/power"><span class="ml-1 item-text">POWER</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/data/cooler"><span class="ml-1 item-text">COOLER</span></a>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a href="#forms" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-credit-card fe-16"></i>
                <span class="ml-3 item-text">게시판</span>
              </a>
              <ul class="list-unstyled pl-4 w-100" id="forms">
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/qna/list"><span class="ml-1 item-text">Q&A 게시판</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="/jgo/list"><span class="ml-1 item-text">중고장터</span></a>
                </li>
              </ul>
            </li>
            <c:if test="${sessionScope.USER_INFO eq null }">
	            <ul class="navbar-nav flex-fill w-100 mb-2">
		            <li class="nav-item  w-100">
		              <a href="/join/join" class="nav-link">
		                <i class="fe fe-user-plus fe-16"></i>
		                <span class="ml-3 item-text">회원가입</span>
		              </a>
		            </li>
		          </ul>
		          <ul class="navbar-nav flex-fill w-100 mb-2">
		            <li class="nav-item  w-100">
		              <a href="/login/login" class="nav-link">
		                <i class="fe fe-log-in fe-16"></i>
		                <span class="ml-3 item-text">로그인</span>
		              </a>
		            </li>
		          </ul>  
         	</c:if>
            <c:if test="${sessionScope.USER_INFO ne null }">
	            <li class="nav-item dropdown">
	              <a href="#profile" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
	                <i class="fe fe-user fe-16"></i>
	                <span class="ml-3 item-text">마이페이지</span>
	              </a>
	              <ul class="list-unstyled pl-4 w-100" id="profile">
	                <a class="nav-link pl-3" href="/member/mypage"><span class="ml-1">내정보</span></a>
	                <a class="nav-link pl-3" href="/data/cart/history"><span class="ml-1">구매내역</span></a>
	                <a class="nav-link pl-3" href="/login/logout"><span class="ml-1">로그아웃</span></a>
	              </ul>
	            </li>
            </c:if>
           </ul>
        </nav>
      </aside>
		
 