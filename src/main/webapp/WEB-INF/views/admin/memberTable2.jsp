<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- 다시 시작 -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800"></h1>
	<p class="mb-4">
		<c:if test="${!empty param.searchKeyword }">
							검색어 : ${param.searchKeyword },  
							${pagingInfo.totalRecord} 건 검색되었습니다. 
						</c:if>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">직원 조회</h6>
		</div>
		<div class="card-body">
			<div class="container">
				<h2>Hover Rows</h2>
				<p>The .table-hover class enables a hover state (grey background
					on mouse over) on table rows:</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>이름</th>
							<th>직급</th>
							<th>부서</th>
							<th>이메일</th>
							<th>고용일</th>
							<th>사원번호</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>연봉</th>
							<th><a href='<c:url value ="/api/v1/excel/admin-member"/>'>
									액셀 다운</a>
							<th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5">데이터가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<!--게시판 내용 반복문 시작  -->
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.name}</td>

									<td><c:choose>
											<c:when test="${vo.position eq '1'}">
													  사원
													</c:when>
											<c:when test="${vo.position eq '2'}">
													  주임
													</c:when>
											<c:when test="${vo.position eq '3'}">
													  전임
													</c:when>
											<c:when test="${vo.position eq '4'}">
													  선임
													</c:when>
											<c:when test="${vo.position eq '5'}">
													  대리
													</c:when>
											<c:when test="${vo.position eq '6'}">
													  과장
													</c:when>
											<c:when test="${vo.position eq '7'}">
													  차장
													</c:when>
											<c:when test="${vo.position eq '8'}">
													  부장
													</c:when>
											<c:when test="${vo.position eq '9'}">
													  이사
													</c:when>
											<c:when test="${vo.position eq '10'}">
													  상무
													</c:when>
											<c:when test="${vo.position eq '11'}">
													  전무
													</c:when>
											<c:when test="${vo.position eq '12'}">
													  부사장
													</c:when>
											<c:when test="${vo.position eq '13'}">
													  사장
													</c:when>
											<c:when test="${vo.position eq '14'}">
													  부회장
													</c:when>
											<c:when test="${vo.position eq '15'}">
													  회장
													</c:when>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${vo.groupNo eq '1'}">
		                                    			인사부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '2'}">
		                                    			총무부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '3'}">
		                                    			영업부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '4'}">
		                                    			기획부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '5'}">
		                                    			회계부
		                                    		</c:when>
										</c:choose></td>
									<td>${vo.email}</td>
									<td><fmt:formatDate value="${vo.regdate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${vo.no}</td>
									<td>${vo.tel }</td>
									<td>${vo.address }${vo.addressDetail }${vo.addressExtra }</td>
									<td>${vo.salary }
									<td>
									<td class="dropdown">
										<button class="dropbtn">
											<span class="dropbtn_icon">more_horiz</span>

										</button>
										<div class="dropdown-content">
											<input type="hidden" id="yourNo" value="${vo.no}"> <a
												href="javascript:void(0);" onclick="popup();">프로필</a> <a
												href="#">쪽지 보내기</a>
										</div>

									</td>
								</tr>
							</c:forEach>
							<!--반복처리 끝  -->
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>


<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800"></h1>
	<p class="mb-4">
		<c:if test="${!empty param.searchKeyword }">
							검색어 : ${param.searchKeyword },  
							${pagingInfo.totalRecord} 건 검색되었습니다. 
						</c:if>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">직원 조회</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>이름</th>
							<th>직급</th>
							<th>부서</th>
							<th>이메일</th>
							<th>고용일</th>
							<th>사원번호</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>연봉</th>
							<th><a href='<c:url value ="/api/v1/excel/admin-member"/>'>
									액셀 다운</a>
							<th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5">데이터가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<!--게시판 내용 반복문 시작  -->
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.name}</td>

									<td><c:choose>
											<c:when test="${vo.position eq '1'}">
													  사원
													</c:when>
											<c:when test="${vo.position eq '2'}">
													  주임
													</c:when>
											<c:when test="${vo.position eq '3'}">
													  전임
													</c:when>
											<c:when test="${vo.position eq '4'}">
													  선임
													</c:when>
											<c:when test="${vo.position eq '5'}">
													  대리
													</c:when>
											<c:when test="${vo.position eq '6'}">
													  과장
													</c:when>
											<c:when test="${vo.position eq '7'}">
													  차장
													</c:when>
											<c:when test="${vo.position eq '8'}">
													  부장
													</c:when>
											<c:when test="${vo.position eq '9'}">
													  이사
													</c:when>
											<c:when test="${vo.position eq '10'}">
													  상무
													</c:when>
											<c:when test="${vo.position eq '11'}">
													  전무
													</c:when>
											<c:when test="${vo.position eq '12'}">
													  부사장
													</c:when>
											<c:when test="${vo.position eq '13'}">
													  사장
													</c:when>
											<c:when test="${vo.position eq '14'}">
													  부회장
													</c:when>
											<c:when test="${vo.position eq '15'}">
													  회장
													</c:when>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${vo.groupNo eq '1'}">
		                                    			인사부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '2'}">
		                                    			총무부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '3'}">
		                                    			영업부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '4'}">
		                                    			기획부
		                                    		</c:when>
											<c:when test="${vo.groupNo eq '5'}">
		                                    			회계부
		                                    		</c:when>
										</c:choose></td>
									<td>${vo.email}</td>
									<td><fmt:formatDate value="${vo.regdate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${vo.no}</td>
									<td>${vo.tel }</td>
									<td>${vo.address }${vo.addressDetail }${vo.addressExtra }</td>
									<td>${vo.salary }
									<td>
									<td class="dropdown">
										<button class="dropbtn">
											<span class="dropbtn_icon">more_horiz</span>

										</button>
										<div class="dropdown-content">
											<input type="hidden" id="yourNo" value="${vo.no}"> <a
												href="javascript:void(0);" onclick="popup();">프로필</a> <a
												href="#">쪽지 보내기</a>
										</div>

									</td>
								</tr>
							</c:forEach>
							<!--반복처리 끝  -->
						</c:if>
					</tbody>
				</table>

			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>






<%@ include file="../layout/memberTableFooter.jsp"%>
