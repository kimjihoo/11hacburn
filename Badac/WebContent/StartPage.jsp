<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Badoc</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">

<!-- Plugin CSS -->
<link rel="stylesheet" type="text/css" href="css/animate.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="css/creative.css">
<script type="text/javascript">
    function gotoSignIn(){
		location.href = "http://210.118.74.159:8100/Badac/login_page";
	}
    function gotoSignUp(){
		location.href = "http://210.118.74.159:8100/Badac/signup_type";
	}
</script>
</head>
<body id="page-top">
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top">Badoc</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="page-scroll" href="#about">About</a></li>
				<li><a class="page-scroll" href="#services">Services</a></li>
				<li><a class="page-scroll" href="#portfolio">Gallery</a></li>
				<li><a class="page-scroll" href="#contact">Contact</a></li>
				<li><a class="page-scroll" onclick="gotoSignIn()">Sign In</a></li>
				<li><a class="page-scroll" onclick="gotoSignUp()">Sign Up</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<header>
	<div class="header-content">
		<div class="header-content-inner">
			<h1>Badoc</h1>
			<h2>Your Bicycle Doctor</h2>
			<hr>
			<p>
				Bicycle Doctor ��� ���� �ٴ��� �������� ���� �� Ʃ���� �� ���� �� �� �ֵ��� �����ݴϴ�. <br>
				�ٴ��� �� �������� ������ ��Ȱ�� �� �� �ֵ��� �����ݴϴ�. <br> �ٴ��� ������ �����ϰ� ������ ������ �� ��
				�ֵ��� �����ݴϴ�.
			</p>
			<a href="#about" class="btn btn-primary btn-xl page-scroll">Find
				Out More</a>
		</div>
	</div>
	</header>

	<section class="bg-primary" id="about">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">What We Do</h2>
				<hr class="light">
				<p class="text-faded">
				<h4>
					<strong>������ ���� ����</strong>
				</h4>
				<br>
				<p>
					�ٴ��� ������ ���� �� ���� ����� ������ ������ ��õ�Ͽ� ���� �� ���� ��ó�� �����ݴϴ�. <br> �ٴ���
					������ ����Ÿ� ���� ���� ���� ������ �����Ͽ� �ո����� ���� å���� ���ڽ��ϴ�.
				</p>
				<br>
				<h4>
					<strong>������ Ʃ�� ����</strong>
				</h4>
				<br>
				<p>
					�ٴ��� ������ ���� ����� ������ ��ü�� ã�� �����ص帮�ڽ��ϴ�. <br> �ٴ��� ������ Ʃ�� ���� ��û
					���񽺸� ���� �ո����� �������� Ʃ���� �� �� �ֵ��� ���ڽ��ϴ�.
				</p>
				<br>
				<h4>
					<strong>������ �߰� �ŷ�</strong>
				</h4>
				<br>
				<p>
					�ٴ��� �߰� ������ ó���� ���� �߰� ������ �����Ͽ� ��Ÿ� ���� ���� ó���� ���ڽ��ϴ�. <br> �ٴ��� �߰�
					��ǰ�� �Ÿ��Ͽ� ó���ϱ� ����� ������ ��ǰ�� ������ ó���� �� �ֵ��� ���ڽ��ϴ�.
				</p>
				</p>
				<a href="#services" class="page-scroll btn btn-default btn-xl">Get
					Started!</a>
			</div>
		</div>
	</div>
	</section>

	<section id="services">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading">How to Service</h2>
				<hr class="primary">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i> <img
						class="img-circle img-responsive img-center"
						style="width: 300px; height: 160px;" src="images/handshake.png"
						alt="">
					<h3>��-��ü ���� ����</h3>
					<p class="text-muted"></p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-paper-plane wow bounceIn text-primary"
						data-wow-delay=".1s"></i> <img
						class="img-circle img-responsive img-center"
						src="images/repair.png" style="width: 300px; height: 160px;"
						alt="">
					<h3>���� ���� ����</h3>
					<p class="text-muted"></p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-paper-plane wow bounceIn text-primary"
						data-wow-delay=".1s"></i> <img
						class="img-circle img-responsive img-center"
						src="images/tuning.jpg" style="width: 300px; height: 160px;"
						alt="">
					<h3>Ʃ�� ���� ����</h3>
					<p class="text-muted"></p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary"
						data-wow-delay=".2s"></i> <img
						class="img-circle img-responsive img-center" src="images/deal.png"
						style="width: 300px; height: 160px;" alt="">
					<h3>�߰� �ŷ� ����</h3>
					<p class="text-muted"></p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<section class="no-padding" id="portfolio">
	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="img/portfolio/bike1.jpg" class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Desert riding</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="img/portfolio/bike2.jpg" class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">In the forest</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="img/portfolio/bike3.jpg" class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Keep going on!</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="img/portfolio/bike4.jpg" class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">MTB riding</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="img/portfolio/bike5.jpg" class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">I did!</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="img/portfolio/bike6.jpg" class="img-responsive" alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">With friends</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	</section>

	<!--     <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Free Download at Start Bootstrap!</h2>
                <a href="#" class="btn btn-default btn-xl wow tada">Download Now!</a>
            </div>
        </div>
    </aside> -->

	<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">
					<strong>Badoc Corporation</strong>
				</h2>
				<hr class="primary">
				<p>
				<address>
					<br>����� ����� �߰赿 <br> 511-2 �߰� �� 1���� ���� 2�� <br>
				</address>
				<br>
				</p>
			</div>
			<div class="col-lg-4 col-lg-offset-2 text-center">
				<i class="fa fa-phone fa-3x wow bounceIn"></i> <abbr title="Phone">Phone
					: </abbr>010 0000 0000
			</div>
			<div class="col-lg-4 text-center">
				<i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
				<abbr title="Email">Email : </abbr> <a href="mailto:badoc@gmail.com">badoc@gmail.com</a>
			</div>
		</div>
	</div>
	</section>
	<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<p>Copyright &copy; Badoc Corporation 2016</p>
			</div>
		</div>
	</div>
	</section>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Plugin JavaScript -->
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/jquery.fittext.js"></script>
	<script src="js/wow.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="js/creative.js"></script>
</body>
</html>