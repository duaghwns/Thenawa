package com.study.reserv.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.login.vo.UserVO;
import com.study.reserv.service.Impl.ReservServiceImpl;
import com.study.reserv.vo.ReservVO;

@Controller
public class ReservController {
	
	@Inject
	ReservServiceImpl reservServiceImpl;
	
	@RequestMapping("/reserv/reserv")
	public String getList(Model model) {
		List<ReservVO> reserv = reservServiceImpl.getList();
		model.addAttribute("reserv", reserv);
		
		return "reserv/reserv";
	}
	
	
	@PostMapping("/reserv/reservRes")
	public String registRes(ReservVO reservVO, HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_INFO") == null) {
			
		}else{
			UserVO user = (UserVO)session.getAttribute("USER_INFO");
			reservVO.setReservMem(user.getUserId());
			reservVO.setReservGisa(req.getParameter("reservGisa"));
			System.out.println(reservVO.toString());
			reservServiceImpl.registRes(reservVO);
		}
		
		return "redirect:/data/cart/history";
	}
	
}
