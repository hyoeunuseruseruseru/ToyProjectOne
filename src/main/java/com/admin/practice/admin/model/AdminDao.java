package com.admin.practice.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDao {

	List<DailysalesVo> selectDailySales();

	List<WeeklysalesVo> selectWeeklySales();

	List<MonthlysalesVo> selectMonthlySales();

	List<AnnualsalesVo> selectAnnualSales();

}
