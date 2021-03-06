package com.study.reply.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.study.reply.VO.ReplyVO;
import com.study.reply.VO.ReplySearchVO;

@Mapper
public interface IReplyDao {
	public int getReplyCountByParent(ReplySearchVO searchVO);

	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO);

	public ReplyVO getReply(int reNo);

	public int insertReply(ReplyVO reply);

	public int updateReply(ReplyVO reply);

	public int deleteReply(ReplyVO reply);

}
