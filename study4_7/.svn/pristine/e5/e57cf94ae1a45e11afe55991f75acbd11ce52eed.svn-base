package com.study.login.web;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.common.util.CookieUtils;
import com.study.common.valid.Newpass;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.login.service.ILoginService;
import com.study.login.vo.UserVO;
import com.study.member.vo.MemberVO;

@Controller
public class LoginController {
	
	@Inject
	ILoginService loginService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@GetMapping("/login/login")
	public String getLogin() {
		return "login/login";
	}
	 
	@PostMapping("/login/login")
	public String postLogin(@RequestParam(value = "userId", required = false) String id,
			@RequestParam(value = "userPass", required = false) String pw,
			@RequestParam(value = "rememberMe", required = false) String save_id, HttpServletRequest req,
			HttpServletResponse resp) throws Exception  {
		
		//id 기억하기를 체크 안했을때
		if (save_id == null) {	
			CookieUtils cookieUtils = new CookieUtils(req);
			if (cookieUtils.exists("SAVE_ID")) {//쿠키에 SAVE_ID가 있으면 같은이름으로 쿠키 수명을 0으로 쿠키생성
				Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
				resp.addCookie(cookie); //저장되어있던 쿠키삭제
			}
			save_id = "";
		}
		
		//id기억하기가 체크되서 넘어왔을때
		if (save_id.equals("Y")) {
			//SAVE_ID라는 이름으로 id값을 넣어주고 패스는 / 7일동안유지되는 쿠키생성해서 쿠키추가
			resp.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
		}
		
		// id나 패스워드가 넘어오지않으면 
		if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {
			// 리다이렉트로 로그인페이지로보냄.
			return "redirect:/login/login?msg=" + URLEncoder.encode("입력안함", "utf-8");
		}
		
		try {// 정상적으로 id와 패스워드가 다 넘어오면 
			//세션에 USER_INFO라는 이름으로 id,name,password 저장 후 홈으로 이동
			//1800초 동안 요청이 없으면 세션이 제거됨
			UserVO user = loginService.loginCheck(id, pw);
			HttpSession session = req.getSession();
			session.setAttribute("USER_INFO", user);
			session.setMaxInactiveInterval(1800);

			return "redirect:/";
			
		} catch (BizNotFoundException e) {//loginCheck중 에러가 나면 로그인페이지로 리다이렉트
			return "redirect:/login/login?msg=" + URLEncoder.encode("아이디 또는 비번을 확인해주세요", "utf-8");
		} catch (BizPasswordNotMatchedException e) {
			return "redirect:/login/login?msg=" + URLEncoder.encode("아이디 또는 비번을 확인해주세요", "utf-8");
		}
	}
	
		//로그아웃주소로 요청이오면 USER_INFO 세션제거
		@RequestMapping("/login/logout")
		public String logout(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			HttpSession session=req.getSession();
			session.removeAttribute("USER_INFO");
			return "redirect:/";
		}
		
		//아이디 찾기
		@RequestMapping("/login/findId")
		public String findId() {		
			return "login/findId";
		}
		
		@PostMapping("/login/findId")
		public String postFindId(@ModelAttribute("member")MemberVO member, Model model) {
			
			logger.info("memberVO={}",member);
			
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			
			try {
				MemberVO user = loginService.findId(member);
				model.addAttribute("user", user);
			} catch (BizNotFoundException e) {
				resultMessageVO.setMessage("입력하신 정보에 맞는 멤버를 찾을 수 없습니다.");
				resultMessageVO.setResult(false);
				resultMessageVO.setTitle("아이디 찾기");
				
				model.addAttribute("resultMessageVO", resultMessageVO);
				return "common/message";
			}
			return "login/printId";
		}
		
		//비밀번호 찾기
		@RequestMapping("/login/findPw")
		public String findPw() {		
			return "login/findPw";
		}
		
		@PostMapping("/login/findPw")
		public String postFindPw(@ModelAttribute("member")MemberVO member, Model model) {
			
			logger.info("memberVO={}",member);
			
			ResultMessageVO resultMessageVO = new ResultMessageVO();
			
			try {
				MemberVO user = loginService.findPw(member);
				model.addAttribute("user", user);
			} catch (BizNotFoundException e) {
				resultMessageVO.setMessage("입력하신 정보에 맞는 멤버를 찾을 수 없습니다.");
				resultMessageVO.setResult(false);
				resultMessageVO.setTitle("비밀번호 찾기");
				
				model.addAttribute("resultMessageVO", resultMessageVO);
				return "common/message";
			}
			return "login/newPass";
		}
		
		@PostMapping("/login/newPass")
		public String newPass(@ModelAttribute("member") @Validated({Newpass.class}) MemberVO member
				, BindingResult error
				, Model model) {
			
			logger.info("memberVO={}",member);
			
			if(error.hasErrors()) {
				logger.info("validation 검증실패={}",error);
				return "login/newPass";
			}
			
			ResultMessageVO resultMessageVO=new ResultMessageVO();
			
			try {
				loginService.updatePass(member);
				resultMessageVO.setMessage("수정 성공");
				resultMessageVO.setResult(true);
				resultMessageVO.setTitle("비밀번호 수정 성공여부");
				resultMessageVO.setUrl("/login/login");
				resultMessageVO.setUrlTitle("로그인페이지");
			} catch (BizNotFoundException e) {
				resultMessageVO.setMessage("해당 멤버를 찾을수 없습니다.");
				resultMessageVO.setResult(false);
				resultMessageVO.setTitle("비밀번호 수정 성공여부");
			} catch (BizNotEffectedException e) {
				resultMessageVO.setMessage("비밀번호 업데이트 실패");
				resultMessageVO.setResult(false);
				resultMessageVO.setTitle("수정 성공여부");
			}
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}

}
