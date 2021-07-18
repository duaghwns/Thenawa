package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataHDDVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;

@Service
public class DataHDDServiceimpl implements IDataHDDService{
	
	@Inject
	IDataHDDDao dataHDDDao;

	@Override
	public List<DataHDDVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataHDDDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataHDDDao.getDataList(searchVO);
	}

	@Override
	public DataHDDVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataHDDVO data = dataHDDDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}
	
}
