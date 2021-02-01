<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="assets/FE_index/css/bootstrap.min.css" >
<!-- Icon -->
<link rel="stylesheet" type="text/css" href="assets/FE_index/fonts/line-icons.css">
<!-- Slicknav -->
<link rel="stylesheet" type="text/css" href="assets/FE_index/css/slicknav.css">
<!-- Nivo Lightbox -->
<link rel="stylesheet" type="text/css" href="assets/FE_index/css/nivo-lightbox.css" >
<!-- Animate -->
<link rel="stylesheet" type="text/css" href="assets/FE_index/css/animate.css">
<!-- Main Style -->
<link rel="stylesheet" type="text/css" href="assets/FE_index/css/main.css">
<!-- Responsive Style -->
<link rel="stylesheet" type="text/css" href="assets/FE_index/css/responsive.css">
<!-- 前端用户标签样式 -->
<!-- <link rel="stylesheet" type="text/css" href="assets/FE_index/vendor/linearicons/style.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="assets/FE_index/css/FE_user.css"> -->

<!-- 控制登录/注册div显示或者隐藏 -->
<script src="assets/FE_login/js/jquery.min.js"></script>
<script type="text/javascript">
//使用jquery控制
	$(document).ready(function(){
			var loginState="<%=session.getAttribute("loginState")%>";
			//alert(typeof(loginState));
			//alert(loginState);
			/*
			太奇怪了，null竟然转换为true，可能是版本问题
			*/
			//将string转化为boolean
			//loginState = Boolean(loginState);
			//loginState=false;
			//alert(loginState);
			if(loginState=="true"){
				//alert("true");
				$("#userInfoDiv").show();
				$("#userLoginDiv").hide();
			}else{
				//alert("false");
				$("#userLoginDiv").show();
				$("#userInfoDiv").hide();
			}
	});
</script>
</head>
<body>
<%
	String path = request.getContextPath();
	String basePath =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/pics/"; 
%>
<!-- Header Area wrapper Starts -->
<header id="header-wrap">
  <!-- Navbar Start -->
  <nav class="navbar navbar-expand-lg fixed-top scrolling-navbar">
	<div class="container">
	  <!-- Brand and toggle get grouped for better mobile display -->
	  <div class="navbar-header">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
		  <span class="navbar-toggler-icon"></span>
		  <span class="icon-menu"></span>
		  <span class="icon-menu"></span>
		  <span class="icon-menu"></span>
		</button>
		<a href="#"  class="navbar-brand"><img src="assets/FE_index/img/logo.png" alt="" style=" width: 200px; "></a>
	  </div>
	  <div class="collapse navbar-collapse" id="main-navbar">
		<ul class="navbar-nav mr-auto w-100 justify-content-end">
		  <li class="nav-item active">
			<a class="nav-link" href="#header-wrap">
			  Home
			</a>
		  </li>
<!-- 		  
		  <li class="nav-item">
			<a class="nav-link" href="#about">
			  About
			</a>
		  </li>
		   -->
		  <li class="nav-item">
			<a class="nav-link" href="#schedules">
			  会议活动
			</a>
		  </li>
<!-- 		  
		  <li class="nav-item">
			<a class="nav-link" href="#team">
			  Speakers
			</a>
		  </li>
		   -->
		  <li class="nav-item">
			<a class="nav-link" href="#gallery">
			  图床
			</a>
		  </li>
<!-- 		  
		  <li class="nav-item">
			<a class="nav-link" href="#faq">
			  Faq
			</a>
		  </li>
		   -->
<!-- 		  
		  <li class="nav-item">
			<a class="nav-link" href="#sponsors">
			  Sponsors
			</a>
		  </li>
		   -->
		  <li class="nav-item">
			<a class="nav-link" href="#event-slides">
			  关于我们
			</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link" href="#contact-map">
			  联系我们
			</a>
		  </li>
		</ul>
	  </div>
	  <div id="userLoginDiv">
	  		<a class="nav-link" href="jumpToFE_login.action" style="color:#E91E63">登录</a>
	  </div>
	  <!-- 用户信息 -->
	  
	  <div id="userInfoDiv" class="navbar-menu">
		<div class="dropdown">
			<img src="<%=basePath%>${User.userIcon}" style=" width: 30px; height: 30px;" class="img-circle" alt="头像">
			<a class=" btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">${User.userName}</a>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			  <a class="dropdown-item" href="selectUserInfo.action">我的信息</a>
			  <a class="dropdown-item" href="selectAllApplyByUser.action">我的报名</a>
			  <a class="dropdown-item" href="selectAllUserSign.action">我的签到</a>
			  <a class="dropdown-item" href = "logoutUser.action" >退出</a>
			</div>
		</div>
	</div>
	</div>

	<!-- Mobile Menu Start -->
	<ul class="mobile-menu">
	  <li>
		<a class="page-scrool" href="#header-wrap">Home</a>
	  </li>
<!-- 	  
	  <li>
		<a class="page-scrool" href="#about">About</a>
	  </li>
	   -->
	  <li>
		 <a class="page-scroll" href="#schedules">会议活动</a>
	  </li>
<!-- 	  
	  <li>
		<a class="page-scroll" href="#team">Speakers</a>
	  </li>
	   -->
	  <li>
		<a class="page-scroll" href="#gallery">Gallery</a>
	  </li>
<!-- 	  
	  <li>
		<a class="page-scroll" href="#faq">Faq</a>
	  </li>
	   -->
<!-- 	  
	  <li>
		<a class="page-scroll" href="#sponsors">Sponsors</a>
	  </li>
	   -->
	  <li>
		<a class="page-scroll" href="#event-slides">关于我们</a>
	  </li>
	  <li>
		<a class="page-scroll" href="#contact-map">联系我们</a>
	  </li>
	</ul>
	<!-- Mobile Menu End -->
  </nav>
  <!-- Navbar End -->

  <!-- Main Carousel Section Start -->
  <div id="main-slide" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
	  <li data-target="#main-slide" data-slide-to="0" class="active"></li>
	  <li data-target="#main-slide" data-slide-to="1"></li>
	  <li data-target="#main-slide" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
	  <div class="carousel-item active">
		<img class="d-block w-100" src="assets/FE_index/img/slider/s1.jpg" alt="First slide">
<!-- 		
		<div class="carousel-caption d-md-block">
		  <p class="fadeInUp wow" data-wow-delay=".6s">Global Grand Event on Digital Design</p>
		  <h1 class="wow fadeInDown heading" data-wow-delay=".4s">Design Thinking Conference</h1>
		  <a href="#" class="fadeInLeft wow btn btn-common btn-lg" data-wow-delay=".6s">Get Ticket</a>
		  <a href="#" class="fadeInRight wow btn btn-border btn-lg" data-wow-delay=".6s">Explore More</a>
		</div>
		 -->
	  </div>
	  <div class="carousel-item">
		<img class="d-block w-100" src="assets/FE_index/img/slider/s2.jpg" alt="Second slide">
<!-- 		
		<div class="carousel-caption d-md-block">
		  <p class="fadeInUp wow" data-wow-delay=".6s">Global Grand Event on Digital Design</p>
		  <h1 class="wow bounceIn heading" data-wow-delay=".7s">22 Amazing Speakers</h1>
		  <a href="#" class="fadeInUp wow btn btn-border btn-lg" data-wow-delay=".8s">Learn More</a>
		</div>
		 -->
	  </div>
	  <div class="carousel-item">
		<img class="d-block w-100" src="assets/FE_index/img/slider/s3.jpg" alt="Third slide">
<!-- 		
		<div class="carousel-caption d-md-block">
		  <p class="fadeInUp wow" data-wow-delay=".6s">Global Grand Event on Digital Design</p>
		  <h1 class="wow fadeInUp heading" data-wow-delay=".6s">Book Your Seat Now!</h1>
		  <a href="#" class="fadeInUp wow btn btn-common btn-lg" data-wow-delay=".8s">Explore</a>
		</div>
		 -->
	  </div>
	</div>
	<a class="carousel-control-prev" href="#main-slide" role="button" data-slide="prev">
	  <span class="carousel-control" aria-hidden="true"><i class="lni-chevron-left"></i></span>
	  <span class="sr-only">Previous</span>
	</a>
	<a class="carousel-control-next" href="#main-slide" role="button" data-slide="next">
	  <span class="carousel-control" aria-hidden="true"><i class="lni-chevron-right"></i></span>
	  <span class="sr-only">Next</span>
	</a>
  </div>
  <!-- Main Carousel Section End -->

</header>
<!-- Header Area wrapper End -->

<!-- Coundown Section Start -->
<!-- 
<section class="countdown-timer section-padding">
  <div class="container">
	<div class="row text-center">
	  <div class="col-md-12 col-sm-12 col-xs-12">
		<div class="heading-count">
		  <h2 class="wow fadeInDown" data-wow-delay="0.2s">Event Will Start In</h2>
		</div>
	  </div>
	  <div class="col-md-12 col-sm-12 col-xs-12">
		<div class="row time-countdown justify-content-center wow fadeInUp" data-wow-delay="0.2s">
		  <div id="clock" class="time-count"></div>
		</div>
		<a href="pricing.html" class="btn btn-common wow fadeInUp" data-wow-delay="0.3s">Add to My Calender</a>
	  </div>
	</div>
  </div>
</section>
 -->
<!-- Coundown Section End -->

 <!-- Services Section Start -->
<section id="services" class="services section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">你能收获什么？</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">参与会议活动，究竟有什么好处？为什么人们热衷于进行会议讨论？</p>
		</div>
	  </div>
	</div>
	<div class="row services-wrapper">
	  <!-- Services item -->
	  <div class="col-md-6 col-lg-4 col-xs-12 padding-none">
		<div class="services-item wow fadeInDown" data-wow-delay="0.2s">
		  <div class="icon">
			<i class="lni-pulse"></i>
		  </div>
		  <div class="services-content">
			<h3><a href="#">交流，思想碰撞的火花</a></h3>
			<p>思想的碰撞是独立思考能力形成的重要方式， 一代新人换旧人是历史永远的主题，思想的碰撞从来不缺乏新意。 </p>
		  </div>
		</div>
	  </div>
	  <!-- Services item -->
	  <div class="col-md-6 col-lg-4 col-xs-12 padding-none">
		<div class="services-item wow fadeInDown" data-wow-delay="0.4s">
		  <div class="icon">
			<i class="lni-heart"></i>
		  </div>
		  <div class="services-content">
			<h3><a href="#">相遇，插肩而过的瞬间</a></h3>
			<p>人的一生会遇到2920 万人，我们彼此相识的概率为0.000049，相遇，也是一种缘分。</p>
		  </div>
		</div>
	  </div>
	  <!-- Services item -->
	  <div class="col-md-6 col-lg-4 col-xs-12 padding-none">
		<div class="services-item wow fadeInDown" data-wow-delay="0.6s">
		  <div class="icon">
			<i class="lni-reload"></i>
		  </div>
		  <div class="services-content">
			<h3><a href="#">认知，流水不腐的态度</a></h3>
			<p>认知是关于有机体学习的内部加工过程，如信息、知识及经验的获得和记忆、达到顿悟、使观念和概念相互联系以及问题解决。</p>
		  </div>
		</div>
	  </div>
	  <!-- Services item -->
	  <div class="col-md-6 col-lg-4 col-xs-12 padding-none">
		<div class="services-item wow fadeInDown" data-wow-delay="0.8s">
		  <div class="icon">
			<i class="lni-cup"></i>
		  </div>
		  <div class="services-content">
			<h3><a href="#">成就，醍醐灌顶的喜悦</a></h3>
			<p>做自己喜欢做的事情，做自己擅长的事情，找回成功的喜悦，找回失去的信心，找到前进动力和方向。</p>
		  </div>
		</div>
	  </div>
	   <!-- Services item -->
	  <div class="col-md-6 col-lg-4 col-xs-12 padding-none">
		<div class="services-item wow fadeInDown" data-wow-delay="1s">
		  <div class="icon">
			<i class="lni-user"></i>
		  </div>
		  <div class="services-content">
			<h3><a href="#">友谊，现实活动的机遇</a></h3>
			<p>从社会学的意义上看，当个人的活动涉及到他人的活动时，才能称为社会活动。</p>
		  </div>
		</div>
	  </div>
	   <!-- Services item -->
	  <div class="col-md-6 col-lg-4 col-xs-12 padding-none">
		<div class="services-item wow fadeInDown" data-wow-delay="1.2s">
		  <div class="icon">
			<i class="lni-coffee-cup"></i>
		  </div>
		  <div class="services-content">
			<h3><a href="#">放松，慰藉心灵的启迪</a></h3>
			<p>能拥抱黑夜，也请歌颂黎明。劳累的心灵，需要光明的慰籍。我们可以发现身边的美好，只要你肯去发现。</p>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- Services Section End -->


<!-- About Section Start -->
<!-- 
<section id="about" class="section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">About This Events</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">Global Grand Event on Digital Design</p>
		</div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-md-6 col-lg-4">
		<div class="about-item">
		  <img class="img-fluid" src="assets/FE_index/img/about/img1.jpg" alt="">
		  <div class="about-text">
			<h3><a href="#">Wanna Know Our Mission?</a></h3>
			<p>Lorem ipsum dolor sit amet, consectetuer commodo ligula eget dolor.</p>
			<a class="btn btn-common btn-rm" href="#">Read More</a>
		  </div>
		</div>
	  </div>
	  <div class="col-xs-12 col-md-6 col-lg-4">
		<div class="about-item">
		  <img class="img-fluid" src="assets/FE_index/img/about/img2.jpg" alt="">
		  <div class="about-text">
			<h3><a href="#">What you will learn?</a></h3>
			<p>Lorem ipsum dolor sit amet, consectetuer commodo ligula eget dolor.</p>
			<a class="btn btn-common btn-rm" href="#">Read More</a>
		  </div>
		</div>
	  </div>
	  <div class="col-xs-12 col-md-6 col-lg-4">
		<div class="about-item">
		  <img class="img-fluid" src="assets/FE_index/img/about/img3.jpg" alt="">
		  <div class="about-text">
			<h3><a href="#">What are the benifits?</a></h3>
			<p>Lorem ipsum dolor sit amet, consectetuer commodo ligula eget dolor.</p>
			<a class="btn btn-common btn-rm" href="#">Read More</a>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
 -->
<!-- About Section End -->

<!-- Counter Area Start-->
<section class="counter-section section-padding">
  <div class="container">
	<div class="row">
	  <!-- Counter Item -->
	  <div class="col-md-6 col-lg-3 col-xs-12 work-counter-widget text-center">
		<div class="counter wow fadeInRight" data-wow-delay="0.3s">
		  <div class="icon"><i class="lni-clipboard"></i></div>
		  <p>活动报名</p>
		  <!-- <span>San Francisco, CA</span> -->
		</div>
	  </div>
	  <!-- Counter Item -->
	  <div class="col-md-6 col-lg-3 col-xs-12 work-counter-widget text-center">
		<div class="counter wow fadeInRight" data-wow-delay="0.6s">
		  <div class="icon"><i class="lni-pencil-alt"></i></div>
		  <p>活动签到</p>
		 <!--  <span>09:00 AM – 05:00 PM</span> -->
		</div>
	  </div>
	  <!-- Counter Item -->
	  <div class="col-md-6 col-lg-3 col-xs-12 work-counter-widget text-center">
		<div class="counter wow fadeInRight" data-wow-delay="0.9s">
		  <div class="icon"><i class="lni-tab"></i></div>
		  <p>会议活动</p>       
		  <!-- <span>Hurryup! few tickets are left</span> -->
		</div>
	  </div>
	  <!-- Counter Item -->
	  <div class="col-md-6 col-lg-3 col-xs-12 work-counter-widget text-center">
		<div class="counter wow fadeInRight" data-wow-delay="1.2s">
		  <div class="icon"><i class="lni-users"></i></div>
		  <p>数据统计</p>
		  <!-- <span>Don’t miss it</span> -->
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- Counter Area End-->

<!-- Schedule Section Start -->
<section id="schedules" class="schedule section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">会议活动表</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">我们会根据学校相关内容尽快更新 <br> 希望能满足你的需求</p>
		</div>
	  </div>
	</div>
	<div style="color: red;text-align: center;">${ApplyTips}</div>
	<div class="schedule-area row wow fadeInDown" data-wow-delay="0.3s">
	  <div class="schedule-tab-title col-md-3 col-lg-3 col-xs-12">
		<div class="table-responsive">
		  <ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">
			  <a class="nav-link active" id="monday-tab" data-toggle="tab" href="#monday" role="tab" aria-controls="monday" aria-expanded="true">
				<div class="item-text">
				  <h4>学术会议</h4>
				</div>
			  </a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" id="tuesday-tab" data-toggle="tab" href="#tuesday" role="tab" aria-controls="tuesday">
				<div class="item-text">
				  <h4>教务活动</h4>
				</div>
			  </a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" id="wednesday-tab" data-toggle="tab" href="#wednesday" role="tab" aria-controls="wednesday">
				<div class="item-text">
				  <h4>校园生活</h4>
				</div>
			  </a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" id="thursday-tab" data-toggle="tab" href="#thursday" role="tab" aria-controls="thursday">
				<div class="item-text">
				  <h4>其他</h4>
				</div>
			  </a>
			</li>
		  </ul>
		</div>
	  </div>
	  <div class="schedule-tab-content col-md-9 col-lg-9 col-xs-12 clearfix">
		<div class="tab-content" id="myTabContent">
		  <div class="tab-pane fade show active" id="monday" role="tabpanel" aria-labelledby="monday-tab">
			<div id="accordion">
			<!-- 遍历取值 -->
			<c:forEach var="typeSchool" items="${ConfTypeSchool}">
			  <div class="card">
				<div id="headingOne">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					<div class="images-box">
					  <img class="img-fluid" src="<%=basePath%>${typeSchool.confLocationImg}" alt="">
					</div>                     
					<span class="time">会议时间：${typeSchool.confTime}</span>
					<h4>会议名：${typeSchool.confName}</h4>
					<h5 class="name">主持人：${typeSchool.confPerson}</h5><a style="float: right" href="jumpTo_FE_user_apply.action?TranApplyId=${typeSchool.applyId}">报名</a>
				  </div>
				</div>
				<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				  <div class="card-body">
					<p>${typeSchool.confIntro}</p>
					<div class="location">
					  <span>地点:</span> ${typeSchool.confLocation}
					</div>
				  </div>
				</div>
			  </div>
			  </c:forEach>
			  <!-- 遍历取值 -->
<!-- 			  
			  <div class="card">
				<div id="headingTwo">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-2.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>15 Free Productive Design Tools</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			  <div class="card">
				<div id="headingThree">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-3.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Getting Started With SketchApp</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
		 -->	  
			</div>
		  </div>
		  <div class="tab-pane fade" id="tuesday" role="tabpanel" aria-labelledby="tuesday-tab">
			<div id="accordion2">
			
			<c:forEach var="typeEducation" items="${ConfTypeEducation}">
			  <div class="card">
				<div id="headingOne1">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="false" aria-controls="collapseOne1">
					<div class="images-box">
					  <img class="img-fluid" src="<%=basePath%>${typeEducation.confLocationImg}" alt="">
					</div>                     
					<span class="time">会议时间：${typeEducation.confTime}</span>
					<h4>会议名：${typeEducation.confName}</h4>
					<h5 class="name">主持人：${typeEducation.confPerson}</h5><a style="float: right" href="jumpTo_FE_user_apply.action?TranApplyId=${typeEducation.applyId}">报名</a>
				  </div>
				</div>
				<div id="collapseOne1" class="collapse show" aria-labelledby="headingOne1" data-parent="#accordion2">
				  <div class="card-body">
					<p>${typeEducation.confIntro}</p>
					<div class="location">
					  <span>地点:</span> ${typeEducation.confLocation}
					</div>
				  </div>
				</div>
			  </div>
			  </c:forEach>
<!-- 			  
			  <div class="card">
				<div id="headingTwo2">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-2.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo2" data-parent="#accordion2">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			   -->
			  
			</div>
		  </div>
		  <div class="tab-pane fade" id="wednesday" role="tabpanel" aria-labelledby="wednesday-tab">
			<div id="accordion3">
			
			  <c:forEach var="typeLife" items="${ConfTypeLife}">
			  <div class="card">
				<div id="headingOne3">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne3" aria-expanded="false" aria-controls="collapseOne3">
					<div class="images-box">
					  <img class="img-fluid" src="<%=basePath%>${typeLife.confLocationImg}" alt="">
					</div>                     
					<span class="time">会议时间：${typeLife.confTime}</span>
					<h4>会议名：${typeLife.confName}</h4>
					<h5 class="name">主持人：${typeLife.confPerson}</h5><a style="float: right" href="jumpTo_FE_user_apply.action?TranApplyId=${typeLife.applyId}">报名</a>
				  </div>
				</div>
				<div id="collapseOne3" class="collapse show" aria-labelledby="headingOne3" data-parent="#accordion3">
				  <div class="card-body">
					<p>${typeLife.confIntro}</p>
					<div class="location">
					  <span>地点:</span> ${typeLife.confLocation}
					</div>
				  </div>
				</div>
			  </div>
			  </c:forEach>
<!-- 			  
			  <div class="card">
				<div id="headingTwo3">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo3" aria-expanded="false" aria-controls="collapseTwo3">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-2.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseTwo3" class="collapse" aria-labelledby="headingTwo3" data-parent="#accordion3">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			  <div class="card">
				<div id="headingThree3">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-3.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseThree3" class="collapse" aria-labelledby="headingThree3" data-parent="#accordion3">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			   -->
			  
			</div>
		  </div>
		  <div class="tab-pane fade" id="thursday" role="tabpanel" aria-labelledby="thursday-tab">
			<div id="accordion4">
			
			<c:forEach var="typeOther" items="${ConfTypeOther}">
			  <div class="card">
				<div id="headingOne">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne4" aria-expanded="false" aria-controls="collapseOne4">
					<div class="images-box">
					  <img class="img-fluid" src="<%=basePath%>${typeOther.confLocationImg}" alt="">
					</div>                     
					<span class="time">会议时间：${typeOther.confTime}</span>
					<h4>会议名：${typeOther.confName}</h4>
					<h5 class="name">主持人：${typeOther.confPerson}</h5><a style="float: right" href="jumpTo_FE_user_apply.action?TranApplyId=${typeOther.applyId}">报名</a>
				  </div>
				</div>
				<div id="collapseOne4" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion4">
				  <div class="card-body">
					<p>${typeOther.confIntro}</p>
					<div class="location">
					  <span>地点:</span> ${typeOther.confLocation}
					</div>
				  </div>
				</div>
			  </div>
			  </c:forEach>
<!-- 			  
			  <div class="card">
				<div id="headingTwo">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo4" aria-expanded="false" aria-controls="collapseTwo4">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-2.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseTwo4" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion4">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			  <div class="card">
				<div id="headingThree4">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree4" aria-expanded="false" aria-controls="collapseThree4">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-3.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseThree4" class="collapse" aria-labelledby="headingThree" data-parent="#accordion4">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			   -->
			  
			</div>
		  </div>
		  
		  
		  <div class="tab-pane fade" id="friday" role="tabpanel" aria-labelledby="friday-tab">
			<div id="accordion">
			  <div class="card">
				<div id="headingOne">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-1.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			  <div class="card">
				<div id="headingTwo">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-2.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			  <div class="card">
				<div id="headingThree">
				  <div class="collapsed card-header" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					<div class="images-box">
					  <img class="img-fluid" src="assets/FE_index/img/speaker/speakers-3.jpg" alt="">
					</div>                     
					<span class="time">10am - 12:30pm</span>
					<h4>Web Design Principles and Best Practices</h4>
					<h5 class="name">David Warner</h5>
				  </div>
				</div>
				<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
				  <div class="card-body">
					<p>Consectetur adipisicing elit. Quod distinctio impedit sint accusantium ducimus lites consequuntur innobisl dolores saepe.Proin sit amet turpis lobortis.</p>
					<div class="location">
					  <span>Location:</span> Hall 1 , Building A, Golden Street, Southafrica
					</div>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- Schedule Section End -->
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >建站模板</a></div>
<!-- Team Section Start -->

<!-- <section id="team" class="section-padding text-center">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">Who's Speaking?</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">Global Grand Event on Digital Design</p>
		</div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-sm-6 col-md-6 col-lg-4">
		Team Item Starts
		<div class="team-item wow fadeInUp" data-wow-delay="0.2s">
		  <div class="team-img">
			<img class="img-fluid" src="assets/FE_index/img/team/team-01.jpg" alt="">
			<div class="team-overlay">
			  <div class="overlay-social-icon text-center">
				<ul class="social-icons">
				  <li><a href="#"><i class="lni-facebook-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-twitter-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-linkedin-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-behance" aria-hidden="true"></i></a></li>
				</ul>
			  </div>
			</div>
		  </div>
		  <div class="info-text">
			<h3><a href="#">JONATHON DOE</a></h3>
			<p>Product Designer, Tesla</p>
		  </div>
		</div>
		Team Item Ends
	  </div>
	  <div class="col-sm-6 col-md-6 col-lg-4">
		Team Item Starts
		<div class="team-item wow fadeInUp" data-wow-delay="0.4s">
		  <div class="team-img">
			<img class="img-fluid" src="assets/FE_index/img/team/team-02.jpg" alt="">
			<div class="team-overlay">
			  <div class="overlay-social-icon text-center">
				<ul class="social-icons">
				  <li><a href="#"><i class="lni-facebook-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-twitter-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-linkedin-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-behance" aria-hidden="true"></i></a></li>
				</ul>
			  </div>
			</div>
		  </div>
		  <div class="info-text">
			<h3><a href="#">Patric Green</a></h3>
			<p>Front-end Developer, Dropbox</p>
		  </div>
		</div>
		Team Item Ends
	  </div>

	  <div class="col-sm-6 col-md-6 col-lg-4">
		Team Item Starts
		<div class="team-item wow fadeInUp" data-wow-delay="0.6s">
		  <div class="team-img">
			<img class="img-fluid" src="assets/FE_index/img/team/team-03.jpg" alt="">
			<div class="team-overlay">
			  <div class="overlay-social-icon text-center">
				<ul class="social-icons">
				  <li><a href="#"><i class="lni-facebook-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-twitter-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-linkedin-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-behance" aria-hidden="true"></i></a></li>
				</ul>
			  </div>
			</div>
		  </div>
		  <div class="info-text">
			<h3><a href="#">Paul Kowalsy</a></h3>
			<p>Lead Designer, TNW</p>
		  </div>
		</div>
		Team Item Ends
	  </div>

	  <div class="col-sm-6 col-md-6 col-lg-4">
		Team Item Starts
		<div class="team-item wow fadeInUp" data-wow-delay="0.8s">
		  <div class="team-img">
			<img class="img-fluid" src="assets/FE_index/img/team/team-04.jpg" alt="">
			<div class="team-overlay">
			  <div class="overlay-social-icon text-center">
				<ul class="social-icons">
				  <li><a href="#"><i class="lni-facebook-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-twitter-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-linkedin-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-behance" aria-hidden="true"></i></a></li>
				</ul>
			  </div>
			</div>
		  </div>
		  <div class="info-text">
			<h3><a href="#">Jhon Doe</a></h3>
			<p>Back-end Developer, ASUS</p>
		  </div>
		</div>
		Team Item Ends
	  </div>
	  <div class="col-sm-6 col-md-6 col-lg-4">
		Team Item Starts
		<div class="team-item wow fadeInUp" data-wow-delay="1s">
		  <div class="team-img">
			<img class="img-fluid" src="assets/FE_index/img/team/team-05.jpg" alt="">
			<div class="team-overlay">
			  <div class="overlay-social-icon text-center">
				<ul class="social-icons">
				  <li><a href="#"><i class="lni-facebook-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-twitter-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-linkedin-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-behance" aria-hidden="true"></i></a></li>
				</ul>
			  </div>
			</div>
		  </div>
		  <div class="info-text">
			<h3><a href="#">Daryl Dixon</a></h3>
			<p>Full-stack Developer, Google</p>
		  </div>
		</div>
		Team Item Ends
	  </div>
	  <div class="col-sm-6 col-md-6 col-lg-4">
		Team Item Starts
		<div class="team-item wow fadeInUp" data-wow-delay="1.2s">
		  <div class="team-img">
			<img class="img-fluid" src="assets/FE_index/img/team/team-06.jpg" alt="">
			<div class="team-overlay">
			  <div class="overlay-social-icon text-center">
				<ul class="social-icons">
				  <li><a href="#"><i class="lni-facebook-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-twitter-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-linkedin-filled" aria-hidden="true"></i></a></li>
				  <li><a href="#"><i class="lni-behance" aria-hidden="true"></i></a></li>
				</ul>
			  </div>
			</div>
		  </div>
		  <div class="info-text">
			<h3><a href="#">Chris Adams</a></h3>
			<p>UI Designer, Apple</p>
		  </div>
		</div>
		Team Item Ends
	  </div>
	</div>
	<a href="speakers.html" class="btn btn-common mt-30 wow fadeInUp" data-wow-delay="1.9s">All Speakers</a>
  </div>
</section>
Team Section End -->

<!-- Gallary Section Start -->
<section id="gallery" class="section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">会议活动图片</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">欢迎你的参与</p>
		</div>
	  </div> 
	</div>
	<div class="row">
	  <div class="col-md-6 col-sm-6 col-lg-4">
		<div class="gallery-box">
		  <div class="img-thumb">
			<img class="img-fluid" src="assets/FE_index/img/gallery/img-1.jpg" alt="">
		  </div>
		  <div class="overlay-box text-center">
			<a class="lightbox" href="assets/FE_index/img/gallery/img-1.jpg">
			  <i class="lni-plus"></i>
			</a>
		  </div>
		</div>
	  </div>
	  <div class="ccol-md-6 col-sm-6 col-lg-4">
		<div class="gallery-box">
		  <div class="img-thumb">
			<img class="img-fluid" src="assets/FE_index/img/gallery/img-2.jpg" alt="">
		  </div>
		  <div class="overlay-box text-center">
			<a class="lightbox" href="assets/FE_index/img/gallery/img-2.jpg">
			  <i class="lni-plus"></i>
			</a>
		  </div>
		</div>
	  </div>
	  <div class="ccol-md-6 col-sm-6 col-lg-4">
		<div class="gallery-box">
		  <div class="img-thumb">
			<img class="img-fluid" src="assets/FE_index/img/gallery/img-3.jpg" alt="">
		  </div>
		  <div class="overlay-box text-center">
			<a class="lightbox" href="assets/FE_index/img/gallery/img-3.jpg">
			  <i class="lni-plus"></i>
			</a>
		  </div>
		</div>
	  </div>
	  <div class="ccol-md-6 col-sm-6 col-lg-4">
		<div class="gallery-box">
		  <div class="img-thumb">
			<img class="img-fluid" src="assets/FE_index/img/gallery/img-4.jpg" alt="">
		  </div>
		  <div class="overlay-box text-center">
			<a class="lightbox" href="assets/FE_index/img/gallery/img-4.jpg">
			  <i class="lni-plus"></i>
			</a>
		  </div>
		</div>
	  </div>
	  <div class="ccol-md-6 col-sm-6 col-lg-4">
		<div class="gallery-box">
		  <div class="img-thumb">
			<img class="img-fluid" src="assets/FE_index/img/gallery/img-5.jpg" alt="">
		  </div>
		  <div class="overlay-box text-center">
			<a class="lightbox" href="assets/FE_index/img/gallery/img-5.jpg">
			  <i class="lni-plus"></i>
			</a>
		  </div>
		</div>
	  </div>
	  <div class="ccol-md-6 col-sm-6 col-lg-4">
		<div class="gallery-box">
		  <div class="img-thumb">
			<img class="img-fluid" src="assets/FE_index/img/gallery/img-6.jpg" alt="">
		  </div>
		  <div class="overlay-box text-center">
			<a class="lightbox" href="assets/FE_index/img/gallery/img-6.jpg">
			  <i class="lni-plus"></i>
			</a>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section> 

<!-- Gallary Section End -->

<!-- Ask Question Section Start -->
<!-- 
<section id="faq" class="section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">Ask Question?</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">Global Grand Event on Digital Design</p>
		</div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
		<div class="accordion">
		  <div class="card">
			<div class="card-header" id="headingOne">
			  <div class="header-title" data-toggle="collapse" data-target="#questionOne" aria-expanded="true" aria-controls="collapseOne">
				<i class="lni-pencil"></i> How to make a new event?
			  </div>
			</div>
			<div id="questionOne" class="collapse" aria-labelledby="headingOne" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		  <div class="card">
			<div class="card-header" id="headingTwo">
				<div class="header-title" data-toggle="collapse" data-target="#questionTwo" aria-expanded="false" aria-controls="questionTwo">
				  <i class="lni-pencil"></i>  Which payment methods do you accept? 
				</div>
			</div>
			<div id="questionTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		  <div class="card">
			<div class="card-header" id="headingThree">
			  <div class="header-title" data-toggle="collapse" data-target="#questionThree" aria-expanded="false" aria-controls="questionThree">
				<i class="lni-pencil"></i>  Which document can i bring to meeting?   
			  </div>
			</div>
			<div id="questionThree" class="collapse" aria-labelledby="headingThree" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		  <div class="card">
			<div class="card-header" id="headingThree">
			  <div class="header-title" data-toggle="collapse" data-target="#questionFour" aria-expanded="false" aria-controls="questionFour">
			   <i class="lni-pencil"></i> Who can join at the live event venue?
			  </div>
			</div>
			<div id="questionFour" class="collapse" aria-labelledby="headingThree" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	  <div class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
		<div class="accordion">
		  <div class="card">
			<div class="card-header" id="headingOne2">
			  <div class="header-title" data-toggle="collapse" data-target="#questionOne2" aria-expanded="true" aria-controls="collapseOne">
				<i class="lni-pencil"></i> How to make a new event?
			  </div>
			</div>
			<div id="questionOne2" class="collapse" aria-labelledby="headingOne" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		  <div class="card">
			<div class="card-header" id="headingTwo2">
				<div class="header-title" data-toggle="collapse" data-target="#questionTwo2" aria-expanded="false" aria-controls="questionTwo">
				  <i class="lni-pencil"></i>  Which payment methods do you accept? 
				</div>
			</div>
			<div id="questionTwo2" class="collapse" aria-labelledby="headingTwo" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		  <div class="card">
			<div class="card-header" id="headingThree">
			  <div class="header-title" data-toggle="collapse" data-target="#questionFive" aria-expanded="false" aria-controls="questionFive">
				<i class="lni-pencil"></i>How to set price? 
			  </div>
			</div>
			<div id="questionFive" class="collapse" aria-labelledby="headingThree" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		  <div class="card">
			<div class="card-header" id="headingThree">
			  <div class="header-title" data-toggle="collapse" data-target="#questionSix" aria-expanded="false" aria-controls="questionSix">
				<i class="lni-pencil"></i>  What our price list? 
			  </div>
			</div>
			<div id="questionSix" class="collapse" aria-labelledby="headingThree" data-parent="#question">
			  <div class="card-body">
				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section> 
-->
<!-- Ask Question Section End -->

<!-- Sponsors Section Start -->
<!-- 
<section id="sponsors" class="section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">Sponsores</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">Global Grand Event on Digital Design</p>
		</div>
	  </div>
	</div>
	<div class="row mb-30 text-center wow fadeInDown" data-wow-delay="0.3s">
	  <div class="col-md-3 col-sm-3 col-xs-12">
		<div class="spnsors-logo">
		  <a href="#"><img class="img-fluid" src="assets/FE_index/img/sponsors/logo-01.png" alt=""></a>
		</div>
	  </div>
	  <div class="col-md-3 col-sm-3 col-xs-12">
		<div class="spnsors-logo">
		  <a href="#"><img class="img-fluid" src="assets/FE_index/img/sponsors/logo-02.png" alt=""></a>
		</div>
	  </div>
	  <div class="col-md-3 col-sm-3 col-xs-12">
		<div class="spnsors-logo">
		  <a href="#"><img class="img-fluid" src="assets/FE_index/img/sponsors/logo-03.png" alt=""></a>
		</div>
	  </div>
	  <div class="col-md-3 col-sm-3 col-xs-12">
		<div class="spnsors-logo">
		  <a href="#"><img class="img-fluid" src="assets/FE_index/img/sponsors/logo-04.png" alt=""></a>
		</div>
	  </div>
	  <div class="col-12 text-center">
		<a href="#" class="btn btn-common">become a sponsor</a>
	  </div>
	</div>
  </div>
</section>
 -->
<!-- Sponsors Section End -->

<!-- Ticket Pricing Area Start -->
<!-- 
<section id="pricing" class="section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">Our Pricing</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">Global Grand Event on Digital Design</p>
		</div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-lg-4 col-sm-6 col-xa-12 mb-3">
		<div class="price-block-wrapper wow fadeInLeft" data-wow-delay="0.2s">
		  <div class="icon">
			<i class="lni-write"></i>
		  </div>
		  <div class="colmun-title">
			<h5>Basic Pass</h5>
		  </div>
		  <div class="price">
			<h2>$29</h2>
			<p>452 Tickets Available</p>
		  </div>
		  <div class="pricing-list">
			<ul>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Entrance</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Coffee Break</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Lunch on all days</span></li>
			  <li><i class="lni-close"></i><span class="text">Access to all areas</span></li>
			  <li><i class="lni-close"></i><span class="text">Certificate</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Workshop</span></li>
			</ul>
		  </div>
		  <a href="#" class="btn btn-common">Buy Ticket</a>
		</div>
	  </div>
	  <div class="col-lg-4 col-sm-6 col-xa-12 mb-3">
		<div class="price-block-wrapper wow fadeInUp" data-wow-delay="0.3s">
		  <div class="icon">
			<i class="lni-layers"></i>
		  </div>
		  <div class="colmun-title">
			<h5>Standard Pass</h5>
		  </div>
		  <div class="price">
			<h2>$40</h2>
			<p>452 Tickets Available</p>
		  </div>
		  <div class="pricing-list">
			<ul>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Entrance</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Coffee Break</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Lunch on all days</span></li>
			  <li><i class="lni-close"></i><span class="text">Access to all areas</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Certificate</span></li>
			  <li><i class="lni-close"></i><span class="text">Workshop</span></li>
			</ul>
		  </div>
		  <a href="#" class="btn btn-common">Buy Ticket</a>
		</div>
	  </div>
	  <div class="col-lg-4 col-sm-6 col-xa-12 mb-3">
		<div class="price-block-wrapper wow fadeInRight" data-wow-delay="0.4s">
		  <div class="icon">
			<i class="lni-leaf"></i>
		  </div>
		  <div class="colmun-title">
			<h5>Premium Pass</h5>
		  </div>
		  <div class="price">
			<h2>$68</h2>
			<p>452 Tickets Available</p>
		  </div>
		  <div class="pricing-list">
			<ul>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Entrance</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Coffee Break</span></li>
			  <li><i class="lni-close"></i><span class="text">Lunch on all days</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Access to all areas</span></li>
			  <li><i class="lni-check-mark-circle"></i><span class="text">Certificate</span></li>
			  <li><i class="lni-close"></i><span class="text">Workshop</span></li>
			</ul>
		  </div>
		  <a href="#" class="btn btn-common">Buy Ticket</a>
		</div>
	  </div>
	</div>
  </div>
</section> 
-->
<!-- Ticket Pricing Area End -->

<!-- Event Slides Section Start -->
<section id="event-slides" class="section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">关于我们</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">这是一些关于我们的介绍，希望你能更加了解我们</p>
		</div>
	  </div>
	  <div class="col-md-6 col-lg-6 col-xs-12 wow fadeInRight" data-wow-delay="0.3s">
		<div class="video">
		  <img class="img-fluid" src="assets/FE_index/img/about/about.jpg" alt="">
		</div>
	  </div>
	  <div class="col-md-6 col-lg-6 col-xs-12 wow fadeInLeft" data-wow-delay="0.3s">
		<p class="intro-desc">工大会议管理系统是一个常规网站，后端方便管理员（教职工）进行会议活动和活动签到的编辑，以及后期会议活动对报名、参与活动人员的统计；前端方便同学们及时了解发布的会议活动、报名会议活动及签到等。</p>
		<h2 class="intro-title">我们承诺</h2>
		<ul class="list-specification">
		  <li><i class="lni-check-mark-circle"></i> 免费，无偿提供服务</li>
		  <li><i class="lni-check-mark-circle"></i> 安全，不将数据用于交易</li>
		  <li><i class="lni-check-mark-circle"></i> 方便，仅仅为了更加方便的校园生活</li>
		  <li><i class="lni-check-mark-circle"></i> 成长，技术有限，但我们会不断进步</li> 
		</ul>
	  </div>
	</div>
  </div>
</section>
<!-- Event Slides Section End -->

<!-- Blog Section Start -->
<!-- 
<section id="blog" class="section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">Our Latest News & Articles</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">Global Grand Event on Digital Design</p>
		</div>
	  </div>
	  <div class="col-lg-4 col-md-6 col-xs-12">
		<div class="blog-item">
		  <div class="blog-image">
			<a href="#">
			  <img class="img-fluid" src="assets/FE_index/img/blog/img-1.jpg" alt="">
			</a>
		  </div>
		  <div class="descr">
			<div class="tag">Design</div>
			<h3 class="title">
			  <a href="single-blog.html">
				The 9 Design Trends You Need to Know
			  </a>
			</h3>
			<div class="meta-tags">
			  <span class="date">Jan 20, 2018</span>
			  <span class="comments">| <a href="#"> by Cindy Jefferson</a></span>
			</div>
		  </div>
		</div>
	  </div>
	  <div class="col-lg-4 col-md-6 col-xs-12">
		<div class="blog-item">
		  <div class="blog-image">
			<a href="#">
			  <img class="img-fluid" src="assets/FE_index/img/blog/img-2.jpg" alt="">
			</a>
		  </div>
		  <div class="descr">
			<div class="tag">Design</div>
			<h3 class="title">
			  <a href="single-blog.html">
				The 9 Design Trends You Need to Know
			  </a>
			</h3>
			<div class="meta-tags">
			  <span class="date">Jan 20, 2018 </span>
			  <span class="comments">| <a href="#"> by Cindy Jefferson</a></span>
			</div>
		  </div>
		</div>
	  </div>
	  <div class="col-lg-4 col-md-6 col-xs-12">
		<div class="blog-item">
		  <div class="blog-image">
			<a href="#">
			  <img class="img-fluid" src="assets/FE_index/img/blog/img-3.jpg" alt="">
			</a>
		  </div>
		  <div class="descr">
			<div class="tag">Design</div>
			<h3 class="title">
			  <a href="single-blog.html">
				The 9 Design Trends You Need to Know
			  </a>
			</h3>
			<div class="meta-tags">
			  <span class="date">Jan 20, 2018</span> 
			  <span class="comments">| <a href="#"> by Cindy Jefferson</a></span>
			</div>
		  </div>
		</div>
	  </div>
	  <div class="col-12 text-center">
		<a href="#" class="btn btn-common">Read More News</a>
	  </div>
	</div>
  </div>
</section> 
-->
<!-- Blog Section End -->

<!-- Subscribe Area Start -->
<!-- 
<div id="subscribe" class="section-padding">
  <div class="container">
	<div class="row justify-content-md-center">
	  <div class="col-md-10 col-lg-7">
		<div class="subscribe-inner wow fadeInDown" data-wow-delay="0.3s">
		  <h2 class="subscribe-title">Sign Up For Our Newsletter</h2>
		  <form class="text-center form-inline">
			<input class="mb-20 form-control" name="email" placeholder="Enter Your Email Here">
			<button type="submit" class="btn btn-common sub-btn" data-style="zoom-in" data-spinner-size="30" name="submit" id="submit">
			<span class="ladda-label"><i class="lni-check-box"></i> Submit</span>
			</button>
		  </form>
		</div>
	  </div>
	</div>
  </div>
</div>
 -->
<!-- Subscribe Area End -->

<!-- Map Section Start -->
<!-- 
<section id="google-map-area">
  <div class="container-fluid">
	<div class="row">
	  <div class="col-12">
		<div id="conatiner-map"></div>
	  </div>
	</div>
  </div>
</section>
 -->
<!-- Map Section End -->

<!-- Contact Us Section -->
<section id="contact-map" class="section-padding">
  <div class="container">
	<div class="row justify-content-center">
	  <div class="col-12">
		<div class="section-title-header text-center">
		  <h1 class="section-title wow fadeInUp" data-wow-delay="0.2s">您的建议</h1>
		  <p class="wow fadeInDown" data-wow-delay="0.2s">我们收到您的反馈，将会第一时间联系您</p>
		</div>
	  </div>
	  <div class="col-lg-7 col-md-12 col-xs-12">
		<div class="container-form wow fadeInLeft" data-wow-delay="0.2s">
		  <div class="form-wrapper">
			<form role="form" action="sendFeedback.action" method="post" id="contactForm" name="contact-form" data-toggle="validator">
			  <div class="row">
				<div class="col-md-6 form-line">
				  <div class="form-group">
					<input type="text" class="form-control" id="name" name="userCall" placeholder="称呼" required data-error="请输入称呼">
					<div class="help-block with-errors"></div>
				  </div>
				</div>
				<div class="col-md-6 form-line">
				  <div class="form-group">
					<input type="email" class="form-control" id="email" name="fbContact" placeholder="邮箱" required data-error="请输入联系方式（邮箱）">
					<div class="help-block with-errors"></div>
				  </div> 
				</div>
				<div class="col-md-12 form-line">
				  <div class="form-group">
					<input type="tel" class="form-control" id="msg_subject" name="fbSubject" placeholder="反馈主题" required data-error="请输入反馈主题">
					<div class="help-block with-errors"></div>
				  </div>
				</div>
				<div class="col-md-12">
				  <div class="form-group">
					<textarea class="form-control" rows="4" id="message" name="fbContent" required data-error="请输入反馈内容"></textarea>
				  </div>
				  <div class="form-submit">
					<button type="submit" class="btn btn-common" id="form-submit"><i class="fa fa-paper-plane" aria-hidden="true"></i> 提交反馈</button>
					<div id="msgSubmit" class="h3 text-center hidden"></div>
				  </div>
				</div>
			  </div>
			</form>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- Contact Us Section End -->

<!-- Footer Section Start -->
<footer class="footer-area section-padding">
  <div class="container">
	<div class="row">
	  <div class="col-md-6 col-lg-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay="0.2s">
		<h3><img src="assets/FE_index/img/logo.png" alt=""></h3>
	  </div>

	</div>
  </div>
</footer>
<!-- Footer Section End -->

<div id="copyright">
  <div class="container">
	<div class="row">
	  <div class="col-md-12">
		<div class="site-info">
		  <p>Copyright &copy; 2020.工大会议活动--保留所有版权 </p>
		</div>      
	  </div>
	</div>
  </div>
</div>

<!-- Go to Top Link -->
<a href="#" class="back-to-top">
	<i class="lni-chevron-up"></i>
</a>

<div id="preloader">
  <div class="sk-circle">
	<div class="sk-circle1 sk-child"></div>
	<div class="sk-circle2 sk-child"></div>
	<div class="sk-circle3 sk-child"></div>
	<div class="sk-circle4 sk-child"></div>
	<div class="sk-circle5 sk-child"></div>
	<div class="sk-circle6 sk-child"></div>
	<div class="sk-circle7 sk-child"></div>
	<div class="sk-circle8 sk-child"></div>
	<div class="sk-circle9 sk-child"></div>
	<div class="sk-circle10 sk-child"></div>
	<div class="sk-circle11 sk-child"></div>
	<div class="sk-circle12 sk-child"></div>
  </div>
</div>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- <script src="assets/FE_index/js/jquery-min.js"></script> -->
<script src="assets/FE_index/js/popper.min.js"></script>
<script src="assets/FE_index/js/bootstrap.min.js"></script>
<script src="assets/FE_index/js/jquery.countdown.min.js"></script>
<script src="assets/FE_index/js/jquery.nav.js"></script>
<script src="assets/FE_index/js/jquery.easing.min.js"></script>
<script src="assets/FE_index/js/wow.js"></script>
<script src="assets/FE_index/js/jquery.slicknav.js"></script>
<script src="assets/FE_index/js/nivo-lightbox.js"></script>
<script src="assets/FE_index/js/main.js"></script>
<script src="assets/FE_index/js/form-validator.min.js"></script>
<!-- <script src="assets/FE_index/js/contact-form-script.min.js"></script> -->

<!-- <script src="assets/FE_index/js/map.js"></script> -->
<!-- <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyCsa2Mi2HqyEcEnM1urFSIGEpvualYjwwM"></script> -->
  
</body>
</html>
