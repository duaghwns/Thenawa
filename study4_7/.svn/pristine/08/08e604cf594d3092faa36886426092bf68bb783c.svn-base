package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataCaseVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;

@Mapper
public interface IDataCaseDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataCaseVO> getDataList(DataSearchVO searchVO);
	  public DataCaseVO getData(DataRecVO data);
}
