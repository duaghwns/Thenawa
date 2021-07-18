package com.study.data.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DataRecVO implements Serializable {
	
	private String cpu;              /* 아이디 */
	private String main;            /* 이름 */
	private String gpu;        /* 카테고리 */
	private int price;              /* 가격 */
	private String cooler;             /* 이미지 */
	private String memory;           /* 제조회사 */
	private String cases;            /* 상세보기링크 */
	private String hdd;            /* 출시년월 */
	private String ssd;         /* amd cpu */
	private String power;          /* 소켓구분 */
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}


	public String getCpu() {
		return cpu;
	}


	public void setCpu(String cpu) {
		this.cpu = cpu;
	}


	public String getMain() {
		return main;
	}


	public void setMain(String main) {
		this.main = main;
	}


	public String getGpu() {
		return gpu;
	}


	public void setGpu(String gpu) {
		this.gpu = gpu;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getCooler() {
		return cooler;
	}


	public void setCooler(String cooler) {
		this.cooler = cooler;
	}


	public String getMemory() {
		return memory;
	}


	public void setMemory(String memory) {
		this.memory = memory;
	}


	public String getCases() {
		return cases;
	}


	public void setCases(String cases) {
		this.cases = cases;
	}


	public String getHdd() {
		return hdd;
	}


	public void setHdd(String hdd) {
		this.hdd = hdd;
	}


	public String getSsd() {
		return ssd;
	}


	public void setSsd(String ssd) {
		this.ssd = ssd;
	}


	public String getPower() {
		return power;
	}


	public void setPower(String power) {
		this.power = power;
	}

	
}
