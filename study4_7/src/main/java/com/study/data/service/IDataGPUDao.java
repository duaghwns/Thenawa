package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataGPUVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.member.vo.MemberVO;

@Mapper
public interface IDataGPUDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataGPUVO> getDataList(DataSearchVO searchVO);
	  public DataGPUVO getData(DataRecVO data);
	  public DataGPUVO adsData(MemberVO member);
}
