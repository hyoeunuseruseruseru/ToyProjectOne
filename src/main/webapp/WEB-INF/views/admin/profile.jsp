<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="<c:url value='/resources/css/profile.css'/>" rel="stylesheet">
</head>
<body>
   <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>  
  
	<form name="frm1" id="frm1">
		<c:if test="${not empty vo}">
   <div id="design2"> 사원번호 : </div>
       <input class ="design1" type="text" id="no" name ="no" placeholder="${vo.no }"
   			value ="${vo.no}"
				readonly="readonly">
	<br>		
  <div id="design2"> 이름 : </div><input class ="design1"  type="text" id="name" name="name"
				placeholder="${vo.name }" readonly="readonly">
			<br>
   <div id="design2"> 고용일 : </div> <input class ="design1"  type="text" id="regdate"
				placeholder="<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>"
				readonly="readonly">
				<br>	
    <div id="design2"> 연봉 : </div> <input class ="design1"  type="text" id="salary" name ="salary"
				placeholder="${vo.salary}"
				value ="${vo.salary}"  
			 >
			 <br>	
   <div id="design2"> 부서 : <c:choose>
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
			</c:choose>
			 </div> 
			<select name="groupNo" class ="design1"  required>
				<option value="${vo.groupNo}" 
				selected="selected">부서 변경</option>
				<option value="1">인사부</option>
				<option value="2">총무부</option>
				<option value="3">영업부</option>
				<option value="4">기획부</option>
				<option value="5">회계부</option>
			</select>
			<br>
   <div id="design2"> 직급 :  <c:choose>
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
			</c:choose>
			</div> 
			<select name="position" class ="design1"  required>
				<option value="${vo.position}" 
				selected="selected">직급 변경</option>
				<option value="1">사원</option>
				<option value="2">주임</option>
				<option value="3">전임</option>
				<option value="4">선임</option>
				<option value="5">대리</option>
				<option value="6">과장</option>
				<option value="7">차장</option>
				<option value="8">부장</option>
				<option value="9">이사</option>
				<option value="10">상무</option>
				<option value="11">전무</option>
			</select>
		<!-- 	<input type="submit" id ="register" value="수정하기"> -->
		</c:if>
		<div class ="register">
		<button id="register">수정하기</button>
		</div>
	</form>
	
	 <script type="text/javascript">
   $('#register').on("click",function(){
	   alert("수행");
	   $.ajax({
			url : "/admin/member/update-salary",
			type : "post",
			dataType : "json",
			data : $('#frm1').serialize(),
			success : function(data){
				if(data>0){
					  opener.location.replace("/admin/member/all-member-view");
					  window.close();
				}else{
					 opener.location.replace("/admin/member/all-member-view");
					  window.close();
				}
			},
			error : function(xhr,status, error){
				alert('ajax error'+error);
			}
			
		});
	   
   });
   </script>
</body>
</html>