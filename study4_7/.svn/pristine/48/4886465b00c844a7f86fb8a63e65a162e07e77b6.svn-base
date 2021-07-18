package com.study.qna.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.valid.Modify;
import com.study.common.valid.Regist;

public class QnaBoardVO implements Serializable{
	private int boNo;                  /* 글 번호 */
	
	@NotBlank(message="제목은 필수입니다",groups= {Regist.class, Modify.class})
	private String boTitle;            /* 글 제목 */
	
	private String boWriter;           /* 작성자 아이디 */
	private String boContent;          /* 내용 */
	
	@NotBlank(message="비밀번호는 필수입니다",groups= {Regist.class, Modify.class})
	private String boPass;             /* 비밀번호 */
	
	private int boHit;                 /* 조회수 */
	private int boParentNo;           /* 답변글의 부모글 번호 */
	private int boGroupOrder;         /* 원글에 대한 순서 */
	private int boGroupDepth;         /* 답변글 계층레벨 */
	private String boRegDate;         /* 작성일자 */
	private String boModDate;         /* 수정일자 */
	private String boDelYn;           /* 삭제 여부 */
	private int boReplyCount;         /* 게시판 댓글갯수 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoWriter() {
		return boWriter;
	}
	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public String getBoPass() {
		return boPass;
	}
	public void setBoPass(String boPass) {
		this.boPass = boPass;
	}
	public int getBoHit() {
		return boHit;
	}
	public void setBoHit(int boHit) {
		this.boHit = boHit;
	}
	public int getBoParentNo() {
		return boParentNo;
	}
	public void setBoParentNo(int boParentNo) {
		this.boParentNo = boParentNo;
	}
	public int getBoGroupOrder() {
		return boGroupOrder;
	}
	public void setBoGroupOrder(int boGroupOrder) {
		this.boGroupOrder = boGroupOrder;
	}
	public int getBoGroupDepth() {
		return boGroupDepth;
	}
	public void setBoGroupDepth(int boGroupDepth) {
		this.boGroupDepth = boGroupDepth;
	}
	public String getBoRegDate() {
		return boRegDate;
	}
	public void setBoRegDate(String boRegDate) {
		this.boRegDate = boRegDate;
	}
	public String getBoModDate() {
		return boModDate;
	}
	public void setBoModDate(String boModDate) {
		this.boModDate = boModDate;
	}
	public String getBoDelYn() {
		return boDelYn;
	}
	public void setBoDelYn(String boDelYn) {
		this.boDelYn = boDelYn;
	}

	public int getBoReplyCount() {
		return boReplyCount;
	}

	public void setBoReplyCount(int boReplyCount) {
		this.boReplyCount = boReplyCount;
	}
	
	
}
