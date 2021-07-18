package com.study.reply.web;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;
import com.study.login.vo.UserVO;
import com.study.reply.service.IReplyService;

import com.study.reply.VO.ReplyVO;
import com.study.reply.VO.ReplySearchVO;

@Controller
public class ReplyController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Inject
	IReplyService replyService;
	// 댓글 목록
	@RequestMapping(value = "reply/replyList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> replyList(ReplySearchVO searchVO) throws Exception {
		List<ReplyVO> list = replyService.getReplyListByParent(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		map.put("count", list.size());
		logger.debug("map={}",map);
		return map;
	}
	// 댓글 입력
	@ResponseBody
	@RequestMapping(value = "reply/replyRegist", method = RequestMethod.POST)
	public Map<String, Object> replyRegist(ReplyVO reply, HttpServletRequest req, HttpSession session)
			throws Exception {
		reply.setReIp(req.getRemoteAddr());
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		
		reply.setReMemId(user.getUserId());
		replyService.registReply(reply);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("msg", "삐빅- 정상 등록 되었습니다.");
		return map;
	}
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/reply/replyModify") 
	public Map<String, Object> replyModify(ReplyVO reply, HttpSession session)throws Exception{
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		reply.setReMemId(user.getUserId());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			replyService.modifyReply(reply);
			map.put("result", true);
			map.put("msg", "수정되었습니다.");
			return map;
		} catch (BizNotFoundException e) {
			map.put("result", true);
			map.put("msg", "글이 존재하지않음.");
			return map;
		} catch (BizAccessFailException e) {
			map.put("result", true);
			map.put("msg","접근실패");
			return map;
		}
	}
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/reply/replyDelete")
	public Map<String, Object>replyDelete(ReplyVO reply, HttpSession session) throws Exception{
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		reply.setReMemId(user.getUserId());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			replyService.removeReply(reply);
			map.put("result", true);
			map.put("msg", "삭제되었습니다.");
			return map;
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "글이 존재하지 않음."); 
			return map;
		} catch (BizAccessFailException e) {
			map.put("result", false);
			map.put("msg", "접근실패.");
			return map;
		}
		
	}
}
