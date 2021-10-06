package com.mycompany.webapp.dto;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MemberDetails extends User {
	// Spring Security User 상속받아 로그인한 유저정보에 추가로 원하는 데이터를 넣음
	private static final long serialVersionUID = 1L;
	private int mno;

	public MemberDetails(String mid, String mpassword, boolean menabled, List<GrantedAuthority> mAuthorities, int mno) {
		super(mid, mpassword, menabled, true, true, true, mAuthorities);
		this.mno = mno;
	}

	public int getMno() {
		return mno;
	}
}
