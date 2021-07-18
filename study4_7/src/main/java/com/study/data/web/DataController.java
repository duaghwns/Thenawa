package com.study.data.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.data.service.IDataCPUService;
import com.study.data.service.IDataCaseService;
import com.study.data.service.IDataCoolerService;
import com.study.data.service.IDataGPUService;
import com.study.data.service.IDataHDDService;
import com.study.data.service.IDataMainboardService;
import com.study.data.service.IDataMemoryService;
import com.study.data.service.IDataPowerService;
import com.study.data.service.IDataSSDService;
import com.study.data.vo.DataCPUVO;
import com.study.data.vo.DataCaseVO;
import com.study.data.vo.DataCoolerVO;
import com.study.data.vo.DataGPUVO;
import com.study.data.vo.DataHDDVO;
import com.study.data.vo.DataMainboardVO;
import com.study.data.vo.DataMemoryVO;
import com.study.data.vo.DataPowerVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSSDVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;

// 빈등록 어노테이션 스프링 : @Component(@Service, @Repository, @Controller)
// JSR 표준 : @Bean

@Controller
public class DataController {
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	private IDataCPUService cpuService;
	
	@Inject
	private IDataMainboardService mainService;
	
	@Inject
	private IDataGPUService gpuService;
	
	@Inject
	private IDataPowerService powerService;
	
	@Inject
	private IDataMemoryService memoryService;
	
	@Inject
	private IDataSSDService ssdService;
	
	@Inject
	private IDataHDDService hddService;
	
	@Inject
	private IDataCoolerService coolerService;
	
	@Inject 
	private IDataCaseService caseService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "/")
	public String home() {		
		
		return "redirect:/data/cpu";
	}
	
	@RequestMapping(value="/data/cpu")
	public String cpu(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataCPUVO> dataList = cpuService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/cpu");
		
		return "home";
	}
	
	@RequestMapping(value="/data/mainboard")
	public String mainboard(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataMainboardVO> dataList = mainService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/mainboard");
		
		return "home";
	}
	
	@RequestMapping(value="/data/case")
	public String cases(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataCaseVO> dataList = caseService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/case");
		
		return "home";
	}
	
	@RequestMapping(value="/data/gpu")
	public String gpu(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataGPUVO> dataList = gpuService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/gpu");
		
		return "home";
	}
	
	@RequestMapping(value="/data/power")
	public String power(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataPowerVO> dataList = powerService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/power");
		
		return "home";
	}
	
	@RequestMapping(value="/data/memory")
	public String memory(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataMemoryVO> dataList = memoryService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/memory");
		
		return "home";
	}
	
	@RequestMapping(value="/data/ssd")
	public String ssd(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataSSDVO> dataList = ssdService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/ssd");
		
		return "home";
	}
	
	@RequestMapping(value="/data/hdd")
	public String hdd(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataHDDVO> dataList = hddService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/hdd");
		
		return "home";
	}
	
	@RequestMapping(value="/data/cooler")
	public String cooler(@ModelAttribute("searchVO") DataSearchVO searchVO, Model model) {
		logger.info("searchVO={}",searchVO);
		model.addAttribute("searchVO", searchVO);
		List<DataCoolerVO> dataList = coolerService.getDataList(searchVO);
		model.addAttribute("dataList", dataList);
		model.addAttribute("link","/data/cooler");
		
		return "home";
	}
	
	@PostMapping(value="/data/item/rec", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> rec(HttpServletRequest req) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		String v_cpu = req.getParameter("cpu");
		String v_gpu = req.getParameter("gpu");
		String v_cooler = req.getParameter("cooler");
		String v_memory = req.getParameter("memory");
		String v_power = req.getParameter("power");
		String v_case = req.getParameter("case");
		String v_hdd = req.getParameter("hdd");
		String v_ssd = req.getParameter("ssd");
		String v_main = req.getParameter("main");
		int v_price = Integer.parseInt(req.getParameter("budget"));

		DataRecVO dataRecVO = new DataRecVO();
		dataRecVO.setCpu(v_cpu);
		dataRecVO.setGpu(v_gpu);
		dataRecVO.setCooler(v_cooler);
		dataRecVO.setMemory(v_memory);
		dataRecVO.setPower(v_power);
		dataRecVO.setCases(v_case);
		dataRecVO.setHdd(v_hdd);
		dataRecVO.setSsd(v_ssd);
		dataRecVO.setMain(v_main);
		dataRecVO.setPrice(v_price);
		
		map.put("result", true);
		
		// 목록에서 넘어온 제품이 없다면 추천제품을 넣어주며, 있다면 그냥 blank로 반환
		if(dataRecVO.getCpu() == "") {
			map.put("cpu", cpuService.getData(dataRecVO));
		}else {
			map.put("cpu", "");
		}
		if(dataRecVO.getMain() == "") {
			map.put("main", mainService.getData(dataRecVO));
		}else {
			map.put("main", "");
		}
		if(dataRecVO.getMemory() == "") {
			map.put("memory", memoryService.getData(dataRecVO));
		}else {
			map.put("memory", "");
		}
		if(dataRecVO.getGpu() == "") {
			map.put("gpu", gpuService.getData(dataRecVO));
		}else {
			map.put("gpu", "");
		}
		if(dataRecVO.getSsd() == "") {
			map.put("ssd", ssdService.getData(dataRecVO));
		}else {
			map.put("ssd", "");
		}
		if(dataRecVO.getHdd() == "") {
			map.put("hdd", hddService.getData(dataRecVO));
		}else {
			map.put("hdd", "");
		}
		if(dataRecVO.getPower() == "") {
			map.put("power", powerService.getData(dataRecVO));
		}else {
			map.put("power", "");
		}
		if(dataRecVO.getCooler() == "") {
			map.put("cooler", coolerService.getData(dataRecVO));
		}else {
			map.put("cooler", "");
		}
		if(dataRecVO.getCases() == "") {
			map.put("cases", caseService.getData(dataRecVO));
		}else {
			map.put("cases", "");
		}
		
		return map;
	}
	
	@PostMapping(value="/data/ads/")
	@ResponseBody
	public Map<String, Object> adsCpu(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_INFO") == null) {
			MemberVO member = new MemberVO();
			try {
				map.put("adsCpu", cpuService.adsData(member));
				map.put("adsGpu", gpuService.adsData(member));
				map.put("adsMain", mainService.adsData(member));
			} catch (BizNotFoundException e) {
				e.printStackTrace();
			}
			return map;
		}else{
			UserVO user=(UserVO) session.getAttribute("USER_INFO");
			try {
				MemberVO member = memberService.getMember(user.getUserId());
				map.put("adsCpu", cpuService.adsData(member));
				map.put("adsGpu", gpuService.adsData(member));
				map.put("adsMain", mainService.adsData(member));
			} catch (BizNotFoundException e) {
				e.printStackTrace();
			}
			return map;
		}
	}
	
}
