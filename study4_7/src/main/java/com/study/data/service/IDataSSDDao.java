package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSSDVO;
import com.study.data.vo.DataSearchVO;

@Mapper
public interface IDataSSDDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataSSDVO> getDataList(DataSearchVO searchVO);
	  public DataSSDVO getData(DataRecVO data);
}
