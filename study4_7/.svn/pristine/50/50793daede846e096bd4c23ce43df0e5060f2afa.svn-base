package com.study.qna.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.qna.vo.QnaBoardSearchVO;
import com.study.qna.vo.QnaBoardVO;



@Mapper
public interface IQnaBoardDao {
  public int getBoardCount(QnaBoardSearchVO searchVO);
  public int getMyCount(QnaBoardSearchVO searchVO);
  public List<QnaBoardVO> getBoardList(QnaBoardSearchVO searchVO) ;
  public List<QnaBoardVO> getMyList(QnaBoardSearchVO searchVO) ;
  public QnaBoardVO getBoard(int boNo);
  public int nextBono();
  public int increaseHit(int boNo);
  public int updateBoard(QnaBoardVO board);
  public int deleteBoard(QnaBoardVO board);
  public int insertBoard(QnaBoardVO board);
  public int updateBoardOrderd(QnaBoardVO board);

}
