<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qnaList.css">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.misMsg{
		width: 1000px;
		border-top: 1px solid gray;
		border-bottom : 1px solid gray;
		margin: 0 auto;
		text-align: center;
		padding-top:30px;
		padding-bottom: 30px;
		font-size: 30px;
	}
	
	#titleMan:hover{
		cursor: pointer;
	}
	
	.pageNo{
		font-size: 20px;
		background-color: gray;
		color: white;
		width: 30px;
		border-radius: 100%;
		line-height: 34px;
	}
	
	.qna-tbl{
		width: 1200px;
	}
	
	.qna-tbl th{
		width: 160px;
	}
	
	.qna-tbl td{
		width: 160px;
	}
	
	.faq-category{
	
    margin-top: 80px;
}

.faq-category>ul{
    list-style-type: none;
    display: flex;
    justify-content: center;
    padding: 0px;
    margin-right: 30px;
}

.faq-category>ul>li{
    width: 300px;
    height: 60px;
    text-align: center;
    font-size: 50px;
}

.faq-category>ul>li>a{
    text-decoration: none;
    color: rgb(190, 190, 190);
    font-weight: bold;
}

.w3-display-topright:hover{
	background-color: #ffc107!important;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="qna-list-wrap">
        <div class="qna-title">
            <h1>QnA</h1>
        </div>

        <div class="qna-search">
            <form action="/searchQna.do?reqPage=1" method="post">
                <select class="form-select form-select-lg mb-3" name="type" aria-label=".form-select-lg example" style="width: 150px; font-size: 18px; height: 60px; text-align: center;">
                    <option value="titleConetent">제목 + 내용</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>

                <input class="w3-input w3-border w3-round-large" type="text" name="keyword" style="width: 500px; height: 60px; margin-left: 10px;" value="${keyword }">
                <button class="w3-button w3-round-large" style="width: 80px; height: 60px; background-color: rgb(33, 33, 33); color: white;margin-left: 10px;">
                    <span class="material-symbols-outlined">
                    search
                    </span></button>
            </form>
        </div>
        
        <div class="faq-category">
            <ul>
                <li>
                    <a href="/qnalist.do?reqPage=1" <c:if test="${theme != '예약문의' and theme != '마켓문의' and theme != '기타문의' }">style="color: black;"</c:if>>전체</a>
                </li>
                <li>
                    <a href="/selectThemeqna.do?qnaTheme=예약문의&reqPage=1" <c:if test="${theme == '예약문의' }">style="color: black;"</c:if>>예약문의</a>
                </li>
                <li>
                    <a href="/selectThemeqna.do?qnaTheme=마켓문의&reqPage=1" <c:if test="${theme == '마켓문의' }">style="color: black;"</c:if>>마켓문의</a>
                </li>
                <li>
                    <a href="/selectThemeqna.do?qnaTheme=기타문의&reqPage=1" <c:if test="${theme == '기타문의' }">style="color: black;"</c:if>>기타문의</a>
                </li>
            </ul>
        </div>

        <div class="qna-list">
        	
        	<c:choose>
        		<c:when test="${not empty sessionScope.m }">
        			<c:choose>
			        	<c:when test="${empty list }">
			        		
			        		<div class="misMsg">
			        		<div class="warningMark">
		        				<span class="material-symbols-outlined" style="font-size: 80px;">
									error
								</span>
		        			</div>
			        			${msg }	
			        		</div>
			        		
			        	</c:when>
			        	
			        	<c:otherwise>
			        		<c:forEach items="${list }" var="q" varStatus="i">
			        			<table class="qna-tbl">
					                <tr>
					                    <th>${q.qnaWriter }</th>
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                        
					                        	<c:choose>
					                        		<c:when test="${q.secretStatus == 1 and sessionScope.m.memberClass != 1 and sessionScope.m.memberId != q.qnaWriter1 }">
					                        			<span class="material-symbols-outlined">
						                                lock
						                                </span>
						                                
						                                <span onclick="modalMan(this)">
						                                ${q.qnaTitle }
						                                </span>
					                        		</c:when>
					                        		
					                        		<c:otherwise>
					                        			<a href="/qndDetail.do?qnaNo=${q.qnaNo }">${q.qnaTitle }</a>
					                        		</c:otherwise>
					                        	</c:choose>
			
					                            
					                        </div>
					                    </td>
					                    
					                    <td>
					                    	${q.qnaTheme }
					                    </td>
					                    
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                            <span class="material-symbols-outlined">
					                                visibility
					                                </span>
					                                <span>${q.readCnt }</span>
					                        </div>
					                        
					                    </td>
					
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                            <span class="material-symbols-outlined">
					                                schedule
					                                </span>
					                            <span>${q.qnaDate }</span>
					                        </div>
					                    </td>
					
					                    <td>
					                    	<c:choose>
					                    		<c:when test="${q.commentStatus == 0 }">
					                    			<div>답변대기</div>
					                    		</c:when>
					                    		
					                    		<c:otherwise>
					                    			<div style="color:white; background-color:#0dcaf0; ">답변완료</div>
					                    		</c:otherwise>
					                    
					                    	</c:choose>
					                    	
					                        
					                    </td>
					                </tr>
				                </table>
				                
				                <div id="id01" class="w3-modal w3-animate-opacity">
								    <div class="w3-modal-content w3-card-4" style="top: 30%; width: 500px;">
								      <header class="w3-container w3-teal" style="background-color: #ffc107!important;"> 
								        <span onclick="delModal(this);" 
								        class="w3-button w3-large w3-display-topright">&times;</span>
								        <h2 style="margin-top:10px;">비밀번호 확인</h2>
								      </header>
								      <div class="w3-container" style="margin-top: 15px; height: 100px;">
								        <p style="margin-left: 50px;">비밀번호를 입력하세요.</p>
								        <form action="/mypageQna.do" method="post" class="pwFrm">
								        	
								        	<input type="hidden" name="qnaNo" value="${q.qnaNo }">
									        <input class="w3-input w3-border w3-round-large" type="password" name="qnaPassword" style="width: 300px;"><br>
									        <button class="w3-button w3-round" style="margin-left: 10px; background-color: gray; color:white;" onclick="pwChk(this)">확인</button>
								        </form>
								      </div>
								      <footer class="w3-container w3-teal">
								        <p></p>
								      </footer>
								    </div>
								  </div>
			        		</c:forEach>
			        		
			        	</c:otherwise>
			        </c:choose>
        		</c:when>
        		
        		<c:when test="${not empty sessionScope.o }">
        			<c:choose>
			        	<c:when test="${empty list }">
			        		
			        		<div class="misMsg">
			        		<div class="warningMark">
		        				<span class="material-symbols-outlined" style="font-size: 80px;">
									error
								</span>
		        			</div>
			        			${msg }	
			        		</div>
			        		
			        	</c:when>
			        	
			        	<c:otherwise>
			        		<c:forEach items="${list }" var="q" varStatus="i">
			        			<table class="qna-tbl">
					                <tr>
					                    <th>${q.qnaWriter }</th>
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                        
					                        	<c:choose>
					                        		<c:when test="${q.secretStatus == 1 and sessionScope.m.memberClass != 1 and sessionScope.o.ownerId != q.qnaWriter1 }">
					                        			<span class="material-symbols-outlined">
						                                lock
						                                </span>
						                                
						                                <span onclick="modalMan(this)">
						                                ${q.qnaTitle }
						                                </span>
					                        		</c:when>
					                        		
					                        		<c:otherwise>
					                        			<a href="/qndDetail.do?qnaNo=${q.qnaNo }">${q.qnaTitle }</a>
					                        		</c:otherwise>
					                        	</c:choose>
			
					                            
					                        </div>
					                    </td>
					                    
					                    <td>
					                    	${q.qnaTheme }
					                    </td>
					                    
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                            <span class="material-symbols-outlined">
					                                visibility
					                                </span>
					                                <span>${q.readCnt }</span>
					                        </div>
					                        
					                    </td>
					
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                            <span class="material-symbols-outlined">
					                                schedule
					                                </span>
					                            <span>${q.qnaDate }</span>
					                        </div>
					                    </td>
					
					                    <td>
					                    	<c:choose>
					                    		<c:when test="${q.commentStatus == 0 }">
					                    			<div>답변대기</div>
					                    		</c:when>
					                    		
					                    		<c:otherwise>
					                    			<div style="color:white; background-color:#0dcaf0; ">답변완료</div>
					                    		</c:otherwise>
					                    
					                    	</c:choose>
					                    	
					                        
					                    </td>
					                </tr>
				                </table>
				                
				                <div id="id01" class="w3-modal w3-animate-opacity">
								    <div class="w3-modal-content w3-card-4" style="top: 30%; width: 500px;">
								      <header class="w3-container w3-teal" style="background-color: #ffc107!important;"> 
								        <span onclick="delModal(this);" 
								        class="w3-button w3-large w3-display-topright">&times;</span>
								        <h2 style="margin-top:10px;">비밀번호 확인</h2>
								      </header>
								      <div class="w3-container" style="margin-top: 15px; height: 100px;">
								        <p style="margin-left: 50px;">비밀번호를 입력하세요.</p>
								        <form action="/mypageQna.do" method="post" class="pwFrm">
								        	
								        	<input type="hidden" name="qnaNo" value="${q.qnaNo }">
									        <input class="w3-input w3-border w3-round-large" type="password" name="qnaPassword" style="width: 300px;"><br>
									        <button class="w3-button w3-round" style="margin-left: 10px; background-color: gray; color:white;" onclick="pwChk(this)">확인</button>
								        </form>
								      </div>
								      <footer class="w3-container w3-teal">
								        <p></p>
								      </footer>
								    </div>
								  </div>
			        		</c:forEach>
			        		
			        	</c:otherwise>
			        </c:choose>
        		</c:when>
        		
        		<c:otherwise>
        			<c:choose>
			        	<c:when test="${empty list }">
			        		
			        		<div class="misMsg">
			        		<div class="warningMark">
		        				<span class="material-symbols-outlined" style="font-size: 80px;">
									error
								</span>
		        			</div>
			        			${msg }	
			        		</div>
			        		
			        	</c:when>
			        	
			        	<c:otherwise>
			        		<c:forEach items="${list }" var="q" varStatus="i">
			        			<table class="qna-tbl">
					                <tr>
					                    <th>${q.qnaWriter }</th>
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                        
					                        	<c:choose>
					                        		<c:when test="${q.secretStatus == 1 and sessionScope.m.memberClass != 1 }">
					                        			<span class="material-symbols-outlined">
						                                lock
						                                </span>
						                                
						                                <span onclick="modalMan(this)">
						                                ${q.qnaTitle }
						                                </span>
					                        		</c:when>
					                        		
					                        		<c:otherwise>
					                        			<a href="/qndDetail.do?qnaNo=${q.qnaNo }">${q.qnaTitle }</a>
					                        		</c:otherwise>
					                        	</c:choose>
			
					                            
					                        </div>
					                    </td>
					                    
					                    <td>
					                    	${q.qnaTheme }
					                    </td>
					                    
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                            <span class="material-symbols-outlined">
					                                visibility
					                                </span>
					                                <span>${q.readCnt }</span>
					                        </div>
					                        
					                    </td>
					
					                    <td>
					                        <div style="display: flex; justify-content: center;">
					                            <span class="material-symbols-outlined">
					                                schedule
					                                </span>
					                            <span>${q.qnaDate }</span>
					                        </div>
					                    </td>
					
					                    <td>
					                    	<c:choose>
					                    		<c:when test="${q.commentStatus == 0 }">
					                    			<div>답변대기</div>
					                    		</c:when>
					                    		
					                    		<c:otherwise>
					                    			<div style="color:white; background-color:#0dcaf0; ">답변완료</div>
					                    		</c:otherwise>
					                    
					                    	</c:choose>
					                    	
					                        
					                    </td>
					                </tr>
				                </table>
				                
				                <div id="id01" class="w3-modal w3-animate-opacity">
								    <div class="w3-modal-content w3-card-4" style="top: 30%; width: 500px;">
								      <header class="w3-container w3-teal" style="background-color: #ffc107!important;"> 
								        <span onclick="delModal(this);" 
								        class="w3-button w3-large w3-display-topright">&times;</span>
								        <h2 style="margin-top:10px;">비밀번호 확인</h2>
								      </header>
								      <div class="w3-container" style="margin-top: 15px; height: 100px;">
								        <p style="margin-left: 50px;">비밀번호를 입력하세요.</p>
								        <form action="/mypageQna.do" method="post" class="pwFrm">
								        	
								        	<input type="hidden" name="qnaNo" value="${q.qnaNo }">
									        <input class="w3-input w3-border w3-round-large" type="password" name="qnaPassword" style="width: 300px;"><br>
									        <button class="w3-button w3-round" style="margin-left: 10px; background-color: gray; color:white;" onclick="pwChk(this)">확인</button>
								        </form>
								      </div>
								      <footer class="w3-container w3-teal">
								        <p></p>
								      </footer>
								    </div>
								  </div>
			        		</c:forEach>
			        		
			        	</c:otherwise>
			        </c:choose>
        		</c:otherwise>
        	</c:choose>
        	
        	
            
        </div>
		
		<c:if test="${not empty sessionScope.m or not empty sessionScope.o}">
			<div class="qna-btn">
	            <a href="/insertQnaFrm.do">글쓰기</a>
	            
	            <c:choose>
	            	<c:when test="${not empty sessionScope.m }">
	            		<a href="/selectMyQnaList.do?reqPage=1&qnaWriter1=${sessionScope.m.memberId }">내 qna 보기</a>
	            	</c:when>
	            	
	            	<c:otherwise>
	            		<a href="/selectMyQnaList.do?reqPage=1&qnaWriter1=${sessionScope.o.ownerId }">내 qna 보기</a>
	            	</c:otherwise>
	            </c:choose>

	        </div>
		</c:if>

        <div class="paging">
           <!--  <a href="#"><span class="material-symbols-outlined" style="font-size: 30px;">
                chevron_left
                </span>
            </a>
            <a href="#"><span>1</span></a>
            <a href="#"><span>2</span></a>
            <a href="#"><span>3</span></a>
            <a href="#"><span class="material-symbols-outlined"  style="font-size: 30px;">
                chevron_right
                </span></a>
                 -->
                 ${pageNavi }
        </div>
    </div>
	
	  
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script type="text/javascript">
	
		function modalMan(obj){
			$(obj).parents(".qna-tbl").next().css("display", "block");
			
			
		}
		
		function delModal(obj){
			$("[name=qnaPassword]").val('');
			$(".w3-animate-opacity").css("display", "none");
			
			
		}
		
		function pwChk(obj){
			if($("[name=qnaPassword]").eq(obj).val() == ""){
				alert("비밀번호를 입력해주세요.");
				$(obj).attr("type", "button");
			}else{
				$(this).attr("type", "submit");
			}
		}
		
		
		
		/*$(".w3-round").on("click", function(){
			
			console.log("안녕");
			const pwChk = $(".w3-input").val();
			const myPw = $(".myPw").val();
			
			if(pwChk != myPw){
				alert("비밀번호를 다시 입력하세요.");
				$(this).attr("type", "button");
			}else if(pwChk == ""){
				alert("비밀번호를 입력하세요.");
				$(this).attr("type", "button");
			}
		});*/
	</script>
</body>
</html>
























