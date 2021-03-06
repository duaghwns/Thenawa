package com.study.joongo.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.vo.PagingVO;

public class JoongoSearchVO extends PagingVO{
	private String searchAlign;
	private String searchWord;
	private String searchType;
	
	private String searchSales;
		
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public String getSearchAlign() {
		return searchAlign;
	}
	public void setSearchAlign(String searchAlign) {
		this.searchAlign = searchAlign;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchSales() {
		return searchSales;
	}

	public void setSearchSales(String searchSales) {
		this.searchSales = searchSales;
	}
	
	
}
