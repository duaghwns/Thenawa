package com.study.free.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.service.IFreeBoardDao;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.free.vo.FreeSearchVO;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService {
	
	@Inject
	private IFreeBoardDao boardDao;
	
	@Override
	public List<FreeBoardVO> getBoardlist(FreeSearchVO searchVO) {
		int totalRow = boardDao.getBoardCount(searchVO);
		searchVO.setTotalRowCount(totalRow);
		searchVO.pageSetting();
		
		return boardDao.getBoardlist(searchVO);
	}
	
	@Override
	public FreeBoardVO getBoard(int boNo) throws BizNotFoundException {
		FreeBoardVO a = boardDao.getBoard(boNo);
		if (a ==null) throw new BizNotFoundException("해당 글이 존재하지 않습니다");
		return a;
	}
	
	@Override
	public void increaseHit(int boNo) throws BizNotEffectedException {
		boardDao.increaseHit(boNo);
	}
	
	@Override
	public void updateBoarad(FreeBoardVO boardVO) throws BizNotFoundException, BizPasswordNotMatchedException {
		FreeBoardVO a = boardDao.getBoard(boardVO.getBoNo());
		if (a ==null) throw new BizNotFoundException("해당 글이 존재하지 않습니다");
		if(!a.getBoPass().equals(boardVO.getBoPass())) throw new BizPasswordNotMatchedException("비밀번호가 일치하지 않습니다");
		
		boardDao.updateBoard(boardVO);
	}
	@Override
	public void registBoard(FreeBoardVO boardVO) {
		boardDao.insertBoard(boardVO);
	}
	
	@Override
	public void removeBoard(FreeBoardVO boardVO) throws BizNotFoundException, BizPasswordNotMatchedException {
		FreeBoardVO a = boardDao.getBoard(boardVO.getBoNo());
		if (a ==null) throw new BizNotFoundException("해당 글이 존재하지 않습니다");
		if(!a.getBoPass().equals(boardVO.getBoPass())) throw new BizPasswordNotMatchedException("비밀번호가 일치하지 않습니다");
		
		boardDao.deleteBoard(boardVO);
	}
}
