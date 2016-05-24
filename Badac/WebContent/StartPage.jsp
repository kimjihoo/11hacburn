<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Insert title here</title>
<script   src="https://code.jquery.com/jquery-2.2.3.js"   integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="   crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="/css/start.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
            
    <style>
    body {
        padding-top: 70px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    }
    </style>
    
    <script type="text/javascript">
    function gotoSignIn(){
		location.href = "http://210.118.74.159:8100/Badac/login_page";
	}
    function gotoSignUp(){
		location.href = "http://210.118.74.159:8100/Badac/signup_type";
	}
    </script>
</head>
<body>
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#">BADAC</a>
            </div>
            <div class="collapse navbar-collapse"
																					id="bs-example-navbar-collapse-1">
																					<ul class="nav navbar-nav navbar-right">
																						<li><a onclick="gotoSignIn()">Sign In</a></li>
																						<li><a onclick="gotoSignUp()">Sign Up</a></li>
																					</ul>
																				</div>
          

        </div>
        <!-- /.container -->
    </nav>
				
    <!-- Page Content -->
    
    
    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="images/alrexbicycle.png" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="images/altonsports.png" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="images/samchuly.png" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    
    
    <!-- /.container -->
    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">We've got what you need!</h2>
                    <hr class="light">
                    <p class="text-faded">Bicycle DOCTOR 라는 뜻의 바닥(BADOC)은 자전거의 수리 및 튜닝을 더 쉽게 할 수 있도록 도와줍니다. </p>
					<p class="text-faded">'바닥' 은 더 전문적인 자전거 생활을 할 수 있도록 도와줍니다.</p><p class="text-faded"> '바닥' 은 더 빠르고, 저렴하게
					자전거 수리를 할 수 있도록 도와줍니다.</p>
                   					 
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
<aside class="call-to-action">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
            <h2 class="section-heading">약속합니다!</h2>
                    <hr class="light">
                <p class="text-faded">'바닥' 은 자전거 수리 시 가장 가까운 자전거 매장을 추천하여 유사 시 빠른 대처를 도와줍니다.</p>
					<p class="text-faded">'바닥' 은 수리비용 역경매를 통해 가장 값싼 매장을 선택하여 합리적인 가격 책정을 돕겠습니다.</p>
                
            </div>
        </div>
    </div>
</aside>

<footer >
    <div class="container-fruid bg-primary">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1 text-center ">
                <h4><strong>Contact</strong>
                </h4>
                <p>서울시 노원구 중계동 <br> 511-2 중계 제 1공단 별관 2층 </p>
                <ul class="list-unstyled">
                    <li><i class="fa fa-phone fa-fw"></i> 010-3035-9808</li>
                    <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:name@example.com">escape0619@gmail.com</a>
                    </li>
                </ul>
                <br>
                <ul class="list-inline">
                    <li>
                        <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                    </li>
                </ul>
                <hr class="small">
                <p class="text-muted">Copyright &copy; Badac 2016</p>
            </div>
        </div>
    </div>
</footer>


    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>
</body>
</html>