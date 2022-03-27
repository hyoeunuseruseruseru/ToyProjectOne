package com.admin.practice.common.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.admin.practice.member.model.MemberVo;

public class ExcelUtil {
	 public static ByteArrayInputStream createListToExcel
	 (List<String> excelHeader, List<MemberVo> excelTestList) {
	       		//workbook을 생성	
		 	try (Workbook workbook = new HSSFWorkbook()) {
		 	// 2. workbook내에 sheet를 생성합니다.
	            Sheet sheet = workbook.createSheet("직원 정보");
	            Row row;
	            Cell cell;
	            int rowNo = 0;

	            int headerSize = excelHeader.size();

	            // 테이블 헤더 스타일 설정
	            CellStyle headStyle = workbook.createCellStyle();
	            // 경계선 설정
	            headStyle.setBorderTop(BorderStyle.THIN);
	            headStyle.setBorderBottom(BorderStyle.THIN);
	            headStyle.setBorderLeft(BorderStyle.THIN);
	            headStyle.setBorderRight(BorderStyle.THIN);
	            // 색상
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.YELLOW.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            // 헤더 가운데 정렬
	            headStyle.setAlignment(HorizontalAlignment.CENTER);

	            // 헤더 생성
	         // 3. sheet내에 row를 생성합니다.
	            row = sheet.createRow(rowNo++);
	            for (int i=0; i<headerSize; i++) {
	                cell = row.createCell(i);
	                cell.setCellStyle(headStyle);
	                cell.setCellValue(excelHeader.get(i));
	            }

	            // 내용 생성
	         // 4. 하나의 row에 여러개의 cell을 생성합니다.
	            String yourP ="";
	            String yourG = "";
	            for (int j=0; j<excelTestList.size(); j++) {
	                Row dataRow = sheet.createRow(j + 1);
	                int position = excelTestList.get(j).getPosition();
	                int groupNo = excelTestList.get(j).getGroupNo();
	                
	                //부서 groupNo
	                if(groupNo ==1) {
	                	yourG ="인사부";
	                }else if(groupNo ==2) {
	                	yourG = "총무부";
	                }else if(groupNo ==3) {
	                	yourG = "영업부";
	                }else if(groupNo ==4) {
	                	yourG = "기획부";
	                }else if(groupNo ==5) {
	                	yourG = "회계부";
	                }
	                
	                //직급 position
	                if(position==1) {
	                	yourP ="사원";
	                }else if(position ==2) {
	                	yourP = "주임";
	                }else if (position==3) {
	                	yourP = "전임";
	                }else if (position==4) {
	                	yourP = "선임";
	                }else if (position==5) {
	                	yourP = "대리";
	                }else if (position==6) {
	                	yourP = "과장";
	                }else if (position==7) {
	                	yourP = "차장";
	                }else if (position==8) {
	                	yourP = "부장";
	                }else if (position==9) {
	                	yourP = "이사";
	                }else if (position==10) {
	                	yourP = "상무";
	                }else if (position==11) {
	                	yourP = "전무";
	                }else if (position==12) {
	                	yourP = "부사장";
	                }else if (position==13) {
	                	yourP = "사장";
	                }else if (position==14) {
	                	yourP = "부회장";
	                }else if (position==15) {
	                	yourP = "회장";
	                }
	                
	                //고용일 regdate
	                SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
					String date = excelTestList.get(j).getRegdate().toString();
					Date formatDate = newFormat.parse(date);
					String finDate = newFormat.format(formatDate);
					
					//주소 address + addressExtra + addressDetail
					String address = excelTestList.get(j).getAddress()+" "
							+excelTestList.get(j).getAddressExtra()+" "+excelTestList.get(j).getAddressDetail();
				
					//연봉 salary 천단위 콤마 표시
					DecimalFormat decFormat = new DecimalFormat("###,###");
					String salary = decFormat.format(excelTestList.get(j).getSalary());
					
	                dataRow.createCell(0).setCellValue(excelTestList.get(j).getName());
	                dataRow.createCell(1).setCellValue(yourP);
	                dataRow.createCell(2).setCellValue(yourG);
	                dataRow.createCell(3).setCellValue(excelTestList.get(j).getEmail());
	                dataRow.createCell(4).setCellValue(finDate);
	                dataRow.createCell(5).setCellValue(excelTestList.get(j).getNo());
	                dataRow.createCell(6).setCellValue(excelTestList.get(j).getTel());
	                dataRow.createCell(7).setCellValue(address);
	                dataRow.createCell(8).setCellValue(salary);
	            }

	            // Making size of column auto resize to fit with data
	            sheet.autoSizeColumn(0);
	            sheet.autoSizeColumn(1);
	            sheet.autoSizeColumn(2);
	            sheet.autoSizeColumn(3);
	            sheet.autoSizeColumn(4);
	            sheet.autoSizeColumn(5);
	            sheet.autoSizeColumn(6);
	            sheet.autoSizeColumn(7);
	            sheet.autoSizeColumn(8);

	            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	            workbook.write(outputStream);
	            return new ByteArrayInputStream(outputStream.toByteArray());

	        } catch (IOException | ParseException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
}
