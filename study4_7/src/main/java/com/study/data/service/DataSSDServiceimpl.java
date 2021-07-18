package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSSDVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

@Service
public class DataSSDServiceimpl implements IDataSSDService{
	
	@Inject
	IDataSSDDao dataSSDDao;

	@Override
	public List<DataSSDVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataSSDDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataSSDDao.getDataList(searchVO);
	}

	@Override
	public DataSSDVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataSSDVO data = dataSSDDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}
	
}
