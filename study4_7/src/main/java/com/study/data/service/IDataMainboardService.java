package com.study.data.service;

import java.util.List;

import com.study.data.vo.DataMainboardVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

public interface IDataMainboardService {
	public List<DataMainboardVO> getDataList(DataSearchVO searchVO);
	public DataMainboardVO getData(DataRecVO data) throws BizNotFoundException;
	public DataMainboardVO adsData(MemberVO member) throws BizNotFoundException;	
}
