package com.study.free.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.common.valid.ValidationType;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizException;
import com.study.exception.BizNotFoundException;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.free.vo.FreeSearchVO;
import com.study.login.vo.UserVO;

@Controller
public class FreeBoardController {
	
	@Inject
	private IFreeBoardService boardService;

	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@ExceptionHandler(BizNotFoundException.class)
	public String notFoundEx(BizNotFoundException e,Model model) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		resultMessageVO.setResult(false);
		resultMessageVO.setTitle("조회 실패");
		resultMessageVO.setMessage("해당 글이 존재하지 않습니다. 또는 조회수증가 실패했습니다.");
		resultMessageVO.setUrl("list");
		resultMessageVO.setUrlTitle("목록으로");
		model.addAttribute("resultMessageVO", resultMessageVO);
		
		return "common/message";
	}
	
	
	@RequestMapping("/free/list")
	public String list(@ModelAttribute("searchVO") FreeSearchVO searchVO 
						, Model model) {
		logger.debug("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<FreeBoardVO> results = boardService.getBoardlist(searchVO);
		model.addAttribute("results", results);
		model.addAttribute("link","/free/list");
		return "free/list";
	}
	
	@RequestMapping("/free/view")
	public String view(Model model, int boNo) throws BizException {
		boardService.increaseHit(boNo);
		FreeBoardVO a = boardService.getBoard(boNo);
		model.addAttribute("free", a);
		return "free/view";
	}
	
	@RequestMapping("/free/edit")
	public String edit(Model model, int boNo) throws BizException{
		FreeBoardVO a = boardService.getBoard(boNo);
		model.addAttribute("free", a);
		return "free/edit";
	}
	
	
	@RequestMapping("/free/modify")
	public String modify(@ModelAttribute("free") @Validated({ Default.class, ValidationType.Modify.class}) FreeBoardVO freeBoardVO
			,BindingResult error ) throws BizException {
		logger.debug("free = {}",freeBoardVO);
		if (error.hasErrors()) {
			logger.debug("error = {}",error);
			return "free/edit";
		}
		boardService.updateBoarad(freeBoardVO);
		return "redirect:/free/view?boNo="+freeBoardVO.getBoNo();
	}
	
	@RequestMapping("/free/delete")
	public String delete(Model model, @ModelAttribute FreeBoardVO freeBoardVO) throws BizException {
		boardService.removeBoard(freeBoardVO);
//		model.addAttribute("free",freeBoardVO);
		return "redirect:/free/list";
	}
	@RequestMapping(value = "/free/regist", method = RequestMethod.GET)
	public String getRegist(@ModelAttribute("board")FreeBoardVO board) {
		return "free/regist";
	}
	
	@PostMapping("/free/regist")
	public String postRegist(@ModelAttribute("board")@Validated({Default.class, ValidationType.Regist.class}) FreeBoardVO board
								,BindingResult error
								,HttpServletRequest req) {
		logger.debug("free={}",board);
		if (error.hasErrors()) {
			logger.debug("error={}",error);
			return "/free/regist";
		}
		HttpSession session = req.getSession();
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		board.setBoWriter(user.getUserName());
		board.setBoIp(req.getRemoteAddr());
		boardService.registBoard(board);
		return "redirect:/free/view?boNo="+board.getBoNo();
	}
}
