package com.study.data.service;

import java.util.List;

import com.study.data.vo.DataPowerVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

public interface IDataPowerService {
	public List<DataPowerVO> getDataList(DataSearchVO searchVO);
	public DataPowerVO getData(DataRecVO data) throws BizNotFoundException;	
}
