package com.study.data.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.data.service.IDataCartService;
import com.study.data.vo.DataCartVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;

@Controller
public class CartController {
	
	@Inject
	IDataCartService cartService;
	
	@Inject
	private IMemberService memberService;
	
	@RequestMapping(value = "/data/cart/buy")
	public String buy(HttpServletRequest req, Model model) throws BizNotFoundException {	
		HttpSession session = req.getSession();
		if(session.getAttribute("USER_INFO") != null) {
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			List<DataCartVO> cartList = cartService.getCartList(user.getUserId());
			model.addAttribute("cartList", cartList);
			MemberVO member = memberService.getMember(user.getUserId());
			model.addAttribute("member", member);
			int sum = 0;
			for(DataCartVO cart : cartList) {
				sum += cart.getCartPrice();
			}
			model.addAttribute("totalPrice", sum);
		}
		return "buy/cart";
	}
	
	@RequestMapping(value = "/data/cart/cash")
	public String cash(HttpServletRequest req, Model model) throws BizNotFoundException {	
		HttpSession session = req.getSession();
		if(session.getAttribute("USER_INFO") != null) {
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			MemberVO member = memberService.getMember(user.getUserId());
			model.addAttribute("member", member);
			model.addAttribute("totalPrice", req.getParameter("totalPrice"));
		}
		return "buy/cash";
	}
	
	@RequestMapping(value = "/data/cart/bought")
	public String bought(HttpServletRequest req, Model model) throws BizNotFoundException {	
		HttpSession session = req.getSession();
		if(session.getAttribute("USER_INFO") != null) {
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			List<DataCartVO> cartList = cartService.getCartList(user.getUserId());
			model.addAttribute("cartList", cartList);
			MemberVO member = memberService.getMember(user.getUserId());
			// 결제가 완료되었으니 기존 장바구니에 담겼던 데이터는 삭제
			cartService.allDelete(user.getUserId());
			model.addAttribute("member", member);
			int sum = 0;
			for(DataCartVO cart : cartList) {
				sum += cart.getCartPrice();
				// 장바구니에 있던 제품들을 order table에 옮겨주어야함
				try {
					cartService.insertOrder(cart);
				} catch (BizNotEffectedException e) {
					e.printStackTrace();
				}
			}
			model.addAttribute("totalPrice", sum);
		}
		return "buy/bought";
	}
	
	@RequestMapping(value = "/data/cart/history")
	public String history(HttpServletRequest req, Model model) throws BizNotFoundException {	
		HttpSession session = req.getSession();
		if(session.getAttribute("USER_INFO") != null) {
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			List<DataCartVO> orderList = cartService.getOrderList(user.getUserId());
			HashSet<String> dateSet = new HashSet<String>();
			for(DataCartVO order : orderList) {
				dateSet.add(order.getCartDate());
			}
			List<String> dateList = new ArrayList<String>(dateSet);
			Collections.sort(dateList);
			Collections.reverse(dateList);
			model.addAttribute("orderList", orderList);
			model.addAttribute("dateList", dateList);
		}
		return "buy/history";
	}
	
	@RequestMapping(value = "/excel/download")
	public void excel(HttpServletRequest req, HttpServletResponse response) throws BizNotFoundException, IOException {	
		HttpSession session = req.getSession();
        
		if(session.getAttribute("USER_INFO") != null) {
			Workbook wb = new XSSFWorkbook(); // xlsx 확장자. 
			Sheet sheet = wb.createSheet("첫번째 시트");
			Row row = null;
			Cell cell = null;
			int rowNum = 0;
			
			// Header
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue("날짜");
			cell = row.createCell(1);
			cell.setCellValue("제품명");
			cell = row.createCell(2);
			cell.setCellValue("가격");
			
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			List<DataCartVO> orderList = cartService.getOrderList(user.getUserId());

			for(DataCartVO order : orderList) {
				row = sheet.createRow(rowNum++);
				cell = row.createCell(0);
				cell.setCellValue(order.getCartDate());
				cell = row.createCell(1);
				cell.setCellValue(order.getCartName());
				cell = row.createCell(2);
				cell.setCellValue(order.getCartPrice());
			}
			
	        // 컨텐츠 타입과 파일명 지정
	        response.setContentType("ms-vnd/excel");
	        response.setHeader("Content-Disposition", "attachment;filename=order_info.xlsx");

	        // Excel File Output
	        wb.write(response.getOutputStream());
	        wb.close();
		}
	}
	
	@PostMapping(value="/data/cart/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> cart(HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("USER_INFO") == null) {
			map.put("count", -1);
			return map;
		}else {
			UserVO user = (UserVO) session.getAttribute("USER_INFO");
			List<DataCartVO> cartList = cartService.getCartList(user.getUserId());
			map.put("result", true);
			map.put("data", cartList);
			map.put("count", cartList.size());
			return map;
		}
	}
	
	@PostMapping(value="/data/cart/add")
	@ResponseBody
	public int cartAdd(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_INFO") == null) {
			return -1;
		}else{
			UserVO user = (UserVO)session.getAttribute("USER_INFO");
			DataCartVO cart = new DataCartVO();
			cart.setCartItem(req.getParameter("cartItem"));
			cart.setCartMem(user.getUserId());
			
			System.out.println(cart.toString());
			try {
				return cartService.insertCart(cart);
			} catch (BizNotEffectedException e) {
				e.printStackTrace();
			}
		}
		return -1;
		
	}
	
	@PostMapping(value="/data/cart/del")
	@ResponseBody
	public String cartDel(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_INFO") == null) {
			return "no";
		}else{
			UserVO user = (UserVO)session.getAttribute("USER_INFO");
			DataCartVO cart = new DataCartVO();
			cart.setCartItem(req.getParameter("cartItem"));
			cart.setCartMem(user.getUserId());
			System.out.println(cart.toString());
			try {
				cartService.deleteCart(cart);
			} catch (BizNotFoundException | BizPasswordNotMatchedException | BizNotEffectedException e) {
				e.printStackTrace();
			}
			return "yes";
		}
		
	}
	
	@PostMapping(value="/data/cart/allDel")
	@ResponseBody
	public String allDel(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_INFO") == null) {
			return "no";
		}else{
			UserVO user = (UserVO)session.getAttribute("USER_INFO");
			cartService.allDelete(user.getUserId());
			
			return "yes";
		}
		
	}
}
