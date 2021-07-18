package com.study.qna.service;

import java.util.List;

import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.qna.vo.QnaBoardSearchVO;
import com.study.qna.vo.QnaBoardVO;

public interface IQnaBoardService {
	public QnaBoardVO getBoard(int boNo) throws BizNotFoundException;
	public void updateBoard(QnaBoardVO boardVO) throws BizNotFoundException, BizPasswordNotMatchedException;
	public void registBoard(QnaBoardVO boardVO);
	public void removeBoard(QnaBoardVO boardVO) throws BizNotFoundException,BizPasswordNotMatchedException;
	public void increaseHit(int boNo) throws BizNotEffectedException;
	public List<QnaBoardVO> getBoardList(QnaBoardSearchVO searchVO);
	public List<QnaBoardVO> getMyList(QnaBoardSearchVO searchVO);
}
