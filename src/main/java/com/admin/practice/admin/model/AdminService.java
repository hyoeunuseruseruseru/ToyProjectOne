package com.admin.practice.admin.model;

import java.util.List;

public interface AdminService {

	List<DailysalesVo> selectDailySales();

	List<WeeklysalesVo> selectWeeklySales();

	List<MonthlysalesVo> selectMonthlySales();

	List<AnnualsalesVo> selectAnnualSales();

}
