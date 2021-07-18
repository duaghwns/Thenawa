package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataHDDVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;

@Mapper
public interface IDataHDDDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataHDDVO> getDataList(DataSearchVO searchVO);
	  public DataHDDVO getData(DataRecVO data);
}
