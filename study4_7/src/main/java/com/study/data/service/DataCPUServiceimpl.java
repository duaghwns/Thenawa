package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataCPUVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

@Service
public class DataCPUServiceimpl implements IDataCPUService{
	
	@Inject
	IDataCPUDao dataCPUDao;

	@Override
	public List<DataCPUVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataCPUDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataCPUDao.getDataList(searchVO);
	}

	@Override
	public DataCPUVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataCPUVO data = dataCPUDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}

	@Override
	public DataCPUVO adsData(MemberVO member) throws BizNotFoundException {
		DataCPUVO data = dataCPUDao.adsData(member);
		if (data == null) {
			throw new BizNotFoundException();
		}
		return data;
	}
	
}
