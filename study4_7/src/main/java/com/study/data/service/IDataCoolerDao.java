package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataCoolerVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;

@Mapper
public interface IDataCoolerDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataCoolerVO> getDataList(DataSearchVO searchVO);
	  public DataCoolerVO getData(DataRecVO data);
}
