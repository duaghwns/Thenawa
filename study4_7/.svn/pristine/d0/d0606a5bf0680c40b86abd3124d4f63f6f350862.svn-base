package com.study.member.service;

import org.apache.ibatis.annotations.Mapper;

import com.study.member.vo.MemberVO;

@Mapper
public interface IMemberDao {
	public int insertMember(MemberVO member);
	public int updateMember(MemberVO member);
	public int deleteMember(String memId);
	public MemberVO getMember(String memId);
	public int updatePass(MemberVO member);
	public int IdChk(String memId);
	public MemberVO findId(MemberVO member);
	public MemberVO findPw(MemberVO member);
}
