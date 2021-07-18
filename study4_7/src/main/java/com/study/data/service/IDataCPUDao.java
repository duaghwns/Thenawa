package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataCPUVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.member.vo.MemberVO;

@Mapper
public interface IDataCPUDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataCPUVO> getDataList(DataSearchVO searchVO);
	  public DataCPUVO getData(DataRecVO data);
	  public DataCPUVO adsData(MemberVO member);
}
