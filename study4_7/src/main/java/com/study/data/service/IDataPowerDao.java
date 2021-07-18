package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataPowerVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;

@Mapper
public interface IDataPowerDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataPowerVO> getDataList(DataSearchVO searchVO);
	  public DataPowerVO getData(DataRecVO data);
}
