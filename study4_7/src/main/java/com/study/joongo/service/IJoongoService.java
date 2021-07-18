package com.study.joongo.service;

import java.util.List;

import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.joongo.vo.JoongoSearchVO;
import com.study.joongo.vo.joongoVO;

public interface IJoongoService {
	public List<joongoVO> list(JoongoSearchVO searchVO);
	public List<joongoVO> myList(JoongoSearchVO searchVO);
	public joongoVO getBoard(int boNo) throws BizNotFoundException;
	public void increaseHit(int boNo) throws BizNotEffectedException;
	public void insertBoard(joongoVO jogo);
	public void updateBoard(joongoVO jogo) throws BizNotFoundException, BizAccessFailException;
	public void deleteBoard(joongoVO jogo) throws BizNotFoundException, BizAccessFailException;
}
