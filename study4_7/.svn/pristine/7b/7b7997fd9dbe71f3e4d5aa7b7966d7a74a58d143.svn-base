package com.study.free.service;

import java.util.List;

import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.vo.FreeBoardVO;
import com.study.free.vo.FreeSearchVO;

public interface IFreeBoardService {
	public List<FreeBoardVO> getBoardlist(FreeSearchVO searchVO);
	public FreeBoardVO getBoard(int boNo) throws BizNotFoundException;
	public void increaseHit(int boNo) throws BizNotEffectedException;
	public void updateBoarad(FreeBoardVO boardVO) throws BizNotFoundException, BizPasswordNotMatchedException;
	public void registBoard(FreeBoardVO boardVO);
	public void removeBoard(FreeBoardVO boardVO) throws BizNotFoundException,BizPasswordNotMatchedException;
}
