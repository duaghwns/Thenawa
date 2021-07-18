package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataMemoryVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;

@Mapper
public interface IDataMemoryDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataMemoryVO> getDataList(DataSearchVO searchVO);
	  public DataMemoryVO getData(DataRecVO data);
}
