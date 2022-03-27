<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
  <link href="<c:url value='/resources/css/myProfileUpdate2.css'/>" rel="stylesheet"> 
   <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>  	
 <script type="text/javascript">
	 
		$(function(){
			
			
			/* $("input:text[numberOnly]").on("keyup", function() {
			      $(this).val($(this).val().replace(/[^0-9]/g,""));
			   });
			
			$("#deletevo").on("click", function(){
		        if($('#name').val().length<1){ 
		            alert("이름을 입력 해주세요."); 
		            $('#name').focus(); 
		            event.preventDefault(); 
		        }else if($('#price').val().length<1){ 
		            alert("가격을 입력하세요"); 
		            $('#price').focus(); 
		            event.preventDefault();
		        }else if($('#content').val().length<1){ 
		            alert("내용을 입력하세요"); 
		            $('#content').focus(); 
		            event.preventDefault();
		        }else{
		        var formObj = $("form[name='commentForm']");
		          formObj.attr("action", "/comcome/admin/addsaleproduct");
		          formObj.submit();
		        }
		        });
			
		 */
		$('#register').on("click",function(){
			/*jquery로 option 값, text값 가져오는 방법  */
		   /*  var groupNo = $("#groupNo option:selected").val();
		    var groupNoText = $("#groupNo option:selected").text(); */
		/* 	alert(groupNo);
			alert(groupNoText); */
			
			var checkemail = $('#emailcheck').val();
			alert(checkemail);
			
			if($('#name').val().length<1){
				alert("이름을 입력하세요");
				$('#name').focus();
				event.preventDefault();
			}else if($("#groupNo option:selected").val()==""){
				alert("부서를 선택하세요");
				event.preventDefault();
			}else if($("#email").val().length<1){
				alert("이메일을 입력하세요");
				event.preventDefault();
			}else if($('#emailcheck').val().length<1){
				alert("이메일 중복체크를 해야합니다");
				event.preventDefault();
			}else if($('#password').val().length<1){
				alert("비밀번호를 입력하세요");
				$('#password').focus();
				event.preventDefault();
			}else if($('#postcodeChk').val().length<1){
				alert("주소를 입력해야 합니다.");
				event.preventDefault();
			}else if($('#addressDetail').val().length<1){
				alert("상세주소를 입력해야 합니다.");
				event.preventDefault();
			}else if ($('#tel').val().length<1){
				alert("전화번호를 입력해야 합니다.");
				event.preventDefault();
			}else if (!validate_tel($('#tel').val())){
				return false;
			}else{
				alert("submit 성공");
				var formObj = $("form[name='frm1']");
				formObj.attr("action","/admin/member/update-form");
				formObj.submit();
				
			}
			
			
		});
	
		 
		 
		
		
		function validate_email(email){
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			 if(!regEmail.test($(email).val())){
				alert("@를 포함한 이메일을 입력해주세요");
				return false;
			 }
			 
			 return true;
		}
		
		function validate_tel(tel){
			var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			   if(!patternPhone.test(tel))
			    {
			        alert('핸드폰 번호를 확인 해주세요');
			        return false;
			    }  
			return true; 
		}
		
	
		
		$("#email").keyup(function(){
			/*  var RegExp = /^[a-zA-Z0-9]{4,12}$/; // 아이디 유효성 검사 */
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

			 if(!regEmail.test($(this).val())){
				 $("#emailContent").html('@를 포함한 이메일을 입력해주세요');
				 $("#emailContent").css('color','red');
			 }else if(regEmail.test($(this).val())){
				 $("#emailContent").html('이메일 중복확인을 해주세요');
				 $("#emailContent").css('color','red');
			 }
		});
		
		$("#tel").keyup(function(){
			var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;

			 if(!patternPhone.test($(this).val())){
				 $("#telContent").html('전화번호 형식에 맞지 않습니다.');
				 $("#telContent").css('color','red');
			 }else if(patternPhone.test($(this).val())){
				 $("#telContent").html('올바르게 입력되었습니다');
				 $("#telContent").css('color','gray');
			 }
		});
		
	
		
		
		
	
		
		
});

		

	
		
		function emailpopup(){
			var userid = $("#email").val();
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(userid.length<1){
				alert("이메일을 입력하세요.");
				
			}else if(!regEmail.test(userid)){
				alert("이메일 형식이 아닙니다.");
			}else{
				$.ajax({
					url : "/admin/member/check-email/update",
					type : "post",
					dataType : "json",
					data : {"email" : $("#email").val(),
						     "no" : $("#no").val()},
					success : function(data){
						if(data>0){
							$("#emailContent").html('존재하는 이메일입니다. 다시 입력해주세요.');
							$("#emailContent").css('color','red');
							$("input[name=emailcheck]").val('');
						}else{
							$("#emailContent").html('사용가능 한 이메일입니다.');
							$("#emailContent").css('color','blue');
							$("input[name=emailcheck]").val('y');
						}
					}
					
				})
				
			}
			
		}


</script>
  							<div class="card mb-4">
                                <div class="card-header">
                                    정보 수정
                                </div>
                                <div class="card-body">
                                  <form class="user" name ="frm1">
                                <div class="divp">
                                    <div class="divpp">
                                        <input type="text" class="inputp" id="name"
                                         name = "name"   placeholder="${sessionScope.name}" value="${sessionScope.name}">
                                    </div>
                                   
                                     <div class="divpp" id="groupNo" >
                                    	<!-- class="form-control form-control-user"  -->
                                    	<select name="groupNo" class="position" required >
                                    		<option value="" disabled selected>
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
                                    		</option>
                                    		<option value="1">인사부</option>
                                    		<option value="2">총무부</option>
                                    		<option value="3">영업부</option>
                                    		<option value="4">기획부</option>
                                    		<option value="5">회계부</option>
                                    	</select>
                                    </div>
                                </div>
                                <!-- <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="email"
                                     name ="email"   placeholder="이메일">
                                     
                                </div> -->
                            
                                <div class="divp">
                                	
                                    <div class="divppp">
                                    
                                      <input type="email" class="inputp" id="email"
                                     name ="email"   placeholder="${sessionScope.email}" value="${sessionScope.email}">
                                     	<p id="emailContent" class="pp">4-12자/영문 소문자(숫자 조합 가능)</p>
                                    </div>
                                    <div class="divpp">
                                        <input type="button" class="inputp"
                                            id="emailCk" value="이메일 중복 확인" onclick="emailpopup();" >
                                        <input type= "hidden" id ="emailcheck" name="emailcheck">
                                        <input type="hidden" id="no" name ="no" value="${sessionScope.no}">
                                    
                                    </div>
                                </div>
                               
                                <div class="divp">
                                    <div class="divppp">
                                        <input type="password" class="inputp"
                                            id="password" placeholder="기존 비밀번호" name = "password">
                                    </div>
                                   
                                </div>
                                <div class="divp">
                                    <div class="divppp">
                                        <input class="inputp"
                                            type="text" id="zipcode" name ="zipcode" placeholder="${sessionScope.zipcode}"
                                            value="${sessionScope.zipcode}">
                                    </div>
                                    <div class="divpp">
                                   		<input type="button" class="inputp"
                                            id="searchPcode" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" >
                                        <input type= "hidden" id ="postcodeChk" name="postcodeChk">
                                      
                                    </div>
                                    <div class="divppp">
                                        <input type="text" class="inputp"
                                           id="address" name ="address" placeholder="${sessionScope.address}" 
                                           value="${sessionScope.address}">
                                    </div>
                                    <div class="divpp">
                                   		<input type="text" class="inputp" id="addressDetail" name ="addressDetail" 
                                   		placeholder="${sessionScope.addressDetail}" value="${sessionScope.addressDetail}">
                                       
                                    </div>
                                     <div class="divpp">
                                     <input type="text"  id="addressExtra" name ="addressExtra" 
                                     value ="${sessionScope.addressExtra}" placeholder="${sessionScope.addressExtra}"> 
                                   </div>
                                    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
                                    
                                    <div class="divpp">
                                   		<input type="tel" class="inputp" id="tel" name ="tel" 
                                   		placeholder="${sessionScope.tel}" value="${sessionScope.tel}">
                                      	<p id="telContent"  class="pp">전화번호 : '-'를 포함하여 입력해주세요</p>
                                    </div>
                                </div>
                               
                                <%--  <a href='<c:url value ="/member/register"/>' class="btn btn-primary btn-user btn-block" id="register">
                                    Register Account
                                </a>  --%>
                                <input type ="submit" value ="Update Account" class="btn btn-primary btn-user btn-block" id="register">
                                <hr>
                               <!--  <a href="index.html" class="btn btn-google btn-user btn-block" >
                                	
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a> -->
                            </form>
                                </div>
                            </div>








<%@ include file="../layout/myProfileUpdateFooter.jsp"%> 