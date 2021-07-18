package com.study.joongo.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.joongo.vo.JoongoSearchVO;
import com.study.joongo.vo.joongoVO;

@Mapper
public interface IJoongoDao {
	public int getBoardCount(JoongoSearchVO searchVO);
	public int getMyCount(JoongoSearchVO searchVO);
	public List<joongoVO> list(JoongoSearchVO searchVO);
	public List<joongoVO> myList(JoongoSearchVO searchVO);
	public joongoVO getBoard(int boNo);
	public void insertBoard(joongoVO jogo);
	public int increaseHit(int boNo);
	public void updateBoard(joongoVO jogo);
	public void deleteBoard(joongoVO jogo);
	
}
