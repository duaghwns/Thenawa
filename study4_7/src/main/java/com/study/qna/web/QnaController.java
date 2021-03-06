package com.study.qna.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.common.valid.Modify;
import com.study.common.valid.Regist;
import com.study.common.vo.ResultMessageVO;
import com.study.data.vo.DataCartVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.login.vo.UserVO;
import com.study.member.vo.MemberVO;
import com.study.qna.service.IQnaBoardService;
import com.study.qna.vo.QnaBoardSearchVO;
import com.study.qna.vo.QnaBoardVO;

@Controller
public class QnaController {
	
	@Inject IQnaBoardService qnaService;
	
	//컨트롤러단에서의 로그는 보통 파라미터가 넘어왔는지 안넘어왔는지 체크
	//import log4j
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/qna/list")
	public String qnaList(@ModelAttribute("QnasearchVO") QnaBoardSearchVO searchVO, Model model) {
		logger.info("QnasearchVO={}",searchVO);
		model.addAttribute("QnasearchVO", searchVO);
		List<QnaBoardVO> qnaList = qnaService.getBoardList(searchVO);
		model.addAttribute("qnaList", qnaList);
		
		return "qna/list";  
	}
	
	@RequestMapping("/qna/myList")
	public String myList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("USER_INFO") != null) {
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			QnaBoardSearchVO searchVO = new QnaBoardSearchVO();
			searchVO.setSearchWord(user.getUserId());
			model.addAttribute("QnasearchVO", searchVO);
			List<QnaBoardVO> qnaList = qnaService.getMyList(searchVO);
			model.addAttribute("qnaList", qnaList);
		}
		
		return "qna/list";  
	}
	
	// 글쓰기 버튼을 눌렀을때 boardVO를 model로 넘겨줌 
	@RequestMapping("/qna/regist")
	public String getRegist(@ModelAttribute("boardVO") QnaBoardVO boardVO, Model model) {
	
		logger.info("QnaBoardVO={}", boardVO);
		model.addAttribute("boardVO", boardVO);

		return "qna/regist";
	}
	
	// 저장버튼을 눌렀을 때 hidden값으로 넘어온 boardVO.boNo값을 기준으로 새글인지 답글인지 판단. 
	@PostMapping("/qna/regist")
	public String PostRegist(@ModelAttribute("boardVO")@Validated({Regist.class}) QnaBoardVO boardVO 
			, BindingResult error
			, Model model
			, HttpServletRequest req) {
		if(error.hasErrors()) {
			logger.info("validation 검증실패={}",error);
			return "qna/regist";
		}
		
		logger.info("qnaBoardVO={}",boardVO);
		ResultMessageVO resultMessageVO = new ResultMessageVO();
	
		qnaService.registBoard(boardVO);
		resultMessageVO.setMessage("정상적으로 등록했습니다.");
		resultMessageVO.setResult(true);
		resultMessageVO.setTitle("등록");
		resultMessageVO.setUrl("list");
		resultMessageVO.setUrlTitle("목록으로 ");

		model.addAttribute("resultMessageVO", resultMessageVO);
		
		return "common/message";
	}
	
	@RequestMapping("/qna/view")
	public String qnaView(@ModelAttribute("boardVO") QnaBoardVO boardVO, @RequestParam(value = "boNo", required = true) int boNo, Model model) {
		
		logger.info("boNo={}",boNo);
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		
		try {
			QnaBoardVO board = qnaService.getBoard(boNo);
			qnaService.increaseHit(boNo);
			model.addAttribute("board", board);
		} catch (BizNotFoundException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글보기");
			resultMessageVO.setMessage("찾는글이 없습니다.");
			resultMessageVO.setUrl("list");
			resultMessageVO.setUrlTitle("목록으로 ");
			
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
			
		} catch (BizNotEffectedException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글보기");
			resultMessageVO.setMessage("조회수 증가에 실패했습니다.");
			resultMessageVO.setUrl("list");
			resultMessageVO.setUrlTitle("목록으로 ");
			
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "qna/view";
	}
	
	@PostMapping("/qna/remove")
	public String postRemove(@ModelAttribute("boardVO") QnaBoardVO boardVO, Model model) {
		
		logger.info("viewVO={}", boardVO);
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		
		try {
			qnaService.removeBoard(boardVO);
			
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("글 삭제");
			resultMessageVO.setMessage("글이 삭제되었습니다.");
			resultMessageVO.setUrl("list");
			resultMessageVO.setUrlTitle("목록으로");
			
		} catch (BizNotFoundException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글 삭제");
			resultMessageVO.setMessage("해당글을 찾을 수 없습니다.");
			resultMessageVO.setUrl("list");
			resultMessageVO.setUrlTitle("목록으로");
			
		} catch (BizPasswordNotMatchedException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글 삭제");
			resultMessageVO.setMessage("글의 패스워드와 일치하지 않습니다.");
			resultMessageVO.setUrl("list");
			resultMessageVO.setUrlTitle("목록으로");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
	@PostMapping("/qna/edit")
	public String postEditconfirm(@ModelAttribute("boardVO")QnaBoardVO boardVO, Model model) {
		
		logger.info("viewVO={}", boardVO);
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		
		try {
			QnaBoardVO board = qnaService.getBoard(boardVO.getBoNo());
			if(board.getBoPass().equals(boardVO.getBoPass())) {
				model.addAttribute("board", board);
				return "qna/modify";
			}else {
				throw new BizPasswordNotMatchedException();
			}
		} catch (BizNotFoundException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글수정");
			resultMessageVO.setMessage("찾는글이 없습니다.");
			resultMessageVO.setUrl("list");
			resultMessageVO.setUrlTitle("목록으로 ");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizPasswordNotMatchedException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글수정");
			resultMessageVO.setMessage("글의 패스워드와 일치하지 않습니다.");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}	
	}
	
	@PostMapping("/qna/modify")
	public String postModify(@ModelAttribute("boardVO")@Validated({Modify.class}) QnaBoardVO boardVO
			, BindingResult error
			, Model model
			, HttpServletRequest req) {
		
		if(error.hasErrors()) {
			logger.info("validation 검증실패={}",error);
			return "qna/modify";
		}
		
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		
		try {
			qnaService.updateBoard(boardVO);
			
			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("글수정");
			resultMessageVO.setMessage("글 수정이 완료되었습니다.");
			resultMessageVO.setUrl("view?boNo="+boardVO.getBoNo());
			resultMessageVO.setUrlTitle("뷰 화면으로");
			
		} catch (BizNotFoundException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글수정");
			resultMessageVO.setMessage("찾는글이 없습니다.");
			resultMessageVO.setUrl("view?boNo="+boardVO.getBoNo());
			resultMessageVO.setUrlTitle("뷰 화면으로");
		} catch (BizPasswordNotMatchedException e) {
			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("글수정");
			resultMessageVO.setMessage("글의 패스워드와 일치하지 않습니다.");
			resultMessageVO.setUrl("view?boNo="+boardVO.getBoNo());
			resultMessageVO.setUrlTitle("뷰 화면으로");
		}
		
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}

}
