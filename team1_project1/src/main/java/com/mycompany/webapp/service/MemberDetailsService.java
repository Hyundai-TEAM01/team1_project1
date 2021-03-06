package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDAO;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.MemberDetails;

@Service
public class MemberDetailsService implements UserDetailsService {
	// Spring Security User 상속받아 로그인한 유저정보에 추가로 원하는 데이터를 넣음
	private static final Logger logger = LoggerFactory.getLogger(MemberDetailsService.class);

	@Resource
	MemberDAO memberDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Member member = memberDAO.getLoginMember(username);
		if (member == null) {
			throw new UsernameNotFoundException(username);
		}
		logger.info(member.toString());
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(member.getMrole()));

		MemberDetails memberDetails = new MemberDetails(member.getMid(), member.getMpassword(), member.isMenable(),
				authorities, member.getMno(), member.getMphone(),member.getMemail(), member.getMpoint(), member.getMname());

		return memberDetails;
	}

}
