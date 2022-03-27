/**
 * 
 */
start();


function pop(id) {
	var yourid = $(id).parents("#frm1");
	var jData = yourid.serialize();



	$.ajax({
		url: "/admin/shop/wish",
		type: "post",
		dataType: "json",
		data:  jData ,
		success: function(data) {
			alert(data);
		},
		error: function(xhr, textStatus) {

			console.log(xhr.responseText);

			console.log("에러");

			return;

		}
	});//ajax


}

function start() {
	$.ajax({
		url: "/admin/naver/naverShopping",
		type: 'get',
		dataType: 'json',
		success: function(data) {

			var jsonObject = JSON.stringify(data);
			var jData = JSON.parse(jsonObject);


			resultHtml(jData);

		},

		error: function(xhr, textStatus) {

			console.log(xhr.responseText);

			console.log("에러");

			return;

		}

	});//ajax
}



function resultHtml(data) {




	var html = "";

	$.each(data, function(key, value) { //  { logList:[{}], command:{} } 이런구조임
		if (key == "items") {
			for (var i = 0; i < value.length; i++) {
				html += "<div class='card h-100'>";
				html += "<form id ='frm1'>";
				html += "<img class='card-img-top' src='" + value[i].image + "' alt='...' />";
				html += "<div class='card-body p-4'>";
				html += "<div class='text-center'>";
				html += "<h5 class='fw-bolder' id='title'>" + value[i].title + "</h5>";
				html +=  value[i].lprice+" 원<br>";
				html += "<input type ='hidden' name ='title' value ='" + value[i].title + "'>";
				html += "<input type ='hidden' name ='link' value ='" + value[i].link + "'>";
				html += "<input type ='hidden' name ='image' value ='" + value[i].image + "'>";
				html += "<input type ='hidden' name ='lprice' value ='" + value[i].lprice + "'>";
				html += "<input type ='hidden' name ='hprice' value ='" + value[i].hprice + "'>";
				html += "<input type ='hidden' name ='mallName' value ='" + value[i].mallName + "'>";
				html += "<input type ='hidden' name ='productId' value ='" + value[i].productId + "'>";
				html += "<input type ='hidden' name ='brand' value ='" + value[i].brand + "'>";
				html += "<input type ='hidden' name ='maker' value ='" + value[i].maker + "'>";
				html += "<input type ='hidden' name ='category1' value ='" + value[i].category1 + "'>";
				html += "<input type ='hidden' name ='category2' value ='" + value[i].category2 + "'>";
				html += "<input type ='hidden' name ='category3' value ='" + value[i].category3+ "'>";
				html += "<input type ='hidden' name ='category4' value ='" + value[i].category4 + "'>";
				html += "<input type ='hidden' name ='productType' value ='" + value[i].productType + "'>";
			/*	html += "<a  href='javascript:;' onclick ='pop(this);'>누르기</a>";*/
				html += "</div>";
				html += "</div>";
				html += "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>";
				html += "<div class='text-center'>";
				html += "<a class='btn btn-outline-dark mt-auto' href=''>View options</a>";
				html += "</div>";
				html += "</div>";
				html += "</form>"
				html += "</div>";

			}
		}

		$("#start").append(html);
	});


	/*	
			for (var i = 0; i < data.length; i++) {
				var d = jData[i];
				html += "<img class='card-img-top' src='"+value[i].image+"' alt='...' />";
				html += "<td>" + d.title + "</td>";
				html += "</tr>";
			
				
	
			}
		*/



	$("#display").empty();
	$("#display").append(html);

}


