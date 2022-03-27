package com.admin.practice.common.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.admin.practice.member.model.MemberService;
import com.admin.practice.member.model.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/api/v1/excel")
@RestController
public class ExcelDownload {
	
		@Autowired
		private MemberService memberService;
	
	
	 	@GetMapping("/admin-member")
	    public void excelDownload(HttpServletResponse response, SearchVO searchVo) throws IOException {
	        // Header, ContentType 설정, excel 파일명 변경가능
	        response.setHeader("Content-Disposition", "attachment;filename=staffRoster.xlsx");
	        response.setContentType("application/octet-stream");

	        // 엑셀 파일 헤더
	        List<String> header = Arrays.asList("이름", "직급", "부서", "이메일","고용일","사원번호","전화번호","주소","연봉");

	        // 엑셀 파일로 만들 리스트
	        
	        
	        List<MemberVo> list2 = memberService.selectAllMember2();
	        log.info("액셀파일에 넣을 리스트 ={}",list2);
	       

	        ByteArrayInputStream stream = ExcelUtil.createListToExcel(header, list2);
	        IOUtils.copy(stream, response.getOutputStream());
	    }
	
	
	
}
