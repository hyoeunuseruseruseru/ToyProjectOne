package com.admin.practice.login.model;

import org.apache.ibatis.annotations.Mapper;

import com.admin.practice.member.model.HashVo;
import com.admin.practice.member.model.MemberVo;

@Mapper
public interface LoginDao {

	//이메일 있는지 없는지 확인
	Integer chkEmail(String email);

	//이메일을 통해서 사원번호 가져오기
	int selectNo(String email);

	//비밀번호가 존재하는지 확인
	Integer countPwd(int no);

	//해시 가져오기
	HashVo selectHash(int no);

	//회원 정보 가져오기
	MemberVo selectMember(String email);

}
