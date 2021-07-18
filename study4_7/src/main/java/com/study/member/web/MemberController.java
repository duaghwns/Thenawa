package com.study.member.web;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.common.valid.Modify;
import com.study.common.valid.Password;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.service.MailSendService;
import com.study.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Inject
	IMemberService memberService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/member/mypage")
	public String mypage(HttpServletRequest req, HttpServletResponse resp){
		HttpSession session = req.getSession();
		UserVO user=(UserVO) session.getAttribute("USER_INFO");
		try{
			MemberVO member=memberService.getMember(user.getUserId());
			req.setAttribute("member", member);
		}catch (BizNotFoundException e) {
			return "redirect:/";
		}
		return "member/mypage";
	}
	
	@GetMapping("/member/edit")
	public String getEdit(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		UserVO user=(UserVO) session.getAttribute("USER_INFO"); 
		try{
			MemberVO member=memberService.getMember(user.getUserId());
			req.setAttribute("member", member);
		}catch (BizNotFoundException e) {
			return "redirect:/";
		}
		return "member/edit";
	}
	
	@PostMapping("/member/edit")
	public String memberEdit(@ModelAttribute("member") @Validated({Modify.class}) MemberVO member
			, BindingResult error
			, Model model) {
		
		logger.info("memberVO={}",member);
		
		if(error.hasErrors()) {
			logger.info("validation 검증실패={}",error);
			return "member/edit";
		}
		
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		
		try {
			memberService.updateMember(member);
			resultMessageVO.setMessage("수정 성공");
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("수정 성공여부");
			resultMessageVO.setUrl("/member/mypage");
			resultMessageVO.setUrlTitle("마이페이지로");
		} catch (BizNotFoundException e) {
			resultMessageVO.setMessage("수정실패 ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("수정 성공여부");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setMessage("수정실패 ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("수정 성공여부");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
	@GetMapping("/member/passedit")
	public String getPassEdit(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		UserVO user=(UserVO) session.getAttribute("USER_INFO"); 
		try{
			MemberVO member=memberService.getMember(user.getUserId());
			req.setAttribute("member", member);
		}catch (BizNotFoundException e) {
			return "redirect:/";
		}
		return "member/passedit";
	}
	
	@PostMapping("/member/passedit")
	public String memberPassEdit(@ModelAttribute("member") @Validated({Password.class}) MemberVO member
			, BindingResult error
			, Model model) {
		
		logger.info("memberVO={}",member);
		
		if(error.hasErrors()) {
			logger.info("validation 검증실패={}",error);
			return "member/passedit";
		}
		
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		
		try {
			memberService.updatePass(member);
			resultMessageVO.setMessage("수정 성공");
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("비밀번호 수정 성공여부");
			resultMessageVO.setUrl("/member/mypage");
			resultMessageVO.setUrlTitle("마이페이지로");
		} catch (BizNotFoundException e) {
			resultMessageVO.setMessage("수정실패 ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("비밀번호 수정 성공여부");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setMessage("수정실패 ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("수정 성공여부");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
	@PostMapping("/member/delete") 
	public String memberDelete(@ModelAttribute("member") MemberVO member, Model model, HttpServletRequest req, HttpServletResponse resp) {
		logger.info("memberVO={}",member);
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		try {
			memberService.deleteMember(member.getMemId());
			
			//회원삭제와 함께 USER_INFO 세션 제거(자동 로그아웃)
			HttpSession session=req.getSession();
			session.removeAttribute("USER_INFO");
			
			resultMessageVO.setMessage("삭제 성공");
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("삭제성공여부");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setMessage("삭제 실패 ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("삭제성공여부");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return  "common/message";
	}
	
	@Inject
	MailSendService mss;
	
	//이메일 인증 아작스 요청 받는 메소드
	//@ResponseBody 해주고 이 메소드에서 MailSendService의
	//sendAuthmail호출
	
    @RequestMapping(value="/member/email")
    @ResponseBody public String email(@RequestParam("email")String
    email,HttpServletRequest req) { return mss.sendAuthMail(email,
    req.getServerName(), req.getServerPort()); //실제로 url,port 쓰는건 좀 더 다양한 기능
	}
	

}
