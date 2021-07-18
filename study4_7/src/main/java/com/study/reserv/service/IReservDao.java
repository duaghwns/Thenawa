package com.study.reserv.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.reserv.vo.ReservVO;

@Mapper
public interface IReservDao {
	
	public List<ReservVO> getList();
	public void insertRes(ReservVO reservVO);

}
