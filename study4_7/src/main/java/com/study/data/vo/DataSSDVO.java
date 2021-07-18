package com.study.data.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DataSSDVO implements Serializable {
	
	private String id;              /* 아이디 */
	private String name;            /* 이름 */
	private String ssdCategory;        /* 카테고리 */
	private String year;            /* 출시년도 */
	private int price;              /* 가격 */
	private String img;             /* 이미지 */
	private String url;             /* url */
	private String ssdMaker;           /* 제조사 */
	private String ssdType;            /* 제품분류 */
	private String ssdForm;            /* 폼펙터 */
	private String ssdInterface;       /* 인터페이스 */
	private String ssdCapacity;        /* 용량 */
	private String ssdMemoryType;     /* 메모리 타입 */
	private String ssdNand;            /* 낸드 구조 */
	private String ssdController;      /* 컨트롤러 */
	private String ssdRamType;        /* RAM타입 */
	private String ssdRead;            /* 순차읽기 */
	private String ssdWrite;           /* 순차쓰기 */
	private String ssdProtocol;        /* 프로토콜 */
	
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

	public String getSsdCategory() {
		return ssdCategory;
	}

	public void setSsdCategory(String ssdCategory) {
		this.ssdCategory = ssdCategory;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getSsdMaker() {
		return ssdMaker;
	}

	public void setSsdMaker(String ssdMaker) {
		this.ssdMaker = ssdMaker;
	}

	public String getSsdType() {
		return ssdType;
	}

	public void setSsdType(String ssdType) {
		this.ssdType = ssdType;
	}

	public String getSsdForm() {
		return ssdForm;
	}

	public void setSsdForm(String ssdForm) {
		this.ssdForm = ssdForm;
	}

	public String getSsdInterface() {
		return ssdInterface;
	}

	public void setSsdInterface(String ssdInterface) {
		this.ssdInterface = ssdInterface;
	}

	public String getSsdCapacity() {
		return ssdCapacity;
	}

	public void setSsdCapacity(String ssdCapacity) {
		this.ssdCapacity = ssdCapacity;
	}

	public String getSsdMemoryType() {
		return ssdMemoryType;
	}

	public void setSsdMemoryType(String ssdMemoryType) {
		this.ssdMemoryType = ssdMemoryType;
	}

	public String getSsdNand() {
		return ssdNand;
	}

	public void setSsdNand(String ssdNand) {
		this.ssdNand = ssdNand;
	}

	public String getSsdController() {
		return ssdController;
	}

	public void setSsdController(String ssdController) {
		this.ssdController = ssdController;
	}

	public String getSsdRamType() {
		return ssdRamType;
	}

	public void setSsdRamType(String ssdRamType) {
		this.ssdRamType = ssdRamType;
	}

	public String getSsdRead() {
		return ssdRead;
	}

	public void setSsdRead(String ssdRead) {
		this.ssdRead = ssdRead;
	}

	public String getSsdWrite() {
		return ssdWrite;
	}

	public void setSsdWrite(String ssdWrite) {
		this.ssdWrite = ssdWrite;
	}

	public String getSsdProtocol() {
		return ssdProtocol;
	}

	public void setSsdProtocol(String ssdProtocol) {
		this.ssdProtocol = ssdProtocol;
	}
	
	
}
