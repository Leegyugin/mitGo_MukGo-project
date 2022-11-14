<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/searchMember.css">
</head>
<body>
	<div class="searchPw-wrap">
		<div class="searchContent">
			<fieldset>
				<legend>비밀번호  찾기</legend>
					<input type="radio" name="selSearch" id="normal" value="1">
		            <label for="normal">일반회원</label>
		            <input type="radio" name="selSearch" id="owner" value="2">
		            <label for="owner">사업자</label>
					
		            <div class="searchMember">
		            <form action="/searchNormalPw.do" method="post">
						아이디 : <input type="text" id="memberId" name="memberId">
						<br><br>
						<label class="label" for="memberPhone">ex)01012345678 (- 생략)</label>
						전화번호 : <input type="text" id="memberPhone" class="inputPhone" name="memberPhone">
		            	<button type="button" class="phoneChkSendBtn">발송</button>
		            	<br>
		            	 인증번호 : <input type="text" id="certifyNum" name="certifyNum">
                        <button type="button" class="phoneChkBtn">확인</button>
                        <br>
                        <span id="timeZone"></span>
						<span id="authMsg"></span>
                        <input type="hidden" class="certifyNum2">
		            	<div>
			            	<button type="submit" id="searchMemberBtn">찾기</button>
			            </div>
		            </form>
		            </div>
		            <div class="searchOwner">
		            <form action="/searchOwnerPw.do" method="post">
		            	아이디 : <input type="text" id="ownerId" name="ownerId">
		            	<br><br>
		            	<label class="label" for="ownerPhone">ex)01012345678 (- 생략)</label>
		            	전화번호 : <input type="text" id="ownerPhone" class="inputPhone" name="ownerPhone">
			            <button type="button" class="phoneChkSendBtn">발송</button>
			            <br>
			                           인증번호 : <input type="text" id="certifyNum" name="certifyNum">
                        <button type="button" class="phoneChkBtn">확인</button>
                        <br>
                        <span id="timeZone"></span>
						<span id="authMsg"></span>
                        <input type="hidden" class="certifyNum2">
			            <div>
			            	<button type="submit" id="searchMemberBtn">찾기</button>
			            </div>
		            </form>
		            </div>
				
			</fieldset>
		</div>
	</div>
	
	<script>
		var phoneFlag = 0;
	
		/*일반, 사업자  구분*/
		$("#normal").click();
		$(".searchOwner").css("display","none");
		$("[name=selSearch]").on("click",function(){
			var selSearch = $("input[name=selSearch]:checked").val();
			if(selSearch == 1) {
				$(".searchOwner").css("display","none");
				$(".searchMember").css("display","block");
			}else if(selSearch == 2){
				$(".searchMember").css("display","none");
				$(".searchOwner").css("display","block");
			}
		});
		
		$(".inputPhone").on("focus",function(){
		    const label = $(this).prev();
		    label.css("display","none");
		});
		$(".inputPhone").on("blur",function(){
		    const label = $(this).prev();
		    if($(this).val() == ""){
			    label.css("display","");
		    }
		});
		$("#searchMemberBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$("#searchMemberBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		//인증번호 발송
		$(".phoneChkSendBtn").click(function(){
			alert("인증번호가 발송되었습니다.");
			var phone = $("[name=memberPhone]").val();
			$.ajax({
				type : "POST",
				url : "/memberPhoneCheck.do",
				data : {phone : phone},
				success : function(numStr) {
                    $(".certifyNum2").val(numStr);
                    $("#auth").show();
					authTime();
				}
			});
		});
		//인증번호 시간제한 로직
		let PhoneNumStr = $(".certifyNum2").val();
		
		let intervalId;
		function authTime(){
			$("#timeZone").html("<span id='min'>3</span> : <span id='sec'>00</span>");
			intervalId = window.setInterval(function(){
				timeCount();
			},1000);
		}
		function timeCount(){
			const min = Number($("#min").text());
			const sec = $("#sec").text();
			if(sec == "00"){
				if(min == 0){
						PhoneNumStr = null;
						clearInterval(intervalId);
				}else {
						$("#min").text(min-1);
						$("#sec").text(59);
				}
			}else {
				const newSec = Number(sec)-1;
				if(newSec<10){
					$("#sec").text("0"+newSec);
				}else {
					$("#sec").text(newSec);
				}
			}
		}
		/*휴대폰 인증확인*/
		 $(".phoneChkBtn").on("click",function(){
	            const certifyNum = $("#certifyNum").val();
	            const certifyNum2 = $(".certifyNum2").val();
	            if(PhoneNumStr != null) {
		            if(certifyNum == certifyNum2) {
		                alert("인증 확인되었습니다.");
		                clearInterval(intervalId);
		                phoneFlag = 1;
		            }else {
		                alert("인증번호를 다시 확인해주세요.");
		            }
	            }else {
	            	$("#authMsg").text("인증시간 만료");
					$("#authMsg").css("color","red");
	            }
	      });
		
		$("#searchMemberBtn").on("click",function(e){
			if(phoneFlag != 1){
				e.preventDefault();
			}else if($("input") == "") {
				alert("정보를 입력해주세요.");
				e.preventDefault();
			}
		});
		
	</script>
</body>
</html>