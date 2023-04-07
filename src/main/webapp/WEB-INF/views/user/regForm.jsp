<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

<style>
<%@include file="/WEB-INF/views/resources/css/user/reg.css" %>
</style>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@도로명주소 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("userExtraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("userExtraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userPostcode").value = data.zonecode;
                document.getElementById("userAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userDetailAddress").focus();
            }
        }).open();
    }
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@도로명 주소 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <script type="text/javascript">
  		//모든 공백 체크 정규식
		var emptCheck = /\s/g;
		//영문 대소문자, 숫자로만 이루어진 4~12자리 정규식
		var idPwCheck = /^[a-zA-Z0-9]{4,20}$/;
		
		var emailCheckCode;
		var emailSuccess = false;
		
    	$(document).ready(function(){		//EMAIL CHECK BUTTON ON CLICK
		
 			$("#request-email-check-number-btn").on("click", function(){
 				
 				const emailrequest = $("#userEmail").val();
 				console.log("요청이메일" + $("#userEmail").val());
 				
 				$.ajax({
 					type:"POST",
 					datatype:"JSON",
 					url:"/user/emailCheck",
 					data:{
 						userEmail:$("#userEmail").val()
 					},beforeSend:function(xhr) {
 						xhr.setRequestHeader("AJAX", "true");
 					},success:function(response) {
 						if(response.code == 0) {
 							$.ajax({
 			 					type:"GET",
 			 					url:"/mail/mailCheck",
 			 					dataType:"JSON",
 			 					data:{
 			 						emailRequest : emailrequest
 			 					},
 			 					beforeSend:function(xhr){
 			 						xhr.setRequestHeader("AJAX", "true");
 			 					},
 			 					success:function(data){
 			 						emailCheckCode = data;
 			 						alert("인증번호가 전송되었습니다.");
 			 					},
 			 					error:function(xhr, status, error){
 			 						icia.common.error(error);
 			 					}
 			 				});// 이메일 인증번호 전송 END AJAX;
 			 				
 						}else if(response.code == -1) {
 							alert("사용중인 이메일입니다");
 						}else if(response.code == 400) {
 							alert("이메일을 입력해주세요");
 						}
 					},error(xhr, status, error) {
 						icia.common.error(error);
 					}
 				});//ajax END
 			});
 				
 				
    		
 			
 			
 			$("#response-email-check-number-btn").on("click", function(){	//EMAIL CHECK TRUE&FALSE INPUT BOX 
 				
 				
 				if($("#emailCheckInput").val() == emailCheckCode) {
 					emailSuccess = true;
 					$("#mail-check-warn").html("인증번호가 일치합니다.");
 					$("#mail-check-warn").css("color", "green");
 					$("#userEmail").attr("readonly", true);
 					$("#request-email-check-number-btn").attr("disabled", true);
 					$("#response-email-check-number-btn").attr("disabled", true);
 					$("#userEmail").attr("readonly", true);
 				}else {
 					$("#mail-check-warn").html("인증번호가 불일치 합니다. 다시확인해주세요");
 					$("#mail-check-warn").css("color", "red");
 				}
 			});//END EMAIL CHECK TRUE&FALSE INPUT BOX
 			
    		//회원가입 버튼 눌렀을 때 ============
    		$("#btnUserReg").on("click", function(){
    			
    			/*if(emailCheckBL == false) {
    				alert("이메일 중복체크를 해주세요");
    				return;
    			}*/
    			
    			/*if(nicknameCheckBL == false) {
    				alert("중복된 닉네임 입니다.");
    				return;
    			}*/
    			
    			//아이디 입력, 공백, 형식 체크
    			if($.trim($("#userId").val()).length <= 0) {
    				alert("아이디를 입력해주세요.");
    				$("#userId").focus();
    				return;
    			}
    			
    			if(emptCheck.test($("#userId").val())) {
    				alert("아이디는 공백을 포함할 수 없습니다.");
    				$("#userId").val("");
    				$("#userId").focus();
    				return;
    			}
    			
    			if(!idPwCheck.test($("#userId").val())) {
    				alert("아이디 형식이 맞지않습니다.");
    				$("#userId").focus();
    				return;
    			}
    			
    			//비밀번호 입력, 공백, 형식, 2차확인 체크
    			if($.trim($("#userPwd1").val()).length <= 0) {
    				alert("비밀번호를 입력해주세요.");
    				$("#userPwd1").focus();
    				return;
    			}
    			
    			if(emptCheck.test($("#userPwd1").val())) {
    				alert("비밀번호는 공백을 포함할 수 없습니다.");
    				$("#userPwd1").val("");
    				$("#userPwd1").focus();
    				return;
    			}
    			
    			if(!idPwCheck.test($("#userPwd1").val())) {
    				alert("비밀번호 형식이 맞지 않습니다.");
    				$("#userPwd1").val("");
    				$("#userPwd1").focus();
    				return;
    			}
    			
    			if($("#userPwd1").val() != $("#userPwd2").val()) {
    				alert("비밀번호 확인이 일치하지않습니다.");
    				$("#userPwd2").val("");
    				$("#userPwd2").focus();
    				return;
    			}
    			
    			//닉네임 입력, 공백, 형식체크
    			if($.trim($("#userNickname").val()).length <= 0) {
    				alert("닉네임을 입력해주세요.");
    				$("#userNickname").focus();
    				return;
    			}
    			
    			if(emptCheck.test($("#userNickname").val())) {
    				alert("닉네임은 공백을 사용할 수 없습니다.");
    				$("#userNickname").focus();
    				return;
    			}
    			
    			if($("#userNickname").val().length < 3) {
    				alert("닉네임을 3자 이상 입력해주세요.");
    				$("#userNickname").focus();
    				return;
    			}
    			
    			if($("#userNickname").val().length > 20) {
    				alert("닉네임은 20자를 초과할수없습니다.");
    				$("#userNickname").focus();
    				return;
    			}
    			
    			//이메일 공백, 형식 체크
    			if($.trim($("#userEmail").val()).length <= 0) {
    				alert("이메일을 입력해주세요");
    				$("#userEmail").focus();
    				return;
    			}
    			
    			if(!fn_validateEmail($("#userEmail").val())) {
    				alert("올바른 이메일을 입력해주세요.");
    				$("#userEmail").focus();
    				return;
    			}
    			
    			if(emailSuccess == false) {
    				alert("이메일 인증을 해주세요");
    				$("#userEmail").focus();
    				return;
    			}
    			
    			//이름 입력, 공백 체크
    			if($.trim($("#userName").val()).length <= 0) {
    				alert("이름을 입력해주세요.");
    				$("#userName").focus();
    				return;
    			}
    			
    			if(emptCheck.test($("#userName").val())) {
    				alert("이름은 공백을 사용할 수 없습니다.");
    				$("#userName").focus();
    				return;
    			}
    			
    			//전화번호 입력, 공백 체크
    			if($.trim($("#userPhoneNo").val()).length <= 0) {
    				alert("전화번호를 입력해주세요.");
    				$("#userPhoneNo").focus();
    				return;
    			}
    			
    			if(emptCheck.test($("#userPhoneNo").val())) {
    				alert("전화번호를 정확히 입력해주세요.");
    				$("#userPhoneNo").focus();
    				return;
    			}
    			
    			if($.trim($("#userPostcode").val()).length <= 0) {
    				alert("우편번호를 입력해주세요.");
    				$("#userPostcode").focus();
    				return;
    			}
    			
    			if($.trim($("#userDetailAddress").val()).length <= 0) {
    				alert("상세주소를 입력해주세요.");
    				$("#userDetailAddress").focus();
    				return;
    			}
    			
    			
    			fn_regProc();
    			
    		});//회원가입버튼 처리끝
    		
    		
    		//아이디 중복체크 버튼 눌렀을 떄 ==============
    		$("#btnIdDuplicationCheck").on("click", function(){
        		
    			if($.trim($("#userId").val()).length <= 0) {
    				alert("아이디를 입력해주세요.");
    				$("#userId").focus();
    				return;
    			}
    			
    			if(emptCheck.test($("#userId").val())){
    				alert("아이디는 공백을 포함할 수 없습니다.");
    				$("#userId").focus();
    				return;
    			}
    			
    			if(!idPwCheck.test($("#userId").val())){
    				alert("아이디는 4~12자리 영문 대소문자, 숫자로만 가능합니다.");
//    				$(".input_msg").text("아이디는 4~12자리 영문 대소문자, 숫자로만 가능합니다.");
    				$("#userId").focus();
    				return;
    			}
    			
    			//아이디 중복가입 체크
    			fn_idCheck();
    		});	//아이디 중복확인버튼 끝
    		
    		
    		//취소 버튼 눌렀을 때 메인화면으로 돌아감 ===================
    		$("#btnCancel").on("click", function(){
    			location.href="/user/loginForm";
    		});
    		
    		
    	});//document.ready 끝
    	 

//아이디 중복가입 체크   =================== 	
function fn_idCheck(){
	
	$.ajax({
		type: "POST",
		url:"/user/idCheck",
		data:{
			userId:$("#userId").val()
		},
		beforeSend:function(xhr){
			xhr.setRequestHeader("AJAX", "true");
		},
		success:function(response){
			if(response.code == 0) {
				alert("사용가능한 아이디 입니다.");
			}else if(response.code == -1) {
				alert("사용중인 아이디입니다.");
			}else if(response.code == 400) {
				alert("요청이 실패 했습니다.");
			}else {
				alert("요청중 알수없는 오류가 발생했습니다.");
			}
		},
		error:function(xhr, status, error){
			icia.common.error(error);
		}
	});
	
};//아이디 중복가입체크 function 끝   

function fn_nicknameCheck() {
	$.ajax({
		type: "POST",
		url:"/user/nicknameCheck",
		data:{
			userNickname:$("#userNickname").val()
		},
		beforeSend:function(xhr){
			xhr.setRequestHeader("AJAX", "true");
		},
		success:function(response){
			if(response.code == 0) {
				nicknameCheckBL = true;
			}else if(response.code == -1) {
				alert("사용중인 닉네임입니다");
			}else if(response.code == 400) {
				alert("요청이 실패 했습니다.");
			}else {
				alert("요청중 알수없는 오류가 발생했습니다.");
			}
		},
		error:function(xhr, status, error){
			icia.common.error(error);
		}
	});
}
//이메일 형식 체크 =================== 
function fn_validateEmail(value)
{
	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	
	return emailReg.test(value);
}




//회원가입    	
function fn_regProc(){
	$.ajax({
		type: "POST",
		url: "/user/regProc",
		data:{
			userId:$("#userId").val(),
			userPwd1:$("#userPwd1").val(),
			userName:$("#userName").val(),
			userEmail:$("#userEmail").val(),
			userNickname:$("#userNickname").val(),
			userPhoneNo:$("#userPhoneNo").val(),
			userAddress:$("#userAddress").val(),
			userPostcode:$("#userPostcode").val(),
			userDetailAddress:$("#userDetailAddress").val(),
			userExtraAddress:$("#userExtraAddress").val()
			
		},
		beforeSend:function(xhr){
			xhr.setRequestHeader("AJAX", "true");
		},
		success:function(response){
			if(response.code == 0) {
				alert("회원가입이 완료되었습니다.");
				location.href = "/user/loginForm";
			}else if(response.code == -1) {
				alert("오류가 발생했습니다.");
			}else if(response.code == 400) {
				alert("올바른 값을 입력해주세요.");
			}else if(response.code == -2){
				alert("사용중인 아이디입니다.");
				$("#userId").focus();
			}else if(response.code == -3) {
				alert("사용중인 이메일입니다.");
			}else if(response.code == -4) {
				alert("사용중인 닉네임입니다.");	
			}else {
				alert("알수없는 오류가 발생했습니다.");
			}
			
		},
		error:function(xhr, status, error){
			icia.common.error(error);
		}
	});
};//회원가입 function 끝


    </script>
</head> <!-- 헤드 끝 -->


<body>

<%@include file="/WEB-INF/views/include/headerNavigation.jsp" %>
    <main>
        <h1>회원가입</h1>
        <div class="reg_main">
            <div class="reg_div">

                <label for="userId">아이디</label><span></span>		<!--  <span class="input_msg"></span> -->
                <div class="input_div">
                    <input type="text" id="userId" name="userId" placeholder="4~12자리의 영문대소문자,숫자로 입력해주세요" maxlength="12"> 
                <button type="button" id="btnIdDuplicationCheck">중복확인</button><br />
                </div>
                <label for="userPwd1">비밀번호</label>
                <div class="input_div">
                    <input type="password" id="userPwd1" name="userPwd1" placeholder="4~12자리의 영문대소문자,숫자로 입력해주세요" maxlength="12"> <br />
                </div>
                <label for="userPwd2">비밀번호 확인</label>
                <div class="input_div">
                    <input type="password" id="userPwd2" name="userPwd2" placeholder="비밀번호를 한번더 입력해주세요" maxlength="12"> <br />
                </div>
                <label for="userName">이름</label>
                <div class="input_div">
                    <input type="text" id="userName" name="userName" placeholder="이름" maxlength="5"> <br />
                </div>
                <label for="userEmail">이메일</label>
                <div class="input_div">
                    <input type="text" id="userEmail" name="userEmail" placeholder="example@co.kr" maxlength="30"><button id="request-email-check-number-btn">인증번호 요청</button> <br />
                </div>
                <div class="input_div">
                <input type="text" id="emailCheckInput" name="emailCheckInput" placeholder="인증번호입력" maxlength="6"> <button id="response-email-check-number-btn">인증번호 확인</button><br />
                </div>
                <!-- 이메일 인증번호 체크 박스 -->
                <div>
                <span id="mail-check-warn"></span>
                </div>
                <!----------------------->
                <label for="userNickname">닉네임</label>
                <div class="input_div">
                    <input type="text" id="userNickname" name="userNickname" placeholder="닉네임"> <br />
                </div>
                <label for="userPhoneNo">전화번호</label>
                <div class="input_div">
                    <input type="text" id="userPhoneNo" name="userPhoneNo" placeholder="-를 제외하고 입력해주세요"> <br />
                </div>
                
                <label for="userAddress">주소</label>
                <div class="input_div">         
 <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@도로명주소 입력창@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->		
					<!--<input type="text" id="userAddress" name="userAddress" value="${user.userAddress}" style="width: 400px; height: 30px; font-size: 20px;" maxlength="100" placeholder="주소" />-->
					<input class="input_btn" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="userPostcode" placeholder="우편번호">
					<input type="text" id="userAddress" placeholder="주소"><br>
					<input type="text" id="userDetailAddress" placeholder="상세주소">
					<input type="text" id="userExtraAddress" placeholder="참고항목">
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@도로명 주소 입력 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->						
                    
                </div>
                <div class="button_div">
	                <button type="button" id="btnUserReg" name="btnUserReg">회원가입</button>
	                <button type="button" id="btnCancel" name="btnCancel">취소</button>
                </div>
            </div>               
        </div>
    </main>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>    
</body>
</html>