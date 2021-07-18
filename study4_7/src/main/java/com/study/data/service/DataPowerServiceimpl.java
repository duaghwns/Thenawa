package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataPowerVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

@Service
public class DataPowerServiceimpl implements IDataPowerService{
	
	@Inject
	IDataPowerDao dataPowerDao;

	@Override
	public List<DataPowerVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataPowerDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataPowerDao.getDataList(searchVO);
	}

	@Override
	public DataPowerVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataPowerVO data = dataPowerDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}
	
}
