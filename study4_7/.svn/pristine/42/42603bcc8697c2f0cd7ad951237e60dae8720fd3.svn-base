package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataMainboardVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.exception.BizNotFoundException;
import com.study.member.vo.MemberVO;

@Service
public class DataMainboardServiceimpl implements IDataMainboardService{
	
	@Inject
	IDataMainboardDao dataMainboardDao;

	@Override
	public List<DataMainboardVO> getDataList(DataSearchVO searchVO) {
		int totalRowCount = dataMainboardDao.getDataCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dataMainboardDao.getDataList(searchVO);
	}

	@Override
	public DataMainboardVO getData(DataRecVO dataVO) throws BizNotFoundException {
		DataMainboardVO data = dataMainboardDao.getData(dataVO);
		if (data == null) {
			data = null;
		}
		return data;
	}

	@Override
	public DataMainboardVO adsData(MemberVO member) throws BizNotFoundException {
		DataMainboardVO data = dataMainboardDao.adsData(member);
		if (data == null) {
			throw new BizNotFoundException();
		}
		return data;
	}
	
	
}
