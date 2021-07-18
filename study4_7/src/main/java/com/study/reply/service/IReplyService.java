package com.study.reply.service;

import java.util.List;
import com.study.reply.VO.ReplyVO;
import com.study.reply.VO.ReplySearchVO;

import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;

public interface IReplyService {
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO);
	public void registReply(ReplyVO reply);
	public void removeReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException;
	public void modifyReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException;
}
