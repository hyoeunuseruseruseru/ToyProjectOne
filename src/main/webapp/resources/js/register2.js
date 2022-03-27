/**
 * 
 */


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