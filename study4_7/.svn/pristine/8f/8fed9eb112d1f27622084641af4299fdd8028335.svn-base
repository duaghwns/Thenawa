package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataGPUVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

@Service
public class DataGPUServiceimpl implements IDataGPUService{
	
	@Inject
	IDataGPUDao dataGpuDao;

	@Override
	public List<DataGPUVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataGpuDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataGpuDao.getDataList(searchVO);
	}

	@Override
	public DataGPUVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataGPUVO data = dataGpuDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}
	
	@Override
	public DataGPUVO adsData(MemberVO member) throws BizNotFoundException {
		DataGPUVO data = dataGpuDao.adsData(member);
		if (data == null) {
			throw new BizNotFoundException();
		}
		return data;
	}
	
}
