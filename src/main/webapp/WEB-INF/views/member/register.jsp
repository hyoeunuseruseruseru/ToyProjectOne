<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/register.css'/>" rel="stylesheet">
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>  
    
<title>Insert title here</title>
</head>
<body class="bg-gradient-primary">
	<!-- <script type="text/javascript">
	 
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
			}else if($('#passwordCheck').val().length<1){
				alert("비밀번호 확인란을 입력하세요");
				$('#passwordCheck').focus();
				event.preventDefault();
			}else if($('#password').val()!=$('#passwordCheck').val()){
				alert("비밀번호가 일치하지 않습니다");
				$('#password').focus();
				event.preventDefault();
			}else if(!validate_pwd($('#password').val())){
				return false;
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
				formObj.attr("action","/admin/member/register-form");
				formObj.submit();
				
			}
			
			
		});
	
		 
		 
		function validate_pwd(pwd){
			var idRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			/* var idRegExp = /^[a-zA-z0-9]{8,16}$/;  */
			if(!idRegExp.test(pwd)){
				alert('숫자, 영문자, 특수문자 조합으로 8~15자리를 사용해야 합니다.');
				return false;
			}

			/* var checkNum = pwd.search(/[0-9]/g); // 숫자사용
			var checkEng = pwd.search(/[a-z]/ig); // 영문사용

			if(checkNum <0 || checkEng <0){
				alert("숫자와 영문자를 조합하여야 합니다.");
				return false;
			} */
			return true;
			
		}
		
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
		
		$("#password").keyup(function(){
			var idRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			
			if(!idRegExp.test($(this).val())){
				$("#pwdContent").html('숫자, 영문자, 특수문자 조합으로 8~15자리를 사용해야 합니다.');
				 $("#pwdContent").css('color','red');
			}else if($('#passwordCheck').val().length<1){
				$("#pwdContent").html('비밀번호 확인란을 입력해 주세요.');
				 $("#pwdContent").css('color','red');
			}
		});
		
		$("#passwordCheck").keyup(function(){
			if($(this).val()!=$("#password").val()){
				$("#pwdContent").html('비밀번호가 일치하지 않습니다.');
				 $("#pwdContent").css('color','red');
			}else if($(this).val()==$("#password").val()){
				$("#pwdContent").html('비밀번호가 일치합니다.');
				$("#pwdContent").css('color','blue');
			}
			
		});
		
		
		
	
		
		
});

		

	/* 	function popup(){
			var userid = $("#email").val();
			if(userid.length<1){
				alert("아이디를 입력하세요.");
				
			}else{
				$("input[name=emailcheck]").val('y');
				url = "/admin/member/check-email?email="+userid; 
				
			window.open(url,"chkid","width=400,height=200");
				
			}
			
			
		} */
		
		function popup(){
			var userid = $("#email").val();
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(userid.length<1){
				alert("이메일을 입력하세요.");
				
			}else if(!regEmail.test(userid)){
				alert("이메일 형식이 아닙니다.");
			}else{
				$.ajax({
					url : "/admin/member/check-email",
					type : "post",
					dataType : "json",
					data : {"email" : $("#email").val()},
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


</script> -->
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원 가입</h1>
                            </div>
                            <form class="user" name ="frm1">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="name"
                                         name = "name"   placeholder="이름">
                                    </div>
                                   
                                     <div class="col-sm-6" id="groupNo" >
                                    	<!-- class="form-control form-control-user"  -->
                                    	<select name="groupNo" class="position" required >
                                    		<option value="" disabled selected>부서를 선택하세요</option>
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
                            
                                <div class="form-group row">
                                	
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    
                                      <input type="email" class="form-control form-control-user" id="email"
                                     name ="email"   placeholder="이메일">
                                     	<p id="emailContent">4-12자/영문 소문자(숫자 조합 가능)</p>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="button" class="form-control form-control-user"
                                            id="emailCk" value="이메일 중복 확인" onclick="popup();" >
                                        <input type= "hidden" id ="emailcheck" name="emailcheck">
                                    
                                    </div>
                                </div>
                               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="password" placeholder="비밀번호" name = "password">
                                            <p id="pwdContent">숫자, 영문자, 특수문자 조합으로 8~15자리를 사용해야 합니다.</p>
                                    </div>
                                    <div class="col-sm-6">
                                         <input type="password" class="form-control form-control-user"
                                         id="passwordCheck" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input class="form-control form-control-user"
                                            type="text" id="zipcode" name ="zipcode" placeholder="우편번호">
                                    </div>
                                    <div class="col-sm-6">
                                   		<input type="button" class="form-control form-control-user"
                                            id="searchPcode" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" >
                                        <input type= "hidden" id ="postcodeChk" name="postcodeChk">
                                      
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                           id="address" name ="address" placeholder="주소">
                                    </div>
                                    <div class="col-sm-6">
                                   		<input type="text" class="form-control form-control-user" id="addressDetail" name ="addressDetail" placeholder="상세주소">
                                        <input type="text"  id="addressExtra" name ="addressExtra" > 
                                    </div>
                                    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
                                    
                                    <div class="col-sm-6">
                                   		<input type="tel" class="form-control form-control-user" id="tel" name ="tel" placeholder="전화번호">
                                      	<p id="telContent">'-'를 포함하여 입력해주세요</p>
                                    </div>
                                </div>
                               
                                <%--  <a href='<c:url value ="/member/register"/>' class="btn btn-primary btn-user btn-block" id="register">
                                    Register Account
                                </a>  --%>
                                <input type ="submit" value ="Register Account" class="btn btn-primary btn-user btn-block" id="register">
                                <hr>
                               <!--  <a href="index.html" class="btn btn-google btn-user btn-block" >
                                	
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a> -->
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href='<c:url value ="/login/view"/>'>Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>
    
    <!-- 우편 번호 API -->
 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="<c:url value='/resources/js/register.js'/>"></script>
    
    <!-- 유효성 검사  -->
    <script src="<c:url value='/resources/js/register2.js'/>"></script>

</body>

</html>