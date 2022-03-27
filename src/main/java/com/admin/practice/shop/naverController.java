package com.admin.practice.shop;

import java.net.URI;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/naver")
public class naverController {


	@ResponseBody
	@GetMapping("/naverShopping")
	public String naverShopping() {

		String query = "원피스";
		ByteBuffer buffer = StandardCharsets.UTF_8.encode(query);
		String encode = StandardCharsets.UTF_8.decode(buffer).toString();

		URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com").path("/v1/search/shop.json")
				.queryParam("query", encode).queryParam("display", 8).queryParam("start", 1).queryParam("sort", "sim")
				.encode().build().toUri();

		RestTemplate restTemplate = new RestTemplate();

		RequestEntity<Void> req = RequestEntity.get(uri).header("X-Naver-Client-Id", "xU2bYHRLvXES8Y8unoOD")
				.header("X-Naver-Client-Secret", "B0Hnv4tp5x").build();

		ResponseEntity<String> result = restTemplate.exchange(req, String.class);
		log.info(result.getBody());

	

		return result.getBody();
	}

}
