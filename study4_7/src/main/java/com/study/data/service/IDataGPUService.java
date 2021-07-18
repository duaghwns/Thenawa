package com.study.data.service;

import java.util.List;

import com.study.data.vo.DataGPUVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

public interface IDataGPUService {
	public List<DataGPUVO> getDataList(DataSearchVO searchVO);
	public DataGPUVO getData(DataRecVO data) throws BizNotFoundException;	
	public DataGPUVO adsData(MemberVO member) throws BizNotFoundException;	
}
