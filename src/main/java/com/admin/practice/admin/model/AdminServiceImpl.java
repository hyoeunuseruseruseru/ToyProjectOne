package com.admin.practice.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
		public List<DailysalesVo> selectDailySales() {
			log.info("일간 매출 처리(AdminServiceImpl)");
		
			return adminDao.selectDailySales();
		}
	
	@Override
	public List<WeeklysalesVo> selectWeeklySales() {
		log.info("주간 매출 처리 (adminServiceImpl)");
		return adminDao.selectWeeklySales();
	}
	
	@Override
	public List<MonthlysalesVo> selectMonthlySales() {
		log.info("월간 매출 처리 (adminServiceImpl)");
		return adminDao.selectMonthlySales();
	}
	
	@Override
	public List<AnnualsalesVo> selectAnnualSales() {
		log.info("전체 매출 처리 (adminServiceImpl)");
		return adminDao.selectAnnualSales();
	}
	
	
	
}
