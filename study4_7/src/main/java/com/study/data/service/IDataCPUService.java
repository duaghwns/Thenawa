package com.study.data.service;

import java.util.List;

import com.study.data.vo.DataCPUVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

public interface IDataCPUService {
	public List<DataCPUVO> getDataList(DataSearchVO searchVO);
	public DataCPUVO getData(DataRecVO data) throws BizNotFoundException;	
	public DataCPUVO adsData(MemberVO member) throws BizNotFoundException;	
	
}
