package com.admin.practice.login;

import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.practice.login.model.LoginService;
import com.admin.practice.member.model.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/login")
public class LoginController {
	
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/message")
	public String message() {
		
		return "/common/message";
	}
	
	//localhost:9091/admin/login/view
	@GetMapping("/view")
	public String loginview() {
		log.info("로그인 화면처리");
		return "/member/login";
	}
	
	//localhost:9091/admin/login/sign-in
	@PostMapping("/sign-in")
	public String login(@RequestParam String email, @RequestParam String password
			,@RequestParam(required = false) String chkSave, HttpServletRequest request, HttpServletResponse response, 
			Model model) throws NoSuchAlgorithmException {
		
		log.info("로그인 처리, email={},password={}",email, password);
		//1. 로그인 성공여부 확인 
		int result = loginService.chklogin(email, password);
		
		String msg = "";
		String url = "/login/view";
		
		//1-1. 로그인 성공 시 
		if(result== loginService.LOGIN_OK) {
			//세션에 로그인 한 회원 정보 저장 
			
			MemberVo memberVo = loginService.selectMember(email);
			HttpSession session = request.getSession();
			  
			    
			
			session.setAttribute("name", memberVo.getName());
			session.setAttribute("email", memberVo.getEmail());
			session.setAttribute("groupNo", memberVo.getGroupNo());
			session.setAttribute("no", memberVo.getNo());
			session.setAttribute("position", memberVo.getPosition());
			session.setAttribute("regdate", memberVo.getRegdate());
			session.setAttribute("address", memberVo.getAddress());
			session.setAttribute("addressDetail", memberVo.getAddressDetail());
			session.setAttribute("addressExtra", memberVo.getAddressExtra());
			session.setAttribute("zipcode", memberVo.getZipcode());
			session.setAttribute("tel", memberVo.getTel());
			session.setAttribute("salary", memberVo.getSalary());
			
			msg = memberVo.getName()+"님, 환영합니다";
			url = "/main/index";
			//쿠키 체크 여부 확인
			Cookie ck = new Cookie("ck_email",  memberVo.getEmail());
			ck.setPath("/");

			if (chkSave != null) {
				ck.setMaxAge(1000 * 24 * 60 * 60);
				response.addCookie(ck);
			} else {
				ck.setMaxAge(0); // 쿠키 제거
				response.addCookie(ck);
			}
			
		//1-2. 로그인 실패 시 	
		}else if(result ==loginService.EMAIL_NONE) {
			msg = "존재하지 않는 아이디입니다. 다시 입력해주세요";
		}else if(result == loginService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다. 다시 입력해주세요";
		}
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		
		
		return"/common/message";
		
		
		
		
	}
	
	//localhost:9091/admin/login/logout
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		log.info("로그 아웃 처리 ");
	
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("groupNo");
		session.removeAttribute("no");
		session.removeAttribute("position");
		session.removeAttribute("regdate");
		session.removeAttribute("address");
		session.removeAttribute("addressDetail");
		session.removeAttribute("addressExtra");
		session.removeAttribute("zipcode");
		session.removeAttribute("tel");
		session.removeAttribute("salary");
		
		String msg ="로그아웃처리가 되었습니다.";
		String url = "/login/view";
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		
		return "/common/message";
	}
	

}
