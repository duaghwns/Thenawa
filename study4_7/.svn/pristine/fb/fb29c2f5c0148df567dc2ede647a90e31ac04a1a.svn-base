package com.study.data.service;

import java.util.List;

import com.study.data.vo.DataCartVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;

public interface IDataCartService {
	public List<DataCartVO> getCartList(String userId);
	public List<DataCartVO> getOrderList(String userId);
	public void deleteCart(DataCartVO cart) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException;
	public int insertCart(DataCartVO cart) throws BizNotEffectedException;
	public void insertOrder(DataCartVO cart) throws BizNotEffectedException;
	public void allDelete(String userId);
}
