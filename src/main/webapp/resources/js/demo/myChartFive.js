/*// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
*/

$('#total').on('click', function() {
	$.ajax({
		url: "/admin/setting/chart/total",
		type: 'get',
		dataType: 'json',
		success: function(data) {
			mylineChart.destroy();
			$("#yourtitle").html('전체 매출');
			var jsonObject = JSON.stringify(data);
			var jData = JSON.parse(jsonObject);

			var labelList = new Array();
			var valueList = new Array();


			for (var i = 0; i < jData.length; i++) {
				var d = jData[i];
				labelList.push(d.year + ' 년');
				var value = d.sum;
				valueList.push(value);

			}


			var yourData = {

				labels: labelList,
				datasets: [{
					label: "전체 매출",
					lineTension: 0.3,
					backgroundColor: "rgba(78, 115, 223, 0.05)",
					borderColor: "rgba(78, 115, 223, 1)",
					pointRadius: 3,
					pointBackgroundColor: "rgba(78, 115, 223, 1)",
					pointBorderColor: "rgba(78, 115, 223, 1)",
					pointHoverRadius: 3,
					pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
					pointHoverBorderColor: "rgba(78, 115, 223, 1)",
					pointHitRadius: 10,
					pointBorderWidth: 2,
					data: valueList,
				}],

			}//yourData


			// 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
			mylineChart = new Chart(myChartTwo, {
				type: 'line',
				data: yourData,
				options: {
					maintainAspectRatio: false,
					layout: {
						padding: {
							left: 10,
							right: 25,
							top: 25,
							bottom: 0
						}
					},
					scales: {
						xAxes: [{
							time: {
								unit: 'date'
							},
							gridLines: {
								display: false,
								drawBorder: false
							},
							ticks: {
								maxTicksLimit: 7
							}
						}],
						yAxes: [{
							ticks: {
								maxTicksLimit: 5,
								padding: 10,
								// Include a dollar sign in the ticks
								callback: function(value, index, values) {
									return '$' + number_format(value);
								}
							},
							gridLines: {
								color: "rgb(234, 236, 244)",
								zeroLineColor: "rgb(234, 236, 244)",
								drawBorder: false,
								borderDash: [2],
								zeroLineBorderDash: [2]
							}
						}],
					},
					legend: {
						display: false
					},
					tooltips: {
						backgroundColor: "rgb(255,255,255)",
						bodyFontColor: "#858796",
						titleMarginBottom: 10,
						titleFontColor: '#6e707e',
						titleFontSize: 14,
						borderColor: '#dddfeb',
						borderWidth: 1,
						xPadding: 15,
						yPadding: 15,
						displayColors: false,
						intersect: false,
						mode: 'index',
						caretPadding: 10,
						callbacks: {
							label: function(tooltipItem, chart) {
								var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
								return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
							}
						}//callbacks
					}//tooltips
				}//options

			});//myChart


		}//성공시
	});//ajax
});//daily
	



