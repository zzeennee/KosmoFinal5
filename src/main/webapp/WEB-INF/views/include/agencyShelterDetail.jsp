<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>너와 함개</title>
    

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" id="montserrat-css"
          href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link rel="stylesheet" id="open-sans-css"
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i">

    <link rel="stylesheet" id="animate-css" href="/css/animate.min.css?ver=3.7.2" type="text/css" media="all">
    <link rel="stylesheet" id="font-awesome-css" href="/css/font-awesome.min.css?ver=5.15.4" type="text/css"
          media="all">
    <link rel="stylesheet" id="bootstrap-css" href="/css/bootstrap.min.css?ver=4.6.0" type="text/css" media="all">
    <link rel="stylesheet" id="smartmenus-bootstrap-css" href="/css/smartmenus-bootstrap.min.css?ver=1.1.1"
          type="text/css" media="all">
    <link rel="stylesheet" id="swiper-css" href="/css/swiper.min.css?ver=4.5.3" type="text/css" media="all">
    <link rel="stylesheet" id="magnific-popup-css" href="/css/magnific-popup.min.css?ver=1.1.0" type="text/css"
          media="all">
    <link rel="stylesheet" id="lana-pet-icon-css" href="/css/lana-pet-icon.min.css?ver=1.0.0" type="text/css"
          media="all">
    <link rel="stylesheet" id="lana-pet-theme-css" href="/css/lana-pet-theme.min.css?ver=1.0.0" type="text/css"
          media="all">
    <link rel="stylesheet" id="lana-pet-print-css" href="/css/lana-pet-print.min.css?ver=1.0.0" type="text/css"
          media="print">

    <link rel="stylesheet" href="/css/HeadFootPage.css" type="text/css">
    
     
    <style type="text/css">
    
  
    #pic1 {width: 100%; height: 100%; border: 1px solid #F3E2A9;}
    
    #pic2 {width: 100%; height: 100%; border: 1px solid #F3E2A9;}
    
    #pic3 {width: 100%; height: 100%; border: 1px solid #F3E2A9;}
    
    #managers-container {
      justify-content: space-around;
    }
   
    </style>
  
    
   
   <!--  #employees-container {width: 250px; height: 400px; background: #F8B03A;}-->
   
 </head>

 <%@include file="./Header.jsp" %>

<body class="home page page-template-template-lana-editor">


                
 <!-- ******* main 시작  ******************************************************************* --> 
 
 
 <main class="main">
    
        <div id="post-1" class="lana_pet type-lana_pet post-1">
        
       
        <div class="container post-container">
        
            <div class="row justify-content-center post-row bg-white no-gutters">
            
                <div class="col-12 post-thumbnail-col">
                   
                    <div class="swiper-container gallery-image">
                        
                        
                        <div class="card-body">
                      
                        <img class="card-img-top img-fluid" src="${shelter.abImage}" alt="Post">
                        <h3 class="post-title card-title">${shelter.abKind}</h3>
                        <p class="post-text card-text">
                         ${shelter.abName} 
                        </p>
                        <p>
                        ${shelter.abAge}
                        </p>
                        <p>
                        ${shelter.abGender} 
                        </p>
                        
                       <div style="text-align: center;">
                      <a href="/include/agencyShelterSignup?abNo=${shelter.abNo }"><input  name="submit" type="submit" id="submit" class="btn btn-primary btn-lg text-uppercase font-weight-bold w-15x" value="입양 신청하기"></a>
                       </div>
                     
                    </div>
                        </div>
                        
                    </div>
                  
                </div>
                
            </div>
             
      </div>

</main>
                
                



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript" src="/js/jquery.min.js?ver=3.6.0"></script>
<script type="text/javascript" src="/js/popper.min.js?ver=1.16.1"></script>
<script type="text/javascript" src="/js/bootstrap.min.js?ver=4.6.0"></script>
<script type="text/javascript" src="/js/smartmenus.min.js?ver=1.1.1"></script>
<script type="text/javascript" src="/js/smartmenus-bootstrap.min.js?ver=1.1.1"></script>
<script type="text/javascript" src="/js/swiper.min.js?ver=4.5.3"></script>
<script type="text/javascript" src="/js/scrollmagic.min.js?ver=2.0.8"></script>
<script type="text/javascript" src="/js/magnific-popup.min.js?ver=1.1.0"></script>
<script type="text/javascript" src="/js/custom-theme.js?ver=1.0.0"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a0a025e110dde0902210e297400a7be"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

<script type="text/javascript">

    //eq(0) = ì»¤ë®¤ëí°
	$(document).ready(function(){
        $(".bigCate li.comu").click(function(){
            $(".comunity").removeClass("off");
			$(".organization").addClass("off");
            $(".information").addClass("off");
            $(".myPage").addClass("off");
		});

		$(".bigCate li.organi").click(function(){
            $(".organization").removeClass("off");
			$(".comunity").addClass("off");
            $(".information").addClass("off");
            $(".myPage").addClass("off");
		});

        $(".bigCate li.info").click(function(){
            $(".information").removeClass("off");
			$(".comunity").addClass("off");
            $(".organization").addClass("off");
            $(".myPage").addClass("off");
		});

        $(".bigCate li.myPage").click(function(){
            $(".myPage").removeClass("off");
			$(".comunity").addClass("off");
            $(".information").addClass("off");
            $(".myPage").addClass("off");
		});

	});
</script>


<body class="home page page-template-template-lana-editor">

<footer class="footer bg-dark text-white">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <ul class="nav"><img href="#" src="/img/WithYouTitle.png" class="footerLogo" >
            </ul>
            </div>
            <div class="col-md-4">
                <ul class="nav justify-content-center">
                    <li class="nav-item footerFont"><p class="nav-link">주소 : 서울특별시 금천구 가산디지털2로 123 2차) 월드 메르디앙</p></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul class="nav justify-content-center">
                    <li class="nav-item footerFont"><p class="nav-link">고객센터: 02-2005-8523</p></li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul class="nav justify-content-center">
                    <li class="nav-item footerFont"><p class="nav-link">이메일: swkosmo@daum.net</p></li>
                </ul>
            </div>
        </div>
    </div>
</footer>


</body>
</html>

