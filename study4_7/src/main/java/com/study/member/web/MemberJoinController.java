package com.study.member.web;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.common.valid.Regist;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.member.service.IMemberService;
import com.study.member.service.MailSendService;
import com.study.member.vo.MemberVO;

@Controller
public class MemberJoinController {
	
	@Inject
	IMemberService memberService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/join/join")
	public String join(@ModelAttribute("member")MemberVO member) {
		member.setMemSex("M");
		member.setMemPurpose("GAME");
		return "join/join";
	}
	
	@RequestMapping(value="/join/memberInsert", method = RequestMethod.POST)
	public String regist(@ModelAttribute("member") @Validated({Regist.class})MemberVO member
			, BindingResult error
			, Model model) {
		
		logger.debug(member.toString());
		
		if(error.hasErrors()) {
			return "join/join";
		}
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		try {
			memberService.insertMember(member);
			resultMessageVO.setMessage("회원가입 완료");
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("회원가입결과");
			resultMessageVO.setUrl("/login/login");
			resultMessageVO.setUrlTitle("로그인하기");
		} catch (BizDuplicateKeyException bizDuplicateKeyException) {
			resultMessageVO.setMessage("중복된 아이디입니다.");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("회원등록결과");
			resultMessageVO.setUrl("/join/join");
			resultMessageVO.setUrlTitle("회원가입 으로");
		}catch (BizNotEffectedException bizNotEffectedException) {
			resultMessageVO.setMessage("회원가입 실패");
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("회원등록결과"); 
			resultMessageVO.setUrl("/join/join");
			resultMessageVO.setUrlTitle("회원가입 으로");
		}
		model.addAttribute("resultMessageVO",resultMessageVO);
		return "common/message";
	}
	
	// 아이디 중목체크
	@ResponseBody
    @RequestMapping(value="/join/idChk", method = RequestMethod.POST)
    public int idChk(String memId) {
		
		int result = memberService.IdChk(memId);
		
		if(memId.length() < 5) {
		   result = 1;	
		}
        return result;
    }
	
	@Inject
	MailSendService mss;
	
	//이메일 인증 아작스 요청 받는 메소드
	//@ResponseBody 해주고 이 메소드에서 MailSendService의
	//sendAuthmail호출
	
    @RequestMapping(value="/join/email")
    @ResponseBody public String email(@RequestParam("email")String
    email,HttpServletRequest req) { return mss.sendAuthMail(email,
    req.getServerName(), req.getServerPort()); //실제로 url,port 쓰는건 좀 더 다양한 기능
	}
}
