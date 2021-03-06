package com.study.joongo.web;

import java.io.File;

//import java.io.IOException;
//import java.util.List;
//
//import javax.inject.Inject;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.validation.groups.Default;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.study.attach.vo.AttachVO;
//import com.study.common.util.StudyAttachUtils;
//import com.study.common.valid.ValidationType;
//import com.study.common.vo.ResultMessageVO;
//import com.study.exception.BizException;
//import com.study.exception.BizNotFoundException;
//import com.study.joongo.service.IJoongoService;
//import com.study.joongo.vo.JoongoSearchVO;
//import com.study.joongo.vo.joongoVO;
//import com.study.login.vo.UserVO;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.study.attach.vo.AttachVO;
import com.study.common.util.StudyAttachUtils;
import com.study.common.valid.ValidationType;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizException;
import com.study.exception.BizNotFoundException;
import com.study.file.utils.UploadFileUtils;
import com.study.joongo.service.IJoongoService;
import com.study.joongo.vo.JoongoSearchVO;
import com.study.joongo.vo.joongoVO;
import com.study.login.vo.UserVO;
import com.study.qna.vo.QnaBoardSearchVO;
import com.study.qna.vo.QnaBoardVO;

@Controller
public class JoongoController {

	@Inject
	private IJoongoService ser;
	@Inject
	private StudyAttachUtils attachUtils;
	
	// @Resource(name = "uploadPath")
	@Value("#{app['file.upload.path']}")
	private String uploadPath;

	private Logger logger = LoggerFactory.getLogger(getClass());

	@ExceptionHandler(BizNotFoundException.class)
	public String notFoundEx(BizNotFoundException e, Model model) {
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		resultMessageVO.setResult(false);
		resultMessageVO.setTitle("?????? ??????");
		resultMessageVO.setMessage("?????? ?????? ???????????? ????????????. ?????? ??????????????? ??????????????????.");
		resultMessageVO.setUrl("list");
		resultMessageVO.setUrlTitle("????????????");
		model.addAttribute("resultMessageVO", resultMessageVO);

		return "common/message";
	}

	@RequestMapping("/jgo/list")
	public String getList(Model mo, @ModelAttribute("searchVO") JoongoSearchVO searchVO) {
		logger.debug("searchVO={}", searchVO);
		mo.addAttribute("searchVO", searchVO);
		mo.addAttribute("link", "/jgo/list");
		List<joongoVO> rstl = ser.list(searchVO);
		mo.addAttribute("result", rstl);
		return "jgo/list";
	}
	
	@RequestMapping("/jgo/myList")
	public String getList(Model mo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("USER_INFO") != null) {
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			JoongoSearchVO searchVO = new JoongoSearchVO();
			searchVO.setSearchWord(user.getUserName());
			mo.addAttribute("searchVO", searchVO);
			List<joongoVO> rstl = ser.myList(searchVO);
			mo.addAttribute("result", rstl);
		}
		
		return "jgo/list";
	}

	@RequestMapping("/jgo/view")
	public String getBoard(Model mo, int jgNo,HttpServletRequest req) throws BizException {
		logger.debug("jgNo={}", jgNo);
		System.out.println(uploadPath);
		
		ser.increaseHit(jgNo);
		joongoVO a = ser.getBoard(jgNo);
		
		logger.debug("result={}", a);
		mo.addAttribute("jgo", a);
		return "jgo/view";
	}

	@RequestMapping("/jgo/del")
	public String delete(Model mo, @ModelAttribute joongoVO jogo) throws BizException {
		logger.debug("jogo={}", jogo);
		ser.deleteBoard(jogo);
		return "redirect:/jgo/list";
	}

	@GetMapping(value = "/jgo/edit", params = "jgNo")
	public String edit(Model mo, int jgNo) throws BizException {
		logger.info("jgNo=", jgNo);
		joongoVO a = null;
		a = ser.getBoard(jgNo);
		mo.addAttribute("jgo", a);
		return "jgo/edit";
	}

	@PostMapping("/jgo/modify")
	public ModelAndView modify(@ModelAttribute("jgo") joongoVO vo,
			@RequestParam(name = "files", required = false) MultipartFile[] jgFiles) throws BizException, IOException {
		logger.debug("vo={}", vo);
		logger.debug("jgFiles={}", jgFiles);
		ModelAndView mav = new ModelAndView();
		if (jgFiles != null) {
			List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(jgFiles, "DATA", "data/2021");
			vo.setAttaches(attaches);
		}
		//TODO: ????????? ?????? ???????????? vo??? ??????
		
		ser.updateBoard(vo);
		mav.setViewName("redirect:/jgo/view?jgNo=" + vo.getJgNo());
		return mav;
	}

	@RequestMapping(value = "/jgo/regist", method = RequestMethod.GET)
	public String getRegist(@ModelAttribute("jgo") joongoVO vo,Model mo) {
		logger.debug("vo={}", vo);
		mo.addAttribute("vo",vo);
		return "jgo/regist";
	}

	@PostMapping("/jgo/regist")
	public String postRegist(@ModelAttribute("jgo") @Validated({ Default.class, ValidationType.Regist.class }) joongoVO vo
							, BindingResult error
							,HttpServletRequest req
							, @RequestParam(name = "file") MultipartFile file
					)
			throws BizException, Exception {
		logger.debug("jgo={}", vo);
		if(error.hasErrors()) {
			logger.debug("validation ????????????={}",error	);
			return "jgo/regist";
		}
		logger.debug("vo={}", vo);
		logger.debug("file={}", file);
		
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		logger.debug("imgUploadPath={}", imgUploadPath);
		logger.debug("ymdPath={}", ymdPath);
		
		if (!file.isEmpty()) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setJgItemImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setItemImgNewName(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} 
//		else {
//			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
//		}
		logger.debug("fileName={}", fileName);

		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		vo.setJgWriter(user.getUserName());
		ser.insertBoard(vo);
		return "redirect:/jgo/list";
	}
	
	@RequestMapping("/jgo/delete")
	public String delete(joongoVO vo,HttpServletRequest req) throws BizException {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO"); 
		vo.setJgWriter(user.getUserName());
		ser.deleteBoard(vo);
		return "redirect:/jgo/list";
	}

}
