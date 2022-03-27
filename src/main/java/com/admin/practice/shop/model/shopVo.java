package com.admin.practice.shop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class shopVo {
	
	
	private String lprice; //가격
	private String hprice; //뭐냐 
	private String mallName; //몰 이름 
	private String productId; //상품 코드 
	private String productType; //상품 타입
	private String brand; //브랜드 
	private String maker; //메이커 
	private String category1; 
	private String category2; 
	private String category3; 
	private String category4; 
	/* private Integer index; */
    private String title;                   // 상품 명
    private String link;            // 홈페이지 주소 link
    private String image;               // 음식, 가게 이미지 주소 image
    


}
