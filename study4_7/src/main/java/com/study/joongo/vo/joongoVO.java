package com.study.joongo.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.attach.vo.AttachVO;
@SuppressWarnings("serial")
public class joongoVO implements Serializable{
	
	private int jgNo;             /* 글번호 */
	private String jgTitle;       /* 제목 */
	private String jgWriter;      /* 작성자 */
	private String jgContent;     /* 내용 */
	private int jgHit;            /* 조회수 */
	private String jgRegDate;     /* 등록일 */
	private String jgModDate;     /* 수정일 */
	private String jgDelYn;       /* 삭제여부 */
	private String jgItem;        /* 아이템 */
	private String jgItemImg;     /* 아이템이미지 */
	private String jgItemName;    /* 아이템이름 */
	private String itemPrice;		  /* 아이템가격 */
	private String sales;			/* 판매상태 */
	private String itemImgNewName;	/* 아이템 새로운 이름 */
	
	private List<AttachVO> attaches; /* 첨부파일 리스트 */
	private int[] delAtchNos; 		/* 삭제할 대상 첨부파일 번호 */
	private int jgReplyCount;		/* 게시판 댓글 카운트 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public int getJgNo() {
		return jgNo;
	}
	public void setJgNo(int jgNo) {
		this.jgNo = jgNo;
	}
	public String getJgTitle() {
		return jgTitle;
	}
	public void setJgTitle(String jgTitle) {
		this.jgTitle = jgTitle;
	}
	public String getJgWriter() {
		return jgWriter;
	}
	public void setJgWriter(String jgWriter) {
		this.jgWriter = jgWriter;
	}
	public String getJgContent() {
		return jgContent;
	}
	public void setJgContent(String jgContent) {
		this.jgContent = jgContent;
	}
	public int getJgHit() {
		return jgHit;
	}
	public void setJgHit(int jgHit) {
		this.jgHit = jgHit;
	}
	public String getJgRegDate() {
		return jgRegDate;
	}
	public void setJgRegDate(String jgRegDate) {
		this.jgRegDate = jgRegDate;
	}
	public String getJgModDate() {
		return jgModDate;
	}
	public void setJgModDate(String jgModDate) {
		this.jgModDate = jgModDate;
	}
	public String getJgDelYn() {
		return jgDelYn;
	}
	public void setJgDelYn(String jgDelYn) {
		this.jgDelYn = jgDelYn;
	}
	public String getJgItem() {
		return jgItem;
	}
	public void setJgItem(String jgItem) {
		this.jgItem = jgItem;
	}
	public String getJgItemImg() {
		return jgItemImg;
	}
	public void setJgItemImg(String jgItemImg) {
		this.jgItemImg = jgItemImg;
	}
	public String getJgItemName() {
		return jgItemName;
	}
	public void setJgItemName(String jgItemName) {
		this.jgItemName = jgItemName;
	}

	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}

	public List<AttachVO> getAttaches() {
		return attaches;
	}

	public void setAttaches(List<AttachVO> attaches) {
		this.attaches = attaches;
	}

	public int[] getDelAtchNos() {
		return delAtchNos;
	}

	public void setDelAtchNos(int[] delAtchNos) {
		this.delAtchNos = delAtchNos;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

	public String getItemImgNewName() {
		return itemImgNewName;
	}

	public void setItemImgNewName(String itemImgNewName) {
		this.itemImgNewName = itemImgNewName;
	}

	public int getJgReplyCount() {
		return jgReplyCount;
	}

	public void setJgReplyCount(int jgReplyCount) {
		this.jgReplyCount = jgReplyCount;
	}
	
	
}
