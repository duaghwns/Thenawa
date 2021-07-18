package com.study.data.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DataMainboardVO implements Serializable {
	
	private String id;             /* 아이디 */
	private String name;           /* 이름 */
	private int price;             /* 가격 */
	private String img;            /* 이미지 */
	private String mainCategory;       /* 카테고리 */
	private String mainMaker;          /* 제조회사 */
	private String url;            /* url */
	private String year;           /* 출시년월 */
	private String mainType;           /* 제품분류 */
	private String mainCpuSocket;     /* cpu소켓 */
	private String mainChipLineup;    /* 칩셋라인업 */
	private String mainDetailChipset; /* 세부칩셋 */
	private String mainCpuCnt;        /* cpu장착수 */
	private String mainForm;           /* 폼팩터 */
	private String mainPower;          /* 전원부 */
	private String mainMemoryType;    /* 메모리종류 */
	private String mainMemorySpeed;   /* 메모리속도 */
	private String mainMemorySlot;    /* 메모리슬롯 */
	private String mainMemoryChan;    /* 메모리채널 */
	private String mainMemoryCapacity;/* 메모리용량 */
	private String mainMemorySkill;   /* 메모리기술 */
	private String mainMultiVga;      /* 멀티VGA */
	private String mainVgaConn;       /* VGA연결 */
	private String mainGraphicOutput; /* 그래픽출력 */
	private String mainPcle16;         /* Pcle x 16 */
	private String mainPcle8;          /* Pcle x 8 */
	private String mainPcle4;          /* Pcle x 4 */
	private String mainPcle1;          /* Pcle x 1 */
	private String mainPcl;            /* Pcl */
	private String mainMinipcle;       /* mini-Pcle */
	private String mainM2;             /* M.2 */
	private String mainSata3;          /* SATA3 */
	private String mainInnersound;     /* 내장사운드 */
	private String mainAnalog;         /* 아날로그 출력 */
	private String mainSpdif;          /* SPDIF 출력 */
	private String mainBackDanja;     /* 후면단자 */
	private String mainUsb;            /* USB 타입 */
	private String mainNetwork;        /* 네트워크칩셋 */
	private String mainRj45port;       /* RJ-45포트 */
	private String mainLan;            /* LAN 구성 */
	private String mainOption;         /* 부가기능 */
	
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

	public String getMainCategory() {
		return mainCategory;
	}

	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}

	public String getMainMaker() {
		return mainMaker;
	}

	public void setMainMaker(String mainMaker) {
		this.mainMaker = mainMaker;
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

	public String getMainType() {
		return mainType;
	}

	public void setMainType(String mainType) {
		this.mainType = mainType;
	}

	public String getMainCpuSocket() {
		return mainCpuSocket;
	}

	public void setMainCpuSocket(String mainCpuSocket) {
		this.mainCpuSocket = mainCpuSocket;
	}

	public String getMainChipLineup() {
		return mainChipLineup;
	}

	public void setMainChipLineup(String mainChipLineup) {
		this.mainChipLineup = mainChipLineup;
	}

	public String getMainDetailChipset() {
		return mainDetailChipset;
	}

	public void setMainDetailChipset(String mainDetailChipset) {
		this.mainDetailChipset = mainDetailChipset;
	}

	public String getMainCpuCnt() {
		return mainCpuCnt;
	}

	public void setMainCpuCnt(String mainCpuCnt) {
		this.mainCpuCnt = mainCpuCnt;
	}

	public String getMainForm() {
		return mainForm;
	}

	public void setMainForm(String mainForm) {
		this.mainForm = mainForm;
	}

	public String getMainPower() {
		return mainPower;
	}

	public void setMainPower(String mainPower) {
		this.mainPower = mainPower;
	}

	public String getMainMemoryType() {
		return mainMemoryType;
	}

	public void setMainMemoryType(String mainMemoryType) {
		this.mainMemoryType = mainMemoryType;
	}

	public String getMainMemorySpeed() {
		return mainMemorySpeed;
	}

	public void setMainMemorySpeed(String mainMemorySpeed) {
		this.mainMemorySpeed = mainMemorySpeed;
	}

	public String getMainMemorySlot() {
		return mainMemorySlot;
	}

	public void setMainMemorySlot(String mainMemorySlot) {
		this.mainMemorySlot = mainMemorySlot;
	}

	public String getMainMemoryChan() {
		return mainMemoryChan;
	}

	public void setMainMemoryChan(String mainMemoryChan) {
		this.mainMemoryChan = mainMemoryChan;
	}

	public String getMainMemoryCapacity() {
		return mainMemoryCapacity;
	}

	public void setMainMemoryCapacity(String mainMemoryCapacity) {
		this.mainMemoryCapacity = mainMemoryCapacity;
	}

	public String getMainMemorySkill() {
		return mainMemorySkill;
	}

	public void setMainMemorySkill(String mainMemorySkill) {
		this.mainMemorySkill = mainMemorySkill;
	}

	public String getMainMultiVga() {
		return mainMultiVga;
	}

	public void setMainMultiVga(String mainMultiVga) {
		this.mainMultiVga = mainMultiVga;
	}

	public String getMainVgaConn() {
		return mainVgaConn;
	}

	public void setMainVgaConn(String mainVgaConn) {
		this.mainVgaConn = mainVgaConn;
	}

	public String getMainGraphicOutput() {
		return mainGraphicOutput;
	}

	public void setMainGraphicOutput(String mainGraphicOutput) {
		this.mainGraphicOutput = mainGraphicOutput;
	}

	public String getMainPcle16() {
		return mainPcle16;
	}

	public void setMainPcle16(String mainPcle16) {
		this.mainPcle16 = mainPcle16;
	}

	public String getMainPcle8() {
		return mainPcle8;
	}

	public void setMainPcle8(String mainPcle8) {
		this.mainPcle8 = mainPcle8;
	}

	public String getMainPcle4() {
		return mainPcle4;
	}

	public void setMainPcle4(String mainPcle4) {
		this.mainPcle4 = mainPcle4;
	}

	public String getMainPcle1() {
		return mainPcle1;
	}

	public void setMainPcle1(String mainPcle1) {
		this.mainPcle1 = mainPcle1;
	}

	public String getMainPcl() {
		return mainPcl;
	}

	public void setMainPcl(String mainPcl) {
		this.mainPcl = mainPcl;
	}

	public String getMainMinipcle() {
		return mainMinipcle;
	}

	public void setMainMinipcle(String mainMinipcle) {
		this.mainMinipcle = mainMinipcle;
	}

	public String getMainM2() {
		return mainM2;
	}

	public void setMainM2(String mainM2) {
		this.mainM2 = mainM2;
	}

	public String getMainSata3() {
		return mainSata3;
	}

	public void setMainSata3(String mainSata3) {
		this.mainSata3 = mainSata3;
	}

	public String getMainInnersound() {
		return mainInnersound;
	}

	public void setMainInnersound(String mainInnersound) {
		this.mainInnersound = mainInnersound;
	}

	public String getMainAnalog() {
		return mainAnalog;
	}

	public void setMainAnalog(String mainAnalog) {
		this.mainAnalog = mainAnalog;
	}

	public String getMainSpdif() {
		return mainSpdif;
	}

	public void setMainSpdif(String mainSpdif) {
		this.mainSpdif = mainSpdif;
	}

	public String getMainBackDanja() {
		return mainBackDanja;
	}

	public void setMainBackDanja(String mainBackDanja) {
		this.mainBackDanja = mainBackDanja;
	}

	public String getMainUsb() {
		return mainUsb;
	}

	public void setMainUsb(String mainUsb) {
		this.mainUsb = mainUsb;
	}

	public String getMainNetwork() {
		return mainNetwork;
	}

	public void setMainNetwork(String mainNetwork) {
		this.mainNetwork = mainNetwork;
	}

	public String getMainRj45port() {
		return mainRj45port;
	}

	public void setMainRj45port(String mainRj45port) {
		this.mainRj45port = mainRj45port;
	}

	public String getMainLan() {
		return mainLan;
	}

	public void setMainLan(String mainLan) {
		this.mainLan = mainLan;
	}

	public String getMainOption() {
		return mainOption;
	}

	public void setMainOption(String mainOption) {
		this.mainOption = mainOption;
	}

	
	
}
