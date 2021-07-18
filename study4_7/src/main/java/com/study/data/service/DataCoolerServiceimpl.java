package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataCoolerVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

@Service
public class DataCoolerServiceimpl implements IDataCoolerService{
	
	@Inject
	IDataCoolerDao dataCoolerDao;

	@Override
	public List<DataCoolerVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataCoolerDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataCoolerDao.getDataList(searchVO);
	}

	@Override
	public DataCoolerVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataCoolerVO data = dataCoolerDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}
	
}
