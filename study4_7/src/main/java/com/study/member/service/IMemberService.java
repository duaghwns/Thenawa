package com.study.member.service;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

public interface IMemberService {
	public void insertMember(MemberVO member) throws BizDuplicateKeyException, BizNotEffectedException;
	public void updateMember(MemberVO member) throws BizNotFoundException, BizNotEffectedException;
	public void deleteMember(String memId) throws BizNotEffectedException;
	public MemberVO getMember(String memId) throws BizNotFoundException;
	public void updatePass(MemberVO member) throws BizNotFoundException, BizNotEffectedException;
	public int IdChk(String memId);
}
