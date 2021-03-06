package com.study.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.data.vo.DataCartVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;

@Service
public class DataCartServiceimpl implements IDataCartService{
	
	@Inject
	IDataCartDao dataCartDao;

	@Override
	public List<DataCartVO> getCartList(String userId) {
		return dataCartDao.getCartList(userId);
	}
	
	@Override
	public List<DataCartVO> getOrderList(String userId) {
		return dataCartDao.getOrderList(userId);
	}

	@Override
	public void deleteCart(DataCartVO cartVO)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		System.out.println("service");
		System.out.println(cartVO.toString());
		int cnt = dataCartDao.deleteCart(cartVO);
		if (cnt < 1)
			throw new BizNotEffectedException();
	}

	@Override
	public int insertCart(DataCartVO cartVO) throws BizNotEffectedException {

		int cnt = dataCartDao.insertCart(cartVO);
		if (cnt < 1) {
			throw new BizNotEffectedException();
		}
		return dataCartDao.curVal();
	}

	@Override
	public void allDelete(String userId) {
		dataCartDao.allDelete(userId);
	}

	@Override
	public void insertOrder(DataCartVO cart) throws BizNotEffectedException {
		int cnt = dataCartDao.insertOrder(cart);
		if (cnt < 1) {
			throw new BizNotEffectedException();
		}
	}

	
}
