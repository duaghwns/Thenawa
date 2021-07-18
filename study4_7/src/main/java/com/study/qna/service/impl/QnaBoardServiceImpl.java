package com.study.qna.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.qna.service.IQnaBoardDao;
import com.study.qna.service.IQnaBoardService;
import com.study.qna.vo.QnaBoardSearchVO;
import com.study.qna.vo.QnaBoardVO;

@Service
public class QnaBoardServiceImpl implements IQnaBoardService{
	
	@Inject
	IQnaBoardDao qnaDao;

	@Override
	public QnaBoardVO getBoard(int boNo) throws BizNotFoundException {
		QnaBoardVO board = qnaDao.getBoard(boNo);
		if(board == null) {
			throw new BizNotFoundException();
		}
		return board;
	}

	@Override
	public void updateBoard(QnaBoardVO boardVO) throws BizNotFoundException, BizPasswordNotMatchedException {
		
		QnaBoardVO board = qnaDao.getBoard(boardVO.getBoNo());
		
		if(board == null) {
			throw new BizNotFoundException();
		}else {
			if(board.getBoPass().equals(boardVO.getBoPass())) {
				qnaDao.updateBoard(boardVO);
			}else {
				throw new BizPasswordNotMatchedException();
			}
		}
	}

	// 저장버튼을 눌렀을 때 hidden값으로 넘어온 VO의 boardVO.boNo값이 
	// 0이면 새글등록 -> 계층레벨, 계층순서 0으로 셋팅 후 VO insert
	// 0이 아닌경우 답글로 판단 -> 받은 bono값으로 board정보 탐색후 VO에 부모글번호 계층레벨, 계층순서 세팅
	// insert하기전 update문 실행해 계층레벨과 계층순서를 바꿔준 후 insert
	@Override
	public void registBoard(QnaBoardVO boardVO) {
		if(boardVO.getBoNo() == 0) {
			int bono = qnaDao.nextBono();
			boardVO.setBoNo(bono);
			boardVO.setBoParentNo(bono);
			boardVO.setBoGroupDepth(0);
			boardVO.setBoGroupOrder(0);
			qnaDao.insertBoard(boardVO);
		}else {
			QnaBoardVO board = qnaDao.getBoard(boardVO.getBoNo());
			int bono = qnaDao.nextBono();
			boardVO.setBoNo(bono);
			boardVO.setBoParentNo(board.getBoParentNo());
			boardVO.setBoGroupDepth(board.getBoGroupDepth()+1);
			boardVO.setBoGroupOrder(board.getBoGroupOrder()+1);
			qnaDao.updateBoardOrderd(boardVO);
			qnaDao.insertBoard(boardVO);
		}	
	}

	@Override
	public void removeBoard(QnaBoardVO boardVO) throws BizNotFoundException, BizPasswordNotMatchedException {
		
		QnaBoardVO board = qnaDao.getBoard(boardVO.getBoNo());
		
		if(board == null) {
			throw new BizNotFoundException();
		}else {
			System.out.println("boardPass : " + board.getBoPass() + ", inputPass : " + boardVO.getBoPass());
			if(board.getBoPass().equals(boardVO.getBoPass())) {
				qnaDao.deleteBoard(board);
			}else {
				throw new BizPasswordNotMatchedException();
			}
		}	
	}

	@Override
	public List<QnaBoardVO> getBoardList(QnaBoardSearchVO searchVO) {
		int totalRowCount = qnaDao.getBoardCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return qnaDao.getBoardList(searchVO); 
	}

	@Override
	public void increaseHit(int boNo) throws BizNotEffectedException {
		int cnt = qnaDao.increaseHit(boNo);
		if (cnt < 1) {
			throw new BizNotEffectedException();
		}	
	}

	@Override
	public List<QnaBoardVO> getMyList(QnaBoardSearchVO searchVO) {
		int totalRowCount = qnaDao.getMyCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return qnaDao.getMyList(searchVO); 
	}

}
