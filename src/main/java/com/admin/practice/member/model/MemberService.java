package com.admin.practice.member.model;

import java.util.List;

import com.admin.practice.common.util.SearchVO;

public interface MemberService {
	
	int EMAIL_OK=0;//이메일 써도 됨.
	
	//회원가입 : adminMember 테이블과 Hash테이블에 회원정보, 비밀번호 insert
	int register(MemberVo memberVo, String password);

	//이메일 중복확인 
	Integer checkEmail(String email);

	//회원 전체 조회
	List<MemberVo> selectAllMember(SearchVO searchVO);

	int selectTotalRecord(SearchVO searchVO);

	List<MemberVo> selectAllMember2();

	//회원 프로필 가져오기
	MemberVo selectMember(int no);

	int updateMember(MemberVo memberVo);

	//salary, position 수정
	int updateSalary(MemberVo memberVo);

}
