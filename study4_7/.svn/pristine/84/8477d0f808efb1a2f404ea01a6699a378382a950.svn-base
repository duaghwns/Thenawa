package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataCaseVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

@Service
public class DataCaseServiceimpl implements IDataCaseService{
	
	@Inject
	IDataCaseDao dataCaseDao;

	@Override
	public List<DataCaseVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataCaseDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataCaseDao.getDataList(searchVO);
	}

	@Override
	public DataCaseVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataCaseVO data = dataCaseDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}
	
}
