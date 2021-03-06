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
			logger.info("validation ????????????={}",error);
			return "member/edit";
		}
		
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		
		try {
			memberService.updateMember(member);
			resultMessageVO.setMessage("?????? ??????");
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("?????? ????????????");
			resultMessageVO.setUrl("/member/mypage");
			resultMessageVO.setUrlTitle("??????????????????");
		} catch (BizNotFoundException e) {
			resultMessageVO.setMessage("???????????? ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("?????? ????????????");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setMessage("???????????? ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("?????? ????????????");
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
			logger.info("validation ????????????={}",error);
			return "member/passedit";
		}
		
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		
		try {
			memberService.updatePass(member);
			resultMessageVO.setMessage("?????? ??????");
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("???????????? ?????? ????????????");
			resultMessageVO.setUrl("/member/mypage");
			resultMessageVO.setUrlTitle("??????????????????");
		} catch (BizNotFoundException e) {
			resultMessageVO.setMessage("???????????? ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("???????????? ?????? ????????????");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setMessage("???????????? ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("?????? ????????????");
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
			
			//??????????????? ?????? USER_INFO ?????? ??????(?????? ????????????)
			HttpSession session=req.getSession();
			session.removeAttribute("USER_INFO");
			
			resultMessageVO.setMessage("?????? ??????");
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("??????????????????");
		} catch (BizNotEffectedException e) {
			resultMessageVO.setMessage("?????? ?????? ");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("??????????????????");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return  "common/message";
	}
	
	@Inject
	MailSendService mss;
	
	//????????? ?????? ????????? ?????? ?????? ?????????
	//@ResponseBody ????????? ??? ??????????????? MailSendService???
	//sendAuthmail??????
	
    @RequestMapping(value="/member/email")
    @ResponseBody public String email(@RequestParam("email")String
    email,HttpServletRequest req) { return mss.sendAuthMail(email,
    req.getServerName(), req.getServerPort()); //????????? url,port ????????? ??? ??? ????????? ??????
	}
	

}
