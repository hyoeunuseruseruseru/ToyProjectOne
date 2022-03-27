package com.admin.practice.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
public class MainController {
	
	//메인 페이지 화면_2022-02-17
	//localhost:9091/admin/main/index
	@GetMapping("/index")
	public String index() {
		return "index";
	}

}
