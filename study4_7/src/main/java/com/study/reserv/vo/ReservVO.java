package com.study.reserv.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class ReservVO implements Serializable {
	
	private String reservNo;                /* 예약번호 */
	private String reservDate;              /* 예약날짜 */
	private String reservTime;              /* 예약시간 */
	private String reservMem;               /* 회원아이디 */
	private String reservGisa;              /* 기사아이디 */
	private String reservReq;               /* 요청사항 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public String getReservNo() {
		return reservNo;
	}
	public void setReservNo(String reservNo) {
		this.reservNo = reservNo;
	}
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public String getReservTime() {
		return reservTime;
	}
	public void setReservTime(String reservTime) {
		this.reservTime = reservTime;
	}
	public String getReservMem() {
		return reservMem;
	}
	public void setReservMem(String reservMem) {
		this.reservMem = reservMem;
	}
	public String getReservGisa() {
		return reservGisa;
	}
	public void setReservGisa(String reservGisa) {
		this.reservGisa = reservGisa;
	}
	public String getReservReq() {
		return reservReq;
	}
	public void setReservReq(String reservReq) {
		this.reservReq = reservReq;
	}
	
}
