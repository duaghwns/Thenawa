package com.study.member.vo;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.valid.Modify;
import com.study.common.valid.Newpass;
import com.study.common.valid.Password;
import com.study.common.valid.Regist;

public class MemberVO implements Serializable{
	
	
	@NotBlank(message="이용약관 동의를 해주세요", groups=Regist.class)
	private String agreeYn;				/* 이용약관동의 */
	
	private String confirmY;			/* 중복확인YN여부확인을 위한 Y값 */
	
	@NotBlank(message="아이디 중복확인을 해주세요", groups=Regist.class)
	@Pattern(regexp = "Y", groups=Regist.class)
	private String idCheck;				/* 아이디 중복확인여부 */
	
	private String passConfirm;			/* 비밀번호 확인 */
	
	private String inputKey;	/* 사용자가 적은 이메일 인증번호 */
	
	private String emailKey;	/* 이메일 인증번호 */
	
	@Pattern(regexp = "Y", message="이메일을 인증해주세요", groups=Modify.class)
	private String emailConfirm; /* 회원 수정페이지의 이메일 인증여부 */
	 
	
	@NotBlank(message="아이디를 적어주세요", groups=Regist.class)
	@Size(min=5, message="아이디는 5자이상이어야 합니다", groups=Regist.class)
	private String memId;              /* 아이디 */
	
	@NotBlank(message="이름을 적어주세요", groups= {Regist.class, Modify.class})
	private String memName;            /* 이름 */
	
	@NotBlank(message="비밀번호를 적어주세요", groups={Regist.class, Modify.class, Password.class})
	@Size(min=8, message="비밀번호는 8자이상이어야 합니다", groups={Regist.class, Modify.class, Password.class})
	private String memPass;            /* 비밀번호 */
	
	@NotBlank(message="비밀번호를 적어주세요", groups={Password.class, Newpass.class})
	@Size(min=8, message="비밀번호는 8자이상이어야 합니다", groups= {Password.class, Newpass.class})
	private String newMemPass;		/* 변경할 비밀번호 */
	
	@NotBlank(message="비밀번호를 적어주세요", groups={Password.class, Newpass.class})
	@Size(min=8, message="비밀번호는 8자이상이어야 합니다", groups={Password.class, Newpass.class})
	private String newPassConfirm;	/* 변경할 비밀번호확인 */
	
	
	@Email
	@NotBlank(message="이메일을 적어주세요", groups={Regist.class, Modify.class})
	private String memMail;            /* 이메일 */
	
	private String memRegDate;        /* 가입일 */
	
	@NotBlank(message="성별은 필수입니다", groups=Regist.class)
	private String memSex;             /* 성별 */
	
	@NotBlank(message="생일은 필수입니다", groups=Regist.class)
	private String memBir;             /* 생일 */
	
	@NotBlank(message="우편번호는 필수입니다", groups={Regist.class, Modify.class})
	private String memZip;             /* 우편번호 */
	
	@NotBlank(message="주소는 필수입니다", groups={Regist.class, Modify.class})
	private String memAdd1;            /* 주소 */
	
	private String memAdd2;            /* 상세주소 */
	
	private String extraAddress;		/* 참고주소 */
	
	@NotBlank(message="핸드폰번호는 필수입니다", groups={Regist.class, Modify.class})
	@Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$", message="핸드폰번호 양식에 맞지않습니다.", groups={Regist.class, Modify.class})
	private String memHp;              /* 핸드폰번호 */
	
	@NotBlank(message="pc사용목적은 필수입니다", groups={Regist.class, Modify.class})
	private String memPurpose;         /* pc사용목적 */
	
	private int memMileage;            /* 마일리지 */
	private String memDelete;          /* 삭제여부 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemRegDate() {
		return memRegDate;
	}
	public void setMemRegDate(String memRegDate) {
		this.memRegDate = memRegDate;
	}
	public String getMemSex() {
		return memSex;
	}
	public void setMemSex(String memSex) {
		this.memSex = memSex;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public String getMemZip() {
		return memZip;
	}
	public void setMemZip(String memZip) {
		this.memZip = memZip;
	}
	public String getMemAdd1() {
		return memAdd1;
	}
	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}
	public String getMemAdd2() {
		return memAdd2;
	}
	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public int getMemMileage() {
		return memMileage;
	}
	public void setMemMileage(int memMileage) {
		this.memMileage = memMileage;
	}
	public String getMemDelete() {
		return memDelete;
	}
	public void setMemDelete(String memDelete) {
		this.memDelete = memDelete;
	}

	public String getMemPurpose() {
		return memPurpose;
	}

	public void setMemPurpose(String memPurpose) {
		this.memPurpose = memPurpose;
	}

	public String getAgreeYn() {
		return agreeYn;
	}

	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}

	public String getConfirmY() {
		return confirmY;
	}

	public void setConfirmY(String confirmY) {
		this.confirmY = confirmY;
	}

	public String getIdCheck() {
		return idCheck;
	}

	public void setIdCheck(String idCheck) {
		this.idCheck = idCheck;
	}

	public String getPassConfirm() {
		return passConfirm;
	}

	public void setPassConfirm(String passConfirm) {
		this.passConfirm = passConfirm;
	}

	public String getInputKey() {
		return inputKey;
	}

	public void setInputKey(String inputKey) {
		this.inputKey = inputKey;
	}

	public String getEmailKey() {
		return emailKey;
	}

	public void setEmailKey(String emailKey) {
		this.emailKey = emailKey;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getEmailConfirm() {
		return emailConfirm;
	}

	public void setEmailConfirm(String emailConfirm) {
		this.emailConfirm = emailConfirm;
	}

	public String getNewMemPass() {
		return newMemPass;
	}

	public void setNewMemPass(String newMemPass) {
		this.newMemPass = newMemPass;
	}

	public String getNewPassConfirm() {
		return newPassConfirm;
	}

	public void setNewPassConfirm(String newPassConfirm) {
		this.newPassConfirm = newPassConfirm;
	}	
}
