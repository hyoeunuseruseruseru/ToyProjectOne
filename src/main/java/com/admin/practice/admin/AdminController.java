package com.admin.practice.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.practice.admin.model.AdminService;
import com.admin.practice.admin.model.AnnualsalesVo;
import com.admin.practice.admin.model.DailysalesVo;
import com.admin.practice.admin.model.MonthlysalesVo;
import com.admin.practice.admin.model.WeeklysalesVo;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/setting")
public class AdminController {
	
	@Autowired
	private AdminService adminService; 
	
	//localhost:9091/admin/setting/chart
	@GetMapping("/chart")
	public String chartPage() {
		log.info("차트 화면 처리 Controller");
		return "/admin/chart";
	}
	
	//localhost:9091/admin/setting/chart/daily
	@GetMapping("/chart/daily")
	@ResponseBody
	public String daily() throws ParseException {
		
		log.info("일간 매출 처리");
		//1. 일간 매출 정보 받아오기 
				List<DailysalesVo> list = adminService.selectDailySales();
				log.info("dailysalesVo={}",list);
				
				//1. Gson 객체 생성하기 
				Gson gson = new Gson();
				JsonArray jArray = new JsonArray();
				
				Iterator<DailysalesVo> it = list.iterator();
				while(it.hasNext()) {
					DailysalesVo vo = it.next();
					//Json 생성하기 
					JsonObject object = new JsonObject();
					int sum = vo.getSum();
					//날짜 포맷하기 
					SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
					String date = vo.getSDate().toString();
					Date formatDate = newFormat.parse(date);
					String finDate = newFormat.format(formatDate);
					
					object.addProperty("sum", sum);
					object.addProperty("date", finDate);
					log.info("object={}",object);
					jArray.add(object);
				}
				
				//jsonArray를 json문자열로 변환 
				String json = gson.toJson(jArray);
				log.info("json={}",json);
				
				return json;
	}
	
	//localhost:9091/admin/setting/chart/weekly
		@GetMapping("/chart/weekly")
		@ResponseBody
		public String weekly() throws ParseException {
			
			log.info("주간 매출 처리");
			//1. 주간 매출 정보 받아오기 
					List<WeeklysalesVo> list = adminService.selectWeeklySales();
					log.info("WeeklysalesVo={}",list);
					
					//1. Gson 객체 생성하기 
					Gson gson = new Gson();
					JsonArray jArray = new JsonArray();
					
					Iterator<WeeklysalesVo> it = list.iterator();
					while(it.hasNext()) {
						WeeklysalesVo vo = it.next();
						//Json 생성하기 
						JsonObject object = new JsonObject();
						int sum = vo.getSum();
						int week = vo.getWeek();
						
						
						object.addProperty("sum", sum);
						object.addProperty("week", week);
						log.info("object={}",object);
						jArray.add(object);
					}
					
					//jsonArray를 json문자열로 변환 
					String json = gson.toJson(jArray);
					log.info("json={}",json);
					
					return json;
		}
		
		
		//localhost:9091/admin/setting/chart/monthly
				@GetMapping("/chart/monthly")
				@ResponseBody
				public String monthly() throws ParseException {
					
					log.info("월간 매출 처리");
					//1. 주간 매출 정보 받아오기 
							List<MonthlysalesVo> list = adminService.selectMonthlySales();
							log.info("MonthlysalesVo={}",list);
							
							//1. Gson 객체 생성하기 
							Gson gson = new Gson();
							JsonArray jArray = new JsonArray();
							
							Iterator<MonthlysalesVo> it = list.iterator();
							while(it.hasNext()) {
								MonthlysalesVo vo = it.next();
								//Json 생성하기 
								JsonObject object = new JsonObject();
								int sum = vo.getSum();
								int month = vo.getMonth();
								String Ymonth = Integer.toString(month);
								String StMonth = Ymonth.substring(4);
								String finMonth = StMonth+" 월";
								object.addProperty("sum", sum);
								object.addProperty("month", finMonth);
								log.info("object={}",object);
								jArray.add(object);
							}
							
							//jsonArray를 json문자열로 변환 
							String json = gson.toJson(jArray);
							log.info("json={}",json);
							
							return json;
				}
				
				//localhost:9091/admin/setting/chart/total
				@GetMapping("/chart/total")
				@ResponseBody
				public String total() throws ParseException {
					
					log.info("월간 매출 처리");
					//1. 주간 매출 정보 받아오기 
							List<AnnualsalesVo> list = adminService.selectAnnualSales();
							log.info("AnnualsalesVo={}",list);
							
							//1. Gson 객체 생성하기 
							Gson gson = new Gson();
							JsonArray jArray = new JsonArray();
							
							Iterator<AnnualsalesVo> it = list.iterator();
							while(it.hasNext()) {
								AnnualsalesVo vo = it.next();
								//Json 생성하기 
								JsonObject object = new JsonObject();
								int sum = vo.getSum();
								int year = vo.getYear();
								object.addProperty("sum", sum);
								object.addProperty("year", year);
								log.info("object={}",object);
								jArray.add(object);
							}
							
							//jsonArray를 json문자열로 변환 
							String json = gson.toJson(jArray);
							log.info("json={}",json);
							
							return json;
				}
	

}
