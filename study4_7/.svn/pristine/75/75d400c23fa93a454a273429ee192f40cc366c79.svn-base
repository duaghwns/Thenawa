package com.study.free.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.free.vo.FreeBoardVO;
import com.study.free.vo.FreeSearchVO;

@Mapper
public interface IFreeBoardDao {
	
	public int getBoardCount(FreeSearchVO searchVO);
	public List<FreeBoardVO> getBoardlist(FreeSearchVO searchVO);
	public FreeBoardVO getBoard(int boNo);
	public void increaseHit(int boNo);
	public void updateBoard(FreeBoardVO boardVO);
	public void insertBoard(FreeBoardVO boardVO);
	public void deleteBoard(FreeBoardVO boardVO);
}
