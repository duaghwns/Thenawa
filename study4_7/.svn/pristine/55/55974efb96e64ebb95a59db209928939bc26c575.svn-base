package com.study.joongo.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.joongo.service.IJoongoDao;
import com.study.joongo.service.IJoongoService;
import com.study.joongo.vo.JoongoSearchVO;
import com.study.joongo.vo.joongoVO;

@Service
public class JoongoServiceImpl implements IJoongoService {

	@Inject
	private IJoongoDao dao;
	
	@Override
	public List<joongoVO> list(JoongoSearchVO searchVO) {
		int totalRow = dao.getBoardCount(searchVO);
		searchVO.setTotalRowCount(totalRow);
		searchVO.pageSetting();
		
		return dao.list(searchVO);
	}
	
	@Override
	public joongoVO getBoard(int boNo) throws BizNotFoundException {
		joongoVO a = dao.getBoard(boNo);
		if(a == null) throw new BizNotFoundException("해당 글을 찾을 수 없습니다.");
		return a;
	}
	
	@Override
	public void increaseHit(int jgNo) throws BizNotEffectedException {
		dao.increaseHit(jgNo);
	}
	
	@Override
	public void insertBoard(joongoVO jogo) {
		dao.insertBoard(jogo);
	}
	
	@Override
	public void updateBoard(joongoVO jogo) throws BizNotFoundException, BizAccessFailException {
		joongoVO a = dao.getBoard(jogo.getJgNo());
		if(a==null) throw new BizNotFoundException("해당 글을 찾을 수 없습니다.");
		if(!a.getJgWriter().equals(jogo.getJgWriter())) throw new BizAccessFailException("사용자가 일치하지 않습니다.");
		dao.updateBoard(jogo);
	}
	
	@Override
	public void deleteBoard(joongoVO jogo) throws BizNotFoundException, BizAccessFailException {
		joongoVO a = dao.getBoard(jogo.getJgNo());
		if(a==null) throw new BizNotFoundException("해당 글을 찾을 수 없습니다.");
		if(!a.getJgWriter().equals(jogo.getJgWriter())) throw new BizAccessFailException("사용자가 일치하지 않습니다.");
		dao.deleteBoard(jogo);
	}

	@Override
	public List<joongoVO> myList(JoongoSearchVO searchVO) {
		int totalRow = dao.getMyCount(searchVO);
		searchVO.setTotalRowCount(totalRow);
		searchVO.pageSetting();
		
		return dao.myList(searchVO);
	} 
}
