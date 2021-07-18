package com.study.data.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DataCPUVO implements Serializable {
	
	private String id;              /* 아이디 */
	private String name;            /* 이름 */
	private String cpuCategory;        /* 카테고리 */
	private int price;              /* 가격 */
	private String img;             /* 이미지 */
	private String cpuMaker;           /* 제조회사 */
	private String url;            /* 상세보기링크 */
	private String year;            /* 출시년월 */
	private String cpuAmdCpu;         /* amd cpu */
	private String cpuSocket;          /* 소켓구분 */
	private String cpuGeneration;      /* 세대구분 */
	private String cpuDate;            /* 출시일 */
	private String cpuProcess;         /* 제조공정 */
	private String cpuCore;            /* 코어 */
	private String cpuThread;          /* 쓰레드 */
	private String cpuClock;           /* 기본 클럭 */
	private String cpuMaxClock;       /* 최대 클럭 */
	private String cpuL2;              /* L2 캐시 */
	private String cpuL3;              /* L3캐시 */
	private String cpuBit;             /* 연산체계 */
	private String cpuTdp;             /* TDP */
	private String cpuPcle;            /* Pcle버전 */
	private String cpuMaxPcleRain;   /* 최대Pcle 레인수 */
	private String cpuMaxMemory;      /* 최대 메모리 크기 */
	private String cpuMemoryType;     /* 메모리 규 */
	private String cpuMemoryBus;      /* 메모리버스 */
	private String cpuInnerGpu;       /* 내장그래픽 */
	private String cpuGpuModel;       /* GPU모델명 */
	private String cpuGpuCore;        /* GPU코어 속도 */
	private String cpuCoolerHeight;   /* 쿨러 높이 */
	private String cpuIntelCpu;       /* intel cpu */
	private String cpuBusSpeed;       /* 버스 속도 */
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCpuCategory() {
		return cpuCategory;
	}


	public void setCpuCategory(String cpuCategory) {
		this.cpuCategory = cpuCategory;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getCpuMaker() {
		return cpuMaker;
	}


	public void setCpuMaker(String cpuMaker) {
		this.cpuMaker = cpuMaker;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getCpuAmdCpu() {
		return cpuAmdCpu;
	}


	public void setCpuAmdCpu(String cpuAmdCpu) {
		this.cpuAmdCpu = cpuAmdCpu;
	}


	public String getCpuSocket() {
		return cpuSocket;
	}


	public void setCpuSocket(String cpuSocket) {
		this.cpuSocket = cpuSocket;
	}


	public String getCpuGeneration() {
		return cpuGeneration;
	}


	public void setCpuGeneration(String cpuGeneration) {
		this.cpuGeneration = cpuGeneration;
	}


	public String getCpuDate() {
		return cpuDate;
	}


	public void setCpuDate(String cpuDate) {
		this.cpuDate = cpuDate;
	}


	public String getCpuProcess() {
		return cpuProcess;
	}


	public void setCpuProcess(String cpuProcess) {
		this.cpuProcess = cpuProcess;
	}


	public String getCpuCore() {
		return cpuCore;
	}


	public void setCpuCore(String cpuCore) {
		this.cpuCore = cpuCore;
	}


	public String getCpuThread() {
		return cpuThread;
	}


	public void setCpuThread(String cpuThread) {
		this.cpuThread = cpuThread;
	}


	public String getCpuClock() {
		return cpuClock;
	}


	public void setCpuClock(String cpuClock) {
		this.cpuClock = cpuClock;
	}


	public String getCpuMaxClock() {
		return cpuMaxClock;
	}


	public void setCpuMaxClock(String cpuMaxClock) {
		this.cpuMaxClock = cpuMaxClock;
	}


	public String getCpuL2() {
		return cpuL2;
	}


	public void setCpuL2(String cpuL2) {
		this.cpuL2 = cpuL2;
	}


	public String getCpuL3() {
		return cpuL3;
	}


	public void setCpuL3(String cpuL3) {
		this.cpuL3 = cpuL3;
	}


	public String getCpuBit() {
		return cpuBit;
	}


	public void setCpuBit(String cpuBit) {
		this.cpuBit = cpuBit;
	}


	public String getCpuTdp() {
		return cpuTdp;
	}


	public void setCpuTdp(String cpuTdp) {
		this.cpuTdp = cpuTdp;
	}


	public String getCpuPcle() {
		return cpuPcle;
	}


	public void setCpuPcle(String cpuPcle) {
		this.cpuPcle = cpuPcle;
	}


	public String getCpuMaxPcleRain() {
		return cpuMaxPcleRain;
	}


	public void setCpuMaxPcleRain(String cpuMaxPcleRain) {
		this.cpuMaxPcleRain = cpuMaxPcleRain;
	}


	public String getCpuMaxMemory() {
		return cpuMaxMemory;
	}


	public void setCpuMaxMemory(String cpuMaxMemory) {
		this.cpuMaxMemory = cpuMaxMemory;
	}


	public String getCpuMemoryType() {
		return cpuMemoryType;
	}


	public void setCpuMemoryType(String cpuMemoryType) {
		this.cpuMemoryType = cpuMemoryType;
	}


	public String getCpuMemoryBus() {
		return cpuMemoryBus;
	}


	public void setCpuMemoryBus(String cpuMemoryBus) {
		this.cpuMemoryBus = cpuMemoryBus;
	}


	public String getCpuInnerGpu() {
		return cpuInnerGpu;
	}


	public void setCpuInnerGpu(String cpuInnerGpu) {
		this.cpuInnerGpu = cpuInnerGpu;
	}


	public String getCpuGpuModel() {
		return cpuGpuModel;
	}


	public void setCpuGpuModel(String cpuGpuModel) {
		this.cpuGpuModel = cpuGpuModel;
	}


	public String getCpuGpuCore() {
		return cpuGpuCore;
	}


	public void setCpuGpuCore(String cpuGpuCore) {
		this.cpuGpuCore = cpuGpuCore;
	}


	public String getCpuCoolerHeight() {
		return cpuCoolerHeight;
	}


	public void setCpuCoolerHeight(String cpuCoolerHeight) {
		this.cpuCoolerHeight = cpuCoolerHeight;
	}


	public String getCpuIntelCpu() {
		return cpuIntelCpu;
	}


	public void setCpuIntelCpu(String cpuIntelCpu) {
		this.cpuIntelCpu = cpuIntelCpu;
	}


	public String getCpuBusSpeed() {
		return cpuBusSpeed;
	}


	public void setCpuBusSpeed(String cpuBusSpeed) {
		this.cpuBusSpeed = cpuBusSpeed;
	}
	
	
	
	
}
