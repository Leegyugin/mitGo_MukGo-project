<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/css/storeDetail.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
<script>
	Kakao.init('c089c8172def97eb00c07217cae17495');  
</script>

</head>
<body>
 <!--------------------헤더------------------------->
    <div class="login-join"><a href="#">로그인/회원가입</a></div>
    <div class="header-wrap">
        <div class="header-list1">
            <ul class="ul1">
                <li>맛집리스트</li>
                <li>상품리스트</li>
            </ul>

            <ul class="ul2">
                <li>공지사항</li>
                <li>고객센터</li>
            </ul>

            <a href="#"><img src="/resources/img/pizza.PNG/logo.png" class="logoImg"></a>
        </div>
    </div>

    <!---------------------내용----------------------->
    <div class="content-wrap">
    <div class="content-wrap1">
        <div class="content-wrap1-1">
            <span>[양식]</span>
            <span>스파카나폴리</span>
            <span class="material-symbols-rounded star">star</span>
            <span class="reviewNum">4.3</span>
        </div>

        <div class="content-wrap1-2">
            <a class="material-symbols-rounded share pointer" id="share" href="javascript:shareMessage()">share</a>
            <span class="material-symbols-rounded favorite pointer">favorite</span>
        </div>

    </div>


    <div class="content-wrap2">
        <div class="content-wrap2-1">
        <!-- 사진 슬라이드 영역 -->
            <div class="photo-wrap">
                <ul>
                    <li><img src="/resources/img/pizza1.png" style="height: 460px; width:600px;"></li>
                    <li><img src="/resources/img/pizza2.png" style="height: 460px; width:600px;"></li>
                    <li><img src="/resources/img/pizza3.png" style="height: 460px; width:600px;"></li>
                </ul>

                <div class="slide-navi prev">
                    <span class="material-icons">arrow_back_ios_new</span>
                </div>
                <div class="slide-navi next">
                    <span class="material-icons">arrow_forward_ios</span>
                </div>
            </div> 

        <div class="info-reserve-wrap">
                <table class="w3-table w3-bordered" id="infoTable">
                    <tr>
                        <th>주소</th>
                        <td colspan="3">서울특별시 마포구 양화로 2길 2층</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td colspan="3">02-300-3000</td>
                    </tr>
                    <tr>
                        <th>운영시간</th>
                        <td colspan="3">11:00~20:00</td>
                    </tr>
                    <tr>
                        <th>휴일</th>
                        <td colspan="3">월/화/수</td>
                    </tr>

                    <tr style="height: 47px;">
                        <th style="height: 47px;" >일자</th>
                        <td class="calTd">
                            <div style="height: fit-content;">
                                <label for="datePicker">
                                	<span class="material-symbols-outlined pointer" style="height: fit-content; line-height: 1.2;">calendar_month</span>
                            	</label>
                            </div>
                        </td>
                        <td colspan="2"><input type="text" id="datePicker"></td>
                    </tr>
                    <tr style="height: 47px;">
                        <th>인원</th>
                        <td>
                            <button class="w3-button w3-circle w3-teal" id="down" style="width: 35px; height: 35px; padding: 0;">-</button>
                        </td>
                        <td class="peopleTd"><span class="people">1</span></td>
                        <td>
                            <button class="w3-button w3-circle w3-teal" id="up" style="width: 35px; height: 35px; padding: 0;">+</button>
                        </td>
                    </tr>
                    <tr>
                        <th class="timeTh">시간</th>
                        <td colspan="3">
                            <button class="timeBtn pointer">11:00</button>
                            <button class="timeBtn pointer">12:00</button>
                            <button class="timeBtn pointer">13:00</button>
                            <button class="timeBtn pointer">14:00</button>
                            <button class="timeBtn pointer">15:00</button>
                            <button class="timeBtn pointer">16:00</button>
                            <button class="timeBtn pointer">17:00</button>
                            <button class="timeBtn pointer">18:00</button>
                            <button class="timeBtn pointer">19:00</button>
                            <button class="timeBtn pointer">20:00</button>
                        </td>
                    </tr>
                </table>
                <button name="reserveBtn">예약하기</button>
                <button name="recommendBtn">추천글작성</button>
            </div>
        </div>
    </div>
    </div>

    <!--조회수 및 후기 수-->
    <div class="content-wrap3">
        <div class="content-wrap3-1">
            <span class="material-symbols-outlined">visibility</span>
            <span>100</span>
            <span class="material-symbols-outlined">rate_review</span>
            <span>100</span>
        </div>
    </div>

    <!--상세 페이지-->
    <div class="content-wrap4">
        <div class="testDiv">
        <p class="menuTitle">MENU</p>
        <blockquote class="w3-panel w3-leftbar w3-light-grey" id="menuWrap">
            <div class="menuWrap">
                <p class="menuSubTitle">대표메뉴</p>
                <table class="w3-table w3-bordered" id="menuTable">
                    <tr>
                        <td>피자A</td>
                        <td>--------------------------------------</td>
                        <td>18,000</td>
                    </tr>
                    <tr>
                        <td>피자B</td>
                        <td>--------------------------------------</td>
                        <td>18,000</td>
                    </tr>
                    <tr>
                        <td>피자C</td>
                        <td>--------------------------------------</td>
                        <td>18,000</td>
                    </tr>
                    <tr>
                        <td>피자D</td>
                        <td>--------------------------------------</td>
                        <td>18,000</td>
                    </tr>
                    <tr>
                        <td>피자E</td>
                        <td>--------------------------------------</td>
                        <td>18,000</td>
                    </tr>
                </table>
            </div>
        </blockquote> 

        <div class="food-wrap">
            <div class="w3-card" id="photoWrap">
                <img src="/resources/img/pizza.PNG" style="width:100%">
                <div class="w3-container">
                    <h4><b>PIZZA-A</b></h4>
                    <p>18,000원</p>
                </div>
            </div>

            <div class="w3-card" id="photoWrap">
                <img src="/resources/img/pizza.PNG" style="width:100%">
                <div class="w3-container">
                    <h4><b>PIZZA-B</b></h4>
                    <p>18,000원</p>
                </div>
            </div>

            <div class="w3-card" id="photoWrap">
                <img src="/resources/img/pizza.PNG" style="width:100%">
                <div class="w3-container">
                    <h4><b>PIZZA-C</b></h4>
                    <p>18,000원</p>
                </div>
            </div>

            <div class="w3-card" id="photoWrap">
                <img src="/resources/img/pizza.PNG" style="width:100%">
                <div class="w3-container">
                    <h4><b>PIZZA-D</b></h4>
                    <p>18,000원</p>
                </div>
            </div>
        </div>

        <!----- store부분 ----->
        <p class="menuTitle">STORE</p>
        <blockquote class="w3-panel w3-leftbar w3-light-grey" id="aboutStore">
            <p><i>이대 뒷문 김옥길 기념관 내에 자리한 샌드위치 전문점. 
                노출 콘크리트의 모던한 건물 내부로 들어서면 미술품들이 벽에 걸려 갤러리를 연상. 
                이대의 이탈리안 레스토랑 <지노 프란체스카> 사장님이 운영하고 있음. 
                치아바타 빵에 매콤한 닭다리살과 루꼴라가 들어간 매콤 치킨 샌드위치와 고른곤졸라, 모짜렐라 등 
                4가지의 담백한 치즈로 만들어내는 치즈피자가 인기.</i></p>
        </blockquote> 

        <!-- 사진 슬라이드 영역 -->

            <div class="photo-wrap2">
                <ul>
                    <li><img src="/resources/img/pizza1.png" style="height: 420px; width:100%;"></li>
                    <li><img src="/resources/img/pizza2.png" style="height: 420px; width:100%;"></li>
                    <li><img src="/resources/img/pizza1.png" style="height: 420px; width:100%;"></li>
                </ul>

                <div class="slide-navi2 prev2">
                    <span class="material-icons">arrow_back_ios_new</span>
                </div>
                <div class="slide-navi2 next2">
                    <span class="material-icons">arrow_forward_ios</span>
                </div>
            </div> 

        <!----- LOCATION 부분 ----->
        <p class="menuTitle">LOCATION</p>
        <div class="map-wrap">
            지도 넣을 자리
        </div>

        <!----- 마켓 상품 부분 ----->
        <p class="menuTitle">MARKET</p>
        <div class="market-wrap">
            <div class="w3-card-4" id="marketWrap">
                <img src="/resources/img/pizza.PNG" style="width:100%">
                <div class="w3-container w3-center">
                    <p>상품 A</p>
                </div>
            </div>

            <div class="w3-card-4" id="marketWrap">
                <img src="/resources/img/pizza.PNG" style="width:100%">
                <div class="w3-container w3-center">
                    <p>상품 A</p>
                </div>
            </div>

            <div class="w3-card-4" id="marketWrap">
                <img src="/resources/img/pizza.PNG" style="width:100%">
                <div class="w3-container w3-center">
                    <p>상품 A</p>
                </div>
            </div>
        </div>
        
        <!----- 후기 부분 ----->
        
        <div class="review-wrap">
            <p class="menuTitle" style="display:block;">REVIEW</p>
            <ul class="w3-ul w3-card-4" id="reviewWrapUl">
                <li class="w3-bar" style="height: 270px;">
                    <div class="w3-bar-1">
                        <span class="reviewDelete" style="line-height: 250px;">×</span>
                        <img src="/resources/img/pizza.PNG" class="w3-hide-small" style="float:left;">
                        <div class="w3-bar-item">
                            <span class="w3-large">홍길동</span>
                            <span class="material-symbols-rounded">star</span>
                            <span class="material-symbols-rounded">star</span>
                            <span>3.0</span>
                            <br>
                            <span style="display:inline;float:left;">
                            	너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                            <br>
                            <div class="w3-bar-item-1">
                                <span>피자A</span>
                                <span class="regDate">2022-10-26</span>
                            </div>
                        </div>
                    </div>
                </li>

                <li class="w3-bar" style="height: 270px;">
                    <div class="w3-bar-1">
                        <span class="reviewDelete" style="line-height: 250px;">×</span>
                        <img src="/resources/img/pizza.PNG" class="w3-hide-small" style="float:left;">
                        <div class="w3-bar-item">
                            <span class="w3-large">홍길동</span>
                            <span class="material-symbols-rounded">star</span>
                            <span class="material-symbols-rounded">star</span>
                            <span>3.0</span>
                            <br>
                            <span style="display:inline;float:left;">
                            	너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                            <br>
                            <div class="w3-bar-item-1">
                                <span>피자A</span>
                                <span class="regDate">2022-10-26</span>
                            </div>
                        </div>
                    </div>
                </li>

                <li class="w3-bar" style="height: 270px;">
                    <div class="w3-bar-1">
                        <span class="reviewDelete" style="line-height: 250px;">×</span>
                        <img src="/resources/img/pizza.PNG" class="w3-hide-small" style="float:left;">
                        <div class="w3-bar-item">
                            <span class="w3-large">홍길동</span>
                            <span class="material-symbols-rounded">star</span>
                            <span class="material-symbols-rounded">star</span>
                            <span>3.0</span>
                            <br>
                            <span style="display:inline;float:left;">
                            	너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                너무 맛있어서 눈물이 다 났어요... 또 올게요 사장님ㅠㅠㅠㅠㅠㅠㅠㅠㅠ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
				                                ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
                            <br>
                            <div class="w3-bar-item-1">
                                <span>피자A</span>
                                <span class="regDate">2022-10-26</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
</div>

<script>

	//------------ 메뉴 사진 슬라이더 -----------------
	let imgNo=0; 
	
	const ul = $(".photo-wrap>ul");
	const imgCount = ul.children().length;
	const width = 600;
	ul.css("width",(imgCount*width)+"px"); 
	
	$(".prev").on("click",function(){
	    if(imgNo != 0){
	        imgNo--;
	        const move =-imgNo*width;
	        ul.css("transform","translateX("+move+"px)").css("transition-duration","1s");
	    }
	});
	
	$(".next").on("click",function(){
	    if(imgNo != imgCount-1){
	        imgNo++;
	        const move =-imgNo*width;
	        ul.css("transform","translateX("+move+"px)").css("transition-duration","1s");
	    }
	});
	
	//------------ 매장 사진 슬라이더 -----------------
	
	let imgNo2=0; 
	const ul2 = $(".photo-wrap2>ul");
	const imgCount2 = ul2.children().length;
	const width2 = 922;
	ul2.css("width",(imgCount2*width2)+"px"); 
	
	$(".prev2").on("click",function(){
	    if(imgNo2 != 0){
	        imgNo2--;
	        const move2 =-imgNo2*width2;
	        ul2.css("transform","translateX("+move2+"px)").css("transition-duration","1s");
	    }
	});
	
	$(".next2").on("click",function(){
	    if(imgNo2 != imgCount2-1){
	        imgNo2++;
	        const move2 =-imgNo2*width2;
	        ul2.css("transform","translateX("+move2+"px)").css("transition-duration","1s");
	    }
	});
	
	// ----------- datePicker ---------------------
	
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

    $(function() {
        $("#datePicker").datepicker();
    });
	
    //------------------ 인원수 늘리기 --------------------
    let count =1;
    
    $("#up").on("click",function(e){
    	count++;
    	$(".people").text(count);
    });
    
    $("#down").on("click",function(e){
    	if(count==1){
    		return false;
    	}
    	count--;
    	$(".people").text(count);
    });
    
    //-------------------- 공유하기 버튼 ----------------------------
     function shareMessage() {
    	    Kakao.Share.sendDefault({
    	      objectType: 'location',
    	      address: '서울 영등포구 선유도 이레빌딩',
    	      addressTitle: 'PIZZA',
    	      content: {
    	        title: '신메뉴 출시~ PIZZA',
    	        description: '이번 주는 PIZZA 1+1',
    	        imageUrl:
    	          'http://k.kakaocdn.net/dn/bSbH9w/btqgegaEDfW/vD9KKV0hEintg6bZT4v4WK/kakaolink40_original.png',
    	        link: {
    	          mobileWebUrl: 'http://192.168.10.26/storeDetailView.do',
    	          webUrl: 'http://192.168.10.26/storeDetailView.do',
    	        },
    	      },
    	      buttons: [
    	        {
    	          title: '웹으로 보기',
    	          link: {
        	          mobileWebUrl: 'http://192.168.10.26/storeDetailView.do',
        	          webUrl: 'http://192.168.10.26/storeDetailView.do',
    	          }
    	        }
    	      ]
    	    });
    	  }
   
</script>

</body>
</html>