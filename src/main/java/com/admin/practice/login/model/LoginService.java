package com.admin.practice.login.model;

import com.admin.practice.member.model.MemberVo;

public interface LoginService {
	
	//로그인 시 필요한 상수 
	int LOGIN_OK=1; //로그인 성공 
	int PWD_DISAGREE=2; //비밀번호 불일치
	int EMAIL_NONE =3; // 존재하지 않는 아이디 
	
	//로그인 성공여부 확인
	int chklogin(String email, String password);
	
	//회원정보 가져오기
	MemberVo selectMember(String email);

}
