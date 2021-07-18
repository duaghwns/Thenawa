package com.study.data.service;

import java.util.List;

import com.study.data.vo.DataMemoryVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

public interface IDataMemoryService {
	public List<DataMemoryVO> getDataList(DataSearchVO searchVO);
	public DataMemoryVO getData(DataRecVO data) throws BizNotFoundException;	
}
