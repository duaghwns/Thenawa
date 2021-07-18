package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataMainboardVO;
import com.study.data.vo.DataRecVO;
import com.study.data.vo.DataSearchVO;
import com.study.member.vo.MemberVO;

@Mapper
public interface IDataMainboardDao {
	  public int getDataCount(DataSearchVO searchVO);
	  public List<DataMainboardVO> getDataList(DataSearchVO searchVO);
	  public DataMainboardVO getData(DataRecVO data);
	  public DataMainboardVO adsData(MemberVO member);
}
