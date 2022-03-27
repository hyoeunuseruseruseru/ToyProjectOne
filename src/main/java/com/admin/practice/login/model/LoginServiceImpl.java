package com.admin.practice.login.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.practice.common.util.Hashing;
import com.admin.practice.member.model.HashVo;
import com.admin.practice.member.model.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {
	
	
		@Autowired
		private LoginDao loginDao;
	
			
		@Override
		public int chklogin(String email, String password) {
			log.info("로그인 확인 처리 email ={}, password={}", email, password);
			//1. 이메일이 존재하는지 확인 
			Integer existingEmail = loginDao.chkEmail(email); 
			
			//1-1. 이메일이 존재할 때
			if(existingEmail>0) {
				log.info("이메일 존재!, LoginServiceImpl");

				//2. 비밀번호가 존재하는 지 확인 
				int no = loginDao.selectNo(email);
				Integer existingPwd = loginDao.countPwd(no);
				
				//2-1. 비밀번호가 존재할 때
				if(existingPwd>0) {
					log.info("비밀번호 존재!");
					//3. 비밀번호가 일치하는지 확인 
					HashVo hashVo = loginDao.selectHash(no);
				    String yourdigest = Hashing.getEncrypt(password,hashVo.getSalt());
				    String Dbdigest = hashVo.getDigest();
				    //3-1. 비밀번호 일치 
				    if(yourdigest.equals(Dbdigest)) {
				    	log.info("로그인 성공,LoginServiceImpl ");
				    	return LOGIN_OK;
				    }else if(!yourdigest.equals(Dbdigest)) {
				    	log.info("비밀번호 불일치, LoginServiceImpl");
				    	return PWD_DISAGREE;
				    }
				//2-2. 비밀번호가 존재하지 않을 때 
				}else {
					log.info("비밀번호가 존재하지 않습니다");
					return PWD_DISAGREE;
				}
			
				
			
			}
				//1-2. 이메일이 존재하지 않을 때	
				log.info("이메일이 존재하지 않음!, LoginServiceImpl");
				return EMAIL_NONE;
			
			
		}
		
		@Override
		public MemberVo selectMember(String email) {
			return loginDao.selectMember(email);
		}

}
