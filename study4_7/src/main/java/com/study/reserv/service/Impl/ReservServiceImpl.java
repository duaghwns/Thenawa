package com.study.reserv.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.reserv.service.IReservDao;
import com.study.reserv.service.IReservService;
import com.study.reserv.vo.ReservVO;

@Service
public class ReservServiceImpl implements IReservService {

	@Inject
	private IReservDao reservDao;

	@Override
	public List<ReservVO> getList() {
		List<ReservVO> reserv = reservDao.getList();
	
		return reserv;
	}

	@Override
	public void registRes(ReservVO reservVO) {
		reservDao.insertRes(reservVO);
		
	}



	

	
}
