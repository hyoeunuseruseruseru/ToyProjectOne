package com.admin.practice.member.model;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.practice.common.util.Hashing;
import com.admin.practice.common.util.SearchVO;
@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	
	@Override
	public int register(MemberVo memberVo, String password) {
		log.info("회원가입 처리(serviceImpl)");
		
		//회원정보를 먼저 넣는다. 
		int result =  memberDao.InsertAdminMember(memberVo);
		if(result > 0) {
			//솔트 생성 
			String salt = Hashing.generateSalt();
			HashVo hashVo = new HashVo();
			hashVo.setSalt(salt);
			
			//솔트와 평문 넣어서 다이제스트 생성 
			hashVo.setDigest(Hashing.getEncrypt(password, salt));
			
			int no = memberDao.selectAdminMemberNo(memberVo.getEmail());
			log.info("no={}",no);
			hashVo.setNo(no);
			log.info("hashVo={}",hashVo);
			
			result = memberDao.InsertHash(hashVo);
		}
		return result; 
	
	}
	
	@Override
	public Integer checkEmail(String email) {
		log.info("아이디 중복 확인(serviceImpl)");
		
		return memberDao.checkEmail(email);
	}
	
	
	@Override
	public List<MemberVo> selectAllMember(SearchVO searchVO) {
		return memberDao.selectAllMember(searchVO);
	}
	
	
	@Override
	public int selectTotalRecord(SearchVO searchVO) {
		return memberDao.selectTotalRecord(searchVO);
	}
	
	@Override
	public List<MemberVo> selectAllMember2() {
		// TODO Auto-generated method stub
		return memberDao.selectAllMember2();
	}
	
	@Override
	public MemberVo selectMember(int no) {
		return memberDao.selectMember(no);
	}
	
	@Override
	public int updateMember(MemberVo memberVo) {
		log.info("정보 수정 처리, MemberServiceImpl, memberVo={}",memberVo);
		
		return memberDao.updateMember(memberVo);
	}
	
	@Override
	public int updateSalary(MemberVo memberVo) {
		log.info("정보수정 처리 2, MemberServiceImpl, memberVo={}", memberVo);
		return memberDao.updateSalary(memberVo);
	}

}
