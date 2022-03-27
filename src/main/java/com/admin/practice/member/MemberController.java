package com.admin.practice.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.practice.common.util.ConstUtil;
import com.admin.practice.common.util.PaginationInfo;
import com.admin.practice.common.util.SearchVO;
import com.admin.practice.login.model.LoginService;
import com.admin.practice.member.model.MemberDao;
import com.admin.practice.member.model.MemberService;
import com.admin.practice.member.model.MemberVo;


import ch.qos.logback.classic.Logger;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

//회원 관련 컨트롤러
@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoginService loginService;
	
	//회원 가입 화면_2022-02-17
	//localhost:9091/admin/member/register
	@GetMapping("/register")
	public String register() {
		return "/member/register";
	}
	
	
	
	
	//회원 가입 요청_2022-02-24
	//localhost:9091/admin/member/register
	//requestparam을 통해서 form의 데이터를 가져오기 위해서는 input의 name ="이름"과 맞추면 된다. 
	@RequestMapping("/register-form")
	public String register( @ModelAttribute MemberVo memberVo,@RequestParam String password , Model model) {
		log.info("회원 가입 처리, password={}, MemberVo={}  ", password, memberVo);
		
		String msg = "회원 가입에 실패하였습니다";
		String url = "/member/register";
		
		
		
		int result = memberService.register(memberVo, password);
		if(result>0) {
			
			msg ="회원 가입이 완료되었습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/common/message";
	}
	
	//localhost:9091/admin/member/check-email
	@ResponseBody
	@PostMapping("/check-email")
	public int register(@RequestParam String email) throws Exception {
		log.info("아이디 중복 확인, email = {}",email);
		Integer result = memberService.checkEmail(email);
		
		return result;
	}
	
	//localhost:9091/admin/member/check-email/update
		@ResponseBody
		@PostMapping("/check-email/update")
		public int registerUpdate(@RequestParam String email, @RequestParam int no) throws Exception {
			log.info("정보수정,아이디 중복 확인, email = {}, no={}",email, no);
		    MemberVo vo = memberService.selectMember(no);
		    if(email.equals(vo.getEmail())) {
		    	return MemberService.EMAIL_OK;
		    }
			Integer result = memberService.checkEmail(email);
			
			return result;
		}
	
	
	
	//localhost:9091/admin/member/all-member-view
	@RequestMapping("/all-member-view")
	public String main_Post(@ModelAttribute SearchVO searchVO, Model model) {
		// 1
		log.info("회원 목록 화면, searchVo={}", searchVO);
		// 2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());

		// 3
		searchVO.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		log.info("값 셋팅 후 searchVo={}", searchVO);

		List<MemberVo> list = memberService.selectAllMember(searchVO);
		log.info("전체조회 결과 list.size={}", list.size());
		for (MemberVo vo : list) {
			log.info(vo.toString());
		}
		// 4
		int totalRecord = memberService.selectTotalRecord(searchVO);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		return "/admin/memberTable";
	}
	
	
	//localhost:9091/admin/member/profile?no=
	@RequestMapping("/profile")
	public String profile(@RequestParam String no, Model model) {
		log.info("프로필 화면 처리,no={}",no);
		int yourNo = Integer.parseInt(no);
		//사원번호를 통해서 회원 정보 가져오기 
		MemberVo memberVo = memberService.selectMember(yourNo);
		log.info("memberVo={}",memberVo);
		model.addAttribute("vo",memberVo);
		
		return "/admin/profile";
	}
	
	//localhost:9091/admin/member/myprofile
	@GetMapping("/myprofile")
	public String myprofile() {
		log.info("나의 프로필화면 처리");
		return "/admin/myProfile";
	}
	
	//localhost:9091/admin/member/myprofile/update-view
	@GetMapping("/myprofile/update-view")
	public String myprofileupdateview() {
		log.info("나의 프로필 수정 화면 처리");
		return "/admin/myProfileUpdate";
	}
	
		//localhost:9091/admin/member/update-form
		//requestparam을 통해서 form의 데이터를 가져오기 위해서는 input의 name ="이름"과 맞추면 된다. 
		@RequestMapping("/update-form")
		public String updateForm( @ModelAttribute MemberVo memberVo,@RequestParam String password , Model model) {
			log.info("정보 수정 처리, password={}, MemberVo={}  ", password, memberVo);
			
			
			//email 가져오기 
			MemberVo vo = memberService.selectMember(memberVo.getNo());
			
			//비밀번호 일치하는지 확인
			int existingPwd = loginService.chklogin(vo.getEmail(), password);
			
			String url = "/member/myprofile/update-view";
			if(existingPwd==LoginService.PWD_DISAGREE) {
				model.addAttribute("msg", "비밀번호가 잘못 입력되었습니다.");
				model.addAttribute("url",url);
				return "common/message";
			}

			String msg = "정보 수정에 실패하였습니다";
			
			
			int result = memberService.updateMember(memberVo);
			if(result>0) {
				
				msg ="정보 수정이 완료되었습니다";
				url ="/member/myprofile";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/common/message";
		}
	
		
		//localhost:9091/admin/member/update-salary
				//requestparam을 통해서 form의 데이터를 가져오기 위해서는 input의 name ="이름"과 맞추면 된다. 
				@ResponseBody
				@PostMapping("/update-salary")
				public int updateSalary( @ModelAttribute MemberVo memberVo , Model model) {
					log.info("정보 수정 처리2, MemberVo={}  ", memberVo);
					
					
					int result = memberService.updateSalary(memberVo);
					
					return result;
				}
	
	
	
	
}
