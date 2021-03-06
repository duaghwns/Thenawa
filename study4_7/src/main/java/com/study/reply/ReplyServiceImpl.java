package com.study.reply;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;
import com.study.reply.dao.IReplyDao;
import com.study.reply.service.IReplyService;
import com.study.reply.VO.ReplyVO;
import com.study.reply.VO.ReplySearchVO;

@Service
public class ReplyServiceImpl implements IReplyService {

	@Inject
	IReplyDao replyDao;
	
	@Override
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO) {
		int rowCount = replyDao.getReplyCountByParent(searchVO);
		searchVO.setTotalRowCount(rowCount);
		searchVO.pageSetting();
		return replyDao.getReplyListByParent(searchVO);
	}

	@Override
	public void registReply(ReplyVO reply) {
		replyDao.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		ReplyVO vo = replyDao.getReply(reply.getReNo());
		if(vo==null){
			throw new BizNotFoundException("글번호[" + reply.getReNo() + "]을 조회하지 못했습니다.");
		}
		if (!vo.getReMemId().equals(reply.getReMemId())) {
			throw new BizAccessFailException("해당 글의 작성자가 아닙니다.");
		}
		replyDao.updateReply(reply);
	}

	@Override
	public void removeReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
		ReplyVO vo = replyDao.getReply(reply.getReNo());
		if (vo == null) {
			throw new BizNotFoundException("글번호[" + reply.getReNo() + "]을 조회하지 못했습니다.");
		}
		if (!vo.getReMemId().equals(reply.getReMemId())) {
			throw new BizAccessFailException("해당 글의 작성자가 아닙니다.");
		}
		replyDao.deleteReply(reply);
	}
}
