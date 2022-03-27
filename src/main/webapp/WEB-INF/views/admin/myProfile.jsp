<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Profile</h1>
                    </div>

                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                월급</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sessionScope.salary /12}" />

                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                연봉</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sessionScope.salary}" />
											</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Tasks Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">부서
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                    <c:choose>
														<c:when test="${sessionScope.groupNo eq '1'}">
												    인사부
												    </c:when>
														<c:when test="${sessionScope.groupNo eq '2'}">
												     총무부
												    </c:when>
														<c:when test="${sessionScope.groupNo eq '3'}">
												     영업부
												    </c:when>
														<c:when test="${sessionScope.groupNo eq '4'}">
												     기획부
												    </c:when>
														<c:when test="${sessionScope.groupNo eq '5'}">
												    회계부
												    </c:when>
													</c:choose>
                                                    </div>
                                                </div>
                                                <!-- <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                쪽지</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					 <!-- 시작-->
					 <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                이름</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${sessionScope.name}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                사원번호</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${sessionScope.no}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                        <!-- Earnings (Annual) Card Example -->
                         <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">tel
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                      ${sessionScope.tel }
                                                    </div>
                                                </div>
                                                <!-- <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Tasks Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">직급
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                    <c:choose>
													<c:when test="${sessionScope.position eq '1'}">
																						  사원
																						</c:when>
													<c:when test="${sessionScope.position eq '2'}">
																						  주임
																						</c:when>
													<c:when test="${sessionScope.position eq '3'}">
																						  전임
																						</c:when>
													<c:when test="${sessionScope.position eq '4'}">
																						  선임
																						</c:when>
													<c:when test="${sessionScope.position eq '5'}">
																						  대리
																						</c:when>
													<c:when test="${sessionScope.position eq '6'}">
																						  과장
																						</c:when>
													<c:when test="${sessionScope.position eq '7'}">
																						  차장
																						</c:when>
													<c:when test="${sessionScope.position eq '8'}">
																						  부장
																						</c:when>
													<c:when test="${sessionScope.position eq '9'}">
																						  이사
																						</c:when>
													<c:when test="${sessionScope.position eq '10'}">
																						  상무
																						</c:when>
													<c:when test="${sessionScope.position eq '11'}">
																						  전무
																						</c:when>
													<c:when test="${sessionScope.position eq '12'}">
																						  부사장
																						</c:when>
													<c:when test="${sessionScope.position eq '13'}">
																						  사장
																						</c:when>
													<c:when test="${sessionScope.position eq '14'}">
																						  부회장
																						</c:when>
													<c:when test="${sessionScope.position eq '15'}">
																						  회장
																						</c:when>
												</c:choose>
                                                    </div>
                                                </div>
                                                <!-- <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                       
                    </div>
					 
					 
					 
					 <!-- 끝-->
					 
                    <div class="row">

                        <div class="col-lg-6">

                            <!-- Default Card Example -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    주소
                                </div>
                                <div class="card-body">
                                    ${sessionScipe.zipcode } ${sessionScope.address }${sessionScope.addressDetail }${sessionScope.addressExtra }
                                </div>
                            </div>

                            

                        </div>

                      
                    </div>
					<a href='<c:url value="/member/myprofile/update-view"/>' class="btn btn-secondary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">정보수정</span>
                                    </a>
                </div>
                <!-- /.container-fluid -->
				 
         	   </div>
            <!-- End of Main Content -->





<%@ include file="../layout/footer.jsp"%> 