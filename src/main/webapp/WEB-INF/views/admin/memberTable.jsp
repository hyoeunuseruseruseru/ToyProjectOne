<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- 다시 시작 -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800"></h1>
	<p class="mb-4">
		
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">직원 조회</h6>
		</div>
		<div class="card-body">
			<div class="container">
			<c:if test="${!empty param.searchKeyword }">
				<h2>${param.searchKeyword } 검색</h2>
				<p>	${pagingInfo.totalRecord} 건 검색되었습니다. 
						</p></c:if>
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
							<th><th>
							
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
									<td>${vo.address } <br> ${vo.addressDetail }${vo.addressExtra }</td>
									<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${vo.salary}" />
									<td>
									<td class="dropdown">
										<button class="dropbtn">
											<span class="dropbtn_icon">more_horiz</span>

										</button>
										<div class="dropdown-content">
											<a href="javascript:;" onclick="popup(${vo.no});">프로필</a> <a
												href="#">쪽지 보내기</a>
										</div>

									</td>
								</tr>
							</c:forEach>
							<!--반복처리 끝  -->
						</c:if>
					</tbody>
				</table>
				<ul class="pagination">
	<c:if test="${pagingInfo.firstPage>1 }">
    <li class="page-item"><a class="page-link" href="<c:url value='/member/all-member-view?currentPage=${pagingInfo.firstPage-1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">Previous</a></li>
    </c:if>	
    <!-- [1][2][3][4][5][6][7][8][9][10] -->
    <c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage }">
    	<c:if test="${i==pagingInfo.currentPage }">
   		<li class="page-item"><a class="page-link" href="javascript:void(0);">${i}</a></li>
   		</c:if>	
		<c:if test="${i!=pagingInfo.currentPage }">	
		<li class="page-item"><a class="page-link" href="<c:url value='/member/all-member-view?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">${i}</a></li>
		</c:if>	
    </c:forEach>
    <!-- 다음 블럭으로 이동 -->
    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
    <li class="page-item"><a class="page-link" href="<c:url value='/member/all-member-view?currentPage=${pagingInfo.lastPage+1}&&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}'/>">Next</a></li>
  	</c:if>	
  	</ul>
  	<!-- 검색 시작 -->
  	<div class="divSearch">
   	<form name="frmSearch" method="post" id ="search"
   		action='<c:url value="/member/all-member-view"/>'>
        <select name="searchCondition" id ="searchsel">
            <option value="no" 
            	<c:if test="${param.searchCondition=='no' }">            	
            		selected="selected"
            	</c:if>
            >사원번호</option>
            <option value="email" 
            	<c:if test="${param.searchCondition=='email' }">            	
            		selected="selected"
            	</c:if>
            >이메일</option>
            <option value="name" 
            	<c:if test="${param.searchCondition=='name' }">            	
            		selected="selected"
            	</c:if>
            >이름</option>
        </select>   
        <input type="text" id ="searchinput" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword}">   
		<input type="submit"  id ="searchbutton" value="검색">
		 <a href="<c:url value ="/api/v1/excel/admin-member"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> 액셀 다운로드</a>
    </form>
</div>
  	<!-- 검색 끝 -->
			</div>
		</div>
	</div>

</div>

 



<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>






<%@ include file="../layout/memberTableFooter.jsp"%>
