package com.study.data.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.data.vo.DataCartVO;

@Mapper
public interface IDataCartDao {
	  public List<DataCartVO> getCartList(String userId);
	  public List<DataCartVO> getOrderList(String userId);
	  
	  public int allDelete(String userId);
	  public DataCartVO getCart(String cartNo);
	  public int deleteCart(DataCartVO cart);
	  public int insertCart(DataCartVO cart);
	  public int curVal();
	  public int insertOrder(DataCartVO cart);
}
