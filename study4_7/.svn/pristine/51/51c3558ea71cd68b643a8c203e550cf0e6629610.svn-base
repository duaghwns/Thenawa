package com.study.login.service;

import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.login.vo.UserVO;
import com.study.member.vo.MemberVO;

public interface ILoginService {
	public UserVO loginCheck(String id, String pw) 
			throws BizNotFoundException,BizPasswordNotMatchedException;
	
	public MemberVO findId(MemberVO member)
			throws BizNotFoundException;
	
	public MemberVO findPw(MemberVO member)
			throws BizNotFoundException;
	
	public void updatePass(MemberVO member) throws BizNotFoundException, BizNotEffectedException;
}
