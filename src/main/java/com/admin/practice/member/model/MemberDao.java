package com.admin.practice.member.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.admin.practice.common.util.SearchVO;



@Mapper
public interface MemberDao {

	int InsertAdminMember(MemberVo memberVo);

	//이메일 중복 확인 
	Integer checkEmail(String email);
	
	//다이제스트, 솔트, 회원 번호 insert
	int InsertHash(HashVo hashVo);

	int selectAdminMemberNo(String email);
	
	//회원 전체 조회 
	List<MemberVo> selectAllMember(SearchVO searchVO);

	int selectTotalRecord(SearchVO searchVO);

	List<MemberVo> selectAllMember2();

	MemberVo selectMember(int no);

	int updateMember(MemberVo memberVo);

	int updateSalary(MemberVo memberVo);

}
