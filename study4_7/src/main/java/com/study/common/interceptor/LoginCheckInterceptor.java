package com.study.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session에 userInfo가 있나 없나 비교
		HttpSession session = request.getSession(false);
		String XRequested = request.getHeader("X-Requested-With"); // ajax로 요청한거냐 아니냐
		if (session == null) {
			if (XRequested == null) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN); // 403
				return false;
			} else {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED); // 401 인증X
				return false;
			}
		}

		// session이 null이 아닐때
		if (session.getAttribute("USER_INFO") == null) {
			if (XRequested == null) { // 로그인, 아작스x
				response.sendRedirect(request.getContextPath() + "/login/login");
				return false;
			} else {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED); // 인증x 401
				return false;
			}
		}

		return true; // 로그인이 되어있으면
	}
}
