<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %>

<%
	//Controller로부터 결과 데이터 받음
	ReportDTO[] arr = (ReportDTO[])request.getAttribute("selectReportAdmin");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<!-- MaxCDN 사용 -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- Google 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Google 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap"
	rel="stylesheet">

<!-- 네모 네모 -->
<link rel="shortcut icon" type="image/x-icon"
	href="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/22308828_1362771857179344_2862649104720883557_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_eui2=AeH5lxEnBFrz40hJ6UtdpaQJuBoYtwUvLmC4Ghi3BS8uYAhbV6mwPZVwNDLVqmNQ06N1d9OzpAwE7e94RmBOvcN5&_nc_ohc=UJrBOpVraysAX9EMaAO&_nc_ht=scontent-ssn1-1.xx&oh=ef4a21dc6a1b52af269c893205600fff&oe=5EF360AB">


<script type="text/javascript" src="JS/wk.js"></script>

<link rel="stylesheet" href="../CSS/wk.css" type="text/css">
<link rel="stylesheet" href="../CSS/initialValue.css" type="text/css">
<link rel="stylesheet" href="../CSS/yj.css" type="text/css">
<link rel="stylesheet" href="../CSS/BN/list_admin_bn.css" type="text/css">





<title>너네집</title>
</head>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<body>
	<header style="padding: 0px;" class="col-md-12" id="main_header">
		<div id="main_top1" class="row">
			<div id="main_top1_1" class="col-md-2">
				<h1 id="main_title">너네 집</h1>
			</div>
			<div id="main_top1_2" class="col-md-3">
				<nav>
					<ul>
						<li><a href="#">커뮤니티</a></li>
						<li><a href="#">스토어</a></li>
						<li><a href="#">인테리어시공</a></li>
					</ul>
				</nav>
			</div>
			<div id="main_top1_3" class="col-md-7">
				<div id="search">
					<i class="fas fa-search"></i>
				</div>
				<button id="write">글쓰기</button>
				<!-- <button>
               <i class="fas fa-search"></i>
            </button> -->
				<button>
					<i class="far fa-bookmark"></i>
				</button>
				<button>
					<i class="far fa-bell"></i>
				</button>
				<button>
					<i class="fas fa-shopping-cart"></i>
				</button>
				<button>
					<i class="far fa-user"></i>
				</button>
			</div>
		</div>
		<hr>
		<div id="main_top2" class="row">
			<div class="col-md-12">
				<nav style="padding: 0px;">
					<ul class="menu">
						<li><a href="communityAdmin.community">등록된 게시글</a></li>
						<li><a href="communityAdminComment.community">댓글 목록</a></li>
						<li><a href="communityAdminReport.community">신고 현황</a></li>
					</ul>
				</nav>
			</div>
		</div>

		<hr>
	</header>
	
	
	
	
	<!-- 리스트 노출 -->
	<!-- 리스트 노출  -->
<main role="main" id="root">
<div id="questions-index-page">

  <!-- 헤더창, 질문과 답변 검색 -->
  <section id="questions-header">
    <div class="container">
      <div class="questions-header__title">
        <h1>신고 현황</h1>
      </div>
  </section>
  
  
  <!-- 실질적으로 리스트 노출하는 화면  -->
  <section id="questions-list" class="container">
    <!-- 아래의 a태그는 view 화면에 갈수 있도록 주소 설정하기 -->
    <%
    	if(arr != null) {
    		for(int i = 0; i < arr.length; i++) {
    %>
    <a class="questions-item__link" href="view.community?no=<%= arr[i].getRqno() %>">
      <article class="questions-item">
      
       <table>
        <tr>
        
        <!-- 신고 유형 -->
        <%
        String txt = "";
        
        switch(arr[i].getRtype()) {
        case 0:
        	txt = "주제와 맞지 않음";
        	break;
        case 1:
        	txt = "정보가 부정확함";
        	break;
        case 2:
        	txt = "지나친 광고성 게시물";
        	break;
        case 3:
        	txt = "도배 및 중복 게시물";
        	break;
        case 4:
        	txt = " 저작권 침해가 우려됨";
        	break;
        case 5:
        	txt = "욕설/비방이 심함";
        	break;
        case 6:
        	txt = "외설적인 게시물";
        	break;
        case 7:
        	txt = "개인정보노출";
        	break;
        default:
        	txt = "에러, 데이터가 넘어오지 않았습니다.";
        	break;
        }
        %>
        <td style="width: 80%">
        <h1 class="questions-item__title"><%= txt %></h1>
        </td>
        
        <!-- 신고 아이디 -->
        <td style="width: 15%">
        <span class="questions-item__footer__author">
          <span class="questions-item__footer__author__content"><%= arr[i].getRid() %></span>
        </span>
        </td>
        
        </tr>
       </table>
            
        
      </article>
    </a> 
      
    <%
   			} // end for
   		} // end if
    %>
  </section>
	
	
	
	
	<!-- 바닥입니다. -->
	<footer id="main_footer">
		<div id="main_footer_content">
			<div id="main_footer_icon">
				<i class="fab fa-apple"></i> <i class="fab fa-google-play"></i> <i
					class="fab fa-facebook-f"></i> <i class="fab fa-instagram"></i>
			</div>
			<h1 id="main_footer_h0">고객센터></h1>
			<h1 id="main_footer_h1">1670-0876</h1>
			<h1 id="main_footer_h2">평일 10:00~17:00 (점심시간 12:00~13:00 /
				주말&공휴일 제외)</h1>

			<h1 id="main_footer_h3">브랜드 스토리 회사소개 채용정보 이용약관 개인정보처리방침 고객센터 고객의
				소리 전문가 등록사업자 구매회원제휴/광고 문의입점신청 문의</h1>

			<h1 id="main_footer_h4">상호명(주)버킷플레이스이메일(고객문의)
				help@bucketplace.net (제휴문의)
				contact@bucketplace.net대표이사이승재사업자등록번호119-86-91245통신판매업신고번호제2018-서울서초-0580호주소서울특별시
				서초구 서초대로 398 플래티넘타워 19층</h1>

			<h1 id="main_footer_h5">NICEPAY 안전거래 서비스고객님의 안전거래를 위해 현금 결제 시,
				저희 사이트에서 가입한 구매안전 서비스를 이용할 수 있습니다. 가입 확인</h1>

			<h1 id="main_footer_h6">Copyright © 2014 - 2020 by Bucketplace,
				Inc. All rights reserved</h1>
		</div>
	</footer>

</body>

</html>