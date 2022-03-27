package com.admin.practice.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.practice.shop.model.shopVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	
	
	//localhost:9091/admin/shop/view
	@GetMapping("/view")
	public String view() {
		return "/shop/shop";
	}
	
	@ResponseBody
	@PostMapping("/wish")
	public int wish(shopVo vo) {
		log.info("위시리스트에 담기 처리 shopVo ={}",vo);
		
		return 1;
	}

}
