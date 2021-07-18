package com.study.login.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.login.service.ILoginService;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberDao;
import com.study.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService{
	
	@Inject
	IMemberDao memberDao;

	@Override
	public UserVO loginCheck(String id, String pw) throws BizNotFoundException, BizPasswordNotMatchedException {
		MemberVO member = memberDao.getMember(id);
		if(member == null) {
			throw new BizNotFoundException("존재하지않는 아이디입니다.");
		}else {
			if(pw.equals(member.getMemPass())) {
				UserVO user = new UserVO();
				user.setUserId(member.getMemId());
				user.setUserPass(member.getMemPass());
				user.setUserName(member.getMemName());
				return user;
			}else {
				throw new BizPasswordNotMatchedException("비밀번호가 틀렸습니다.");
			}
		}
		
	}

	@Override
	public MemberVO findId(MemberVO member) throws BizNotFoundException {
		MemberVO user = memberDao.findId(member);
		if(user == null) {
			throw new BizNotFoundException();
		}
		return user;
	}

	@Override
	public MemberVO findPw(MemberVO member) throws BizNotFoundException {
		MemberVO user = memberDao.findPw(member);
		if(user == null) {
			throw new BizNotFoundException();
		}
		return user;
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
