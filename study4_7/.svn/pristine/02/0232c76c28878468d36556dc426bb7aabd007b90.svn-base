package com.study.joongo.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.attach.vo.AttachVO;
import com.study.common.util.StudyFileUtils;

@Controller
public class CkFileUploadController {
	
	@Value("#{app['file.upload.path']}")
	private String uploadPath;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH24mm");
	private Logger logger=LoggerFactory.getLogger(getClass());

	@RequestMapping("/jgo/ckImage.ajax")
	@ResponseBody
	public Map<String, Object> ckImage(@RequestParam("upload") MultipartFile multipart) throws Exception {
		logger.debug("upload={}",multipart);
		Map<String, Object> map = new HashMap<String, Object>();
		if (!multipart.isEmpty()) {
			String fileName = sdf.format(new Date()) + multipart.getOriginalFilename();
			String filePath = uploadPath + File.separatorChar + "2021";
			logger.debug("filePath = {}, fileName = {}", filePath, fileName);
			//multipart.transferTo(new File(filePath, fileName));
			
			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));
		map.put("result", true);
		map.put("path", "/profile/2021/"+fileName);
		} else {
			map.put("result", false);
			logger.info("upload img x");
		}
		return map;
	}
	
}
