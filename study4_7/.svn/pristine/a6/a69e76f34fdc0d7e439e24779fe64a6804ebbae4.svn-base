package com.study.data.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DataCartVO implements Serializable {
	private String cartNo;             /* 장바구니번호 */
	private String cartMem;            /* 회원아이디 */
	private String cartItem;           /* 아이템아이디 */
	private int cartCnt;               /* 개수 */
	
	private String cartName;	// item 테이블과 조인해서 가져올 아이템 name
	private int cartPrice;	// item 테이블과 조인해서 가져올 아이템 가격
	private String cartImg;		// item 테이블과 조인해서 가져올 아이템 이미지
	private String cartUrl;		// item 테이블과 조인해서 가져올 아이템 url
	
	private String cartDate;	// order 테이블에 저장된 날짜
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getCartDate() {
		return cartDate;
	}

	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}

	public String getCartNo() {
		return cartNo;
	}

	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	public String getCartMem() {
		return cartMem;
	}

	public void setCartMem(String cartMem) {
		this.cartMem = cartMem;
	}

	public String getCartItem() {
		return cartItem;
	}

	public void setCartItem(String cartItem) {
		this.cartItem = cartItem;
	}

	public int getCartCnt() {
		return cartCnt;
	}

	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}

	public String getCartName() {
		return cartName;
	}

	public void setCartName(String cartName) {
		this.cartName = cartName;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public String getCartImg() {
		return cartImg;
	}

	public void setCartImg(String cartImg) {
		this.cartImg = cartImg;
	}

	public String getCartUrl() {
		return cartUrl;
	}

	public void setCartUrl(String cartUrl) {
		this.cartUrl = cartUrl;
	}
	
	
}
