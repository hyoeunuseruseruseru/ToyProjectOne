package com.admin.practice.member.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HashVo {
	
	
	private String digest; 
	private String salt; 
	private int no; //사원번호

}
