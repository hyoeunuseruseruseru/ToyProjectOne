<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%> 
	<script src="<c:url value='/resources/js/demo/myChartTwo.js'/>"></script>				
					<div class="col-xl-8 col-lg-7">
                             <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary" id="yourtitle">매출 그래프</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">매출 보기</div>
                                            <a class="dropdown-item" href="#" id="daily">일간 매출</a>
                                            <a class="dropdown-item" href="#" id ="weekly" >주간 매출</a>
                                            <a class="dropdown-item" href="#" id="monthly">월간 매출</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#" id="total">전체 매출</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myChartTwo"></canvas>
                                     
                                    </div>
                                </div>
                                
                            </div>
                            
                               
                        </div>


<%@ include file="../layout/footer.jsp"%> 