package com.study.member.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberDao;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService{

	@Inject
	IMemberDao memberDao;
	
	@Override
	public void insertMember(MemberVO member) throws BizDuplicateKeyException, BizNotEffectedException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if(vo != null) throw new BizDuplicateKeyException();
		int cnt = memberDao.insertMember(member);
		if(cnt < 1) throw new BizNotEffectedException();
	}

	@Override
	public void updateMember(MemberVO member) throws BizNotFoundException, BizNotEffectedException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo == null) {
			throw new BizNotFoundException();
		}
		int cnt = memberDao.updateMember(member);
		if (cnt < 1) {
			throw new BizNotEffectedException();
		}
	}

	@Override
	public void deleteMember(String memId) throws BizNotEffectedException {
		int cnt = memberDao.deleteMember(memId);
		if (cnt < 1) {
			throw new BizNotEffectedException();
		}
	}

	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
		MemberVO member = memberDao.getMember(memId);
		if (member == null) {
			throw new BizNotFoundException();
		}
		return member;
	}

	@Override
	public int IdChk(String memId) {
		int result = memberDao.IdChk(memId); 
		return result;
	}

	@Override
	public void updatePass(MemberVO member) throws BizNotFoundException, BizNotEffectedException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if (vo == null) {
			throw new BizNotFoundException();
		}
		int cnt = memberDao.updatePass(member);
		if (cnt < 1) {
			throw new BizNotEffectedException();
		}
	}

}
