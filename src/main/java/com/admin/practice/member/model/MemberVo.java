package com.admin.practice.member.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVo {
	
	
	    
	    private int no; // 사원 번호 
	    private String name; //이름 
	    private Timestamp regdate; // 가입일 
	    private int groupNo; //부서 번호 
	    private int position; // 직책 
	    private String email; // 이메일 
	    
	    private String address; //주소
	    private String addressDetail; //상세 주소
	    private String  zipcode; //우편번호 
	    private String addressExtra;// 참고 항목 
	    private String tel; //전화번호
	    private int salary; //연봉
	    




}
