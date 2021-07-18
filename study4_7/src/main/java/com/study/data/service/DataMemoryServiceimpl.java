package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataMemoryVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

@Service
public class DataMemoryServiceimpl implements IDataMemoryService{
	
	@Inject
	IDataMemoryDao dataMemoryDao;

	@Override
	public List<DataMemoryVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataMemoryDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataMemoryDao.getDataList(searchVO);
	}

	@Override
	public DataMemoryVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataMemoryVO data = dataMemoryDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}
	
}
