package com.study.reply.VO;

public class ReplyVO {
	private int reNo;             /* 댓글번호 */
	private int reParentNo;       /* 글번호 */
	private String reMemId;       /* 아이디 */
	private String reContent;     /* 내용 */
	private String reIp;          /* 아이피 */
	private String reRegDate;     /* 등록일 */
	private String reModDate;     /* 수정일 */
	private String reCategory;    /* 카테고리 */
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public int getReParentNo() {
		return reParentNo;
	}
	public void setReParentNo(int reParentNo) {
		this.reParentNo = reParentNo;
	}
	public String getReMemId() {
		return reMemId;
	}
	public void setReMemId(String reMemId) {
		this.reMemId = reMemId;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReIp() {
		return reIp;
	}
	public void setReIp(String reIp) {
		this.reIp = reIp;
	}
	public String getReRegDate() {
		return reRegDate;
	}
	public void setReRegDate(String reRegDate) {
		this.reRegDate = reRegDate;
	}
	public String getReModDate() {
		return reModDate;
	}
	public void setReModDate(String reModDate) {
		this.reModDate = reModDate;
	}
	public String getReCategory() {
		return reCategory;
	}
	public void setReCategory(String reCategory) {
		this.reCategory = reCategory;
	}
	
	
}
