<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="../css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="../css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/magnific-popup.css">
	<link rel="stylesheet" href="../css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="../css/linearicons.css">
	<link rel="stylesheet" href="../css/paymentfont.min.css">
	<link rel="stylesheet" href="../css/main.css">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="../icon/temp.ico" sizes="32x32">
	<link rel="apple-touch-icon" href="../icon/temp.ico">
	<link rel="apple-touch-icon" sizes="72x72" href="../icon/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="../icon/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="../icon/apple-touch-icon-144x144.png">

	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>ZH-购物商城</title>

</head>

<body class="body">

	<!-- header -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="header__content">
						<div class="header__bar header__bar--left">
							<button class="header__catalog" type="button">
								<span class="line"></span>
								<span class="line"></span>
								<span class="line"></span>
								<span class="line"></span>
								<span class="title">目录</span>
							</button>
						</div>

						<div class="header__bar header__bar--center">
							<a href="index.jsp" class="header__logo">
								<img src="../img/temp1.png" alt="">
							</a>
						</div>

						<div class="header__bar header__bar--right">
							<%
								String haslogin=(String)session.getAttribute("hasLogin");
								String Cli_no=(String)session.getAttribute("Cli_no");
								if(haslogin==null || haslogin.equals("")){
									out.print("<a href=\"authorization.jsp\" class=\"header__phone\">未登录</a>");
								}else{
									out.print("<a href=\"account.jsp\" class=\"header__phone\">"+Cli_no+"</a>");
								}
							%>
							<!-- <a href="account.jsp" class="header__phone">
								8 800 333 00 44
							</a> -->

							<button class="header__search" type="button">
								<i class="lnr lnr-magnifier"></i>
							</button>

							<a href="cart.jsp" class="header__cart">
								<i class="lnr lnr-cart"></i>
								<span>2</span>
							</a>
							
							<button class="header__menu" type="button">
								<span></span>
								<span></span>
								<span></span>
							</button>
						</div>

						<form action="#" class="header__form">
							<input type="text" placeholder="点击Enter进行搜索">
							<button type="button">
								<span></span>
								<span></span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->

	<!-- menu -->
	<div class="menu">
		<div class="menu__actions">
			<a href="#city" class="menu__location">
				<i class="lnr lnr-location"></i>
				<span>厦门</span>
			</a>

			<button class="menu__search" type="button">
				<i class="lnr lnr-magnifier"></i>
			</button>

			<button class="menu__btn" type="button">
				<span></span>
				<span></span>
				<span></span>
			</button>
		</div>
		
		<nav class="menu__nav">
			<a href="account.jsp">账户</a>
			<a href="catalog.jsp">目录</a>
			<a href="news.jsp">新闻</a>
			<a href="about.jsp">关于</a>
			<a class="menu__drop" href="#">Pages</a>
			<a href="authorization.jsp">登 录 / 登 出</a>
		</nav>

		<div class="menu__submenu">
			<button type="button"><i class="lnr lnr-arrow-left"></i> Back</button>

			<nav>
				<a href="product.jsp">Product style 1</a>
				<a href="product2.jsp">Product style 2</a>
				<a href="cart.jsp">Cart</a>
				<a href="checkout.jsp">Checkout</a>
				<a href="delivery.jsp">交货</a>
				<a href="getintouch.jsp">保持联系</a>
				<a href="payment.jsp">付款</a>
				<a href="privacy.jsp">Privacy</a>
				<a href="refund.jsp">Refund</a>
				<a href="article.jsp">Article</a>
			</nav>
		</div>
	</div>
	<!-- end menu -->

	<!-- catmenu -->
	<div class="catmenu">
		<div class="catmenu__actions">
			<button class="catmenu__btn" type="button">
				<span></span>
				<span></span>
				<span></span>
			</button>
		</div>

		<nav class="catmenu__nav">
			<a href="catalog.jsp">厨具</a>
			<a href="catalog.jsp">家具</a>
			<a href="catalog.jsp">健康</a>
			<a href="catalog.jsp">配饰</a>
		</nav>
	</div>
	<!-- end catmenu -->

	<!-- product head -->
	<div class="product-head" data-bg="../img/product/bg.jpg">
		<div class="container">
			<div class="row">
				<!-- content -->
				<div class="col-12 col-md-6">
					<div class="product-head__content">
						<h1 class="product-head__title">Pan SHUM 303k</h1>
						<p class="product-head__text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, orrandomised words which don't look even slightly believable.</p>

						<div class="product-head__list">
							<div class="cart__item-quantity cart__item-quantity--dark">
								<button>
									<i class="lnr lnr-chevron-left"></i>
								</button>
								<input type="text" value="1">
								<button>
									<i class="lnr lnr-chevron-right"></i>
								</button>
							</div>

							<div class="product-head__colors product-head__colors--dark">
								<a href="#"><img src="../img/product/colors/color1.jpg" alt=""></a>
								<a class="active" href="#"><img src="../img/product/colors/color2.jpg" alt=""></a>
								<a href="#"><img src="../img/product/colors/color3.jpg" alt=""></a>
								<a href="#"><img src="../img/product/colors/color4.jpg" alt=""></a>
							</div>
						</div>

						<div class="product-head__list">
							<button class="product-head__btn" type="button">buy</button>

							<span class="product-head__price product-head__price--light">$144</span>
						</div>
					</div>
				</div>
				<!-- end content -->
			</div>
		</div>
	</div>
	<!-- end product head -->

	<!-- landing -->
	<section class="section land">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-12 col-md-6 order-md-2">
					<img src="../img/product/img4.jpg" alt="" class="land__img land__img--right">
				</div>

				<div class="col-12 col-md-6 order-md-1">
					<h2 class="land__title land__title--left">For a present</h2>
					<p class="land__text land__text--left">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
				</div>
			</div>

			<div class="row align-items-center">
				<div class="col-12 col-md-6">
					<img src="../img/product/img3.jpg" alt="" class="land__img">
				</div>

				<div class="col-12 col-md-6">
					<h2 class="land__title land__title--right">Patented materials</h2>
					<p class="land__text land__text--right">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="land__video">
						<img src="../img/product/video2.jpg" alt="">
						<a href="http://www.youtube.com/watch?v=0O2aH4XLbto"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="25px" height="25px"><path fill-rule="evenodd" stroke-width="2px" stroke-linecap="butt" stroke-linejoin="miter" fill="none" d="M23.003,12.000 L0.997,23.002 L0.997,0.998 L23.003,12.000 Z"/></svg></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end landing -->

	<!-- view also -->
	<section class="section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__title">
						<h2>View also</h2>
					</div>
				</div>

				<div class="col-12">
					<div class="product-grid row">
						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product3.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Power bank B600</h3>
									<span class="product__price">$55</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Iron s101</h3>
									<span class="product__price">$137</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product7.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Beauty mirror m142</h3>
									<span class="product__price">$37</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product8.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Cutting board SHUM500</h3>
									<span class="product__price">$100</span>
								</footer>
							</article>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end view also -->

	<!-- subscribe -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<form action="#" class="subscribe">
						<input class="subscribe__input" type="text" placeholder="Subscribe to our newsletter">
						<button class="subscribe__btn" type="button"><i class="lnr lnr-arrow-right"></i></button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end subscribe -->

	<!-- footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="footer__content">
						<div class="footer__item">
							<span class="footer__title">公司</span>
							<ul class="footer__list">
								<li><a href="about.jsp">关于我们</a></li>
								<li><a href="news.jsp">新闻</a></li>
								<li><a href="catalog.jsp">目录</a></li>
								<li><a href="account.jsp">账户</a></li>
							</ul>
						</div>

						<div class="footer__item">
							<span class="footer__title">服务</span>
							<ul class="footer__list">
								<li><a href="getintouch.jsp">保持联系</a></li>
								<li><a href="payment.jsp">付款</a></li>
								<li><a href="delivery.jsp">交货</a></li>
								<li><a href="refund.jsp">换货和退款</a></li>
							</ul>
						</div>

						<div class="footer__item">
							<span class="footer__title">Follow</span>
							<ul class="footer__list">
								<li><a href="#">Facebook</a></li>
								<li><a href="#">Twitter</a></li>
								<li><a href="#">Instagram</a></li>
								<li><a href="#">Google</a></li>
							</ul>
						</div>

						<div class="footer__item">
							<span class="footer__title">联络人</span>
							
							<p class="footer__text">jimei university.<br> post code 361021</p>

							<p class="footer__text">
								Tel.: <a href="#">88888888888</a><br>
								Email: <a href="#">201821121021@jmu.com</a>
							</p>
						</div>
					</div>
				</div>

				<div class="col-12">
					<div class="footer__copyright">
						<small>版权所有 © 2020</small>

						<div>
							<a href="privacy.jsp">使用条款</a>
							<a href="privacy.jsp">隐私政策</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end footer -->

	<!-- choose a city -->
	<div id="city" class="zoom-anim-dialog mfp-hide modal">
		<input type="text" class="modal__input" placeholder="搜索城市...">

		<div class="modal__cities">
			<a href="#">龙岩</a>
			<a class="active" href="#">厦门</a>
			<a href="#">漳州</a>
			<a href="#">泉州</a>
			<a href="#">莆田</a>
			<a href="#">宁德</a>
			<a href="#">南平</a>
			<a href="#">三明</a>
			<a href="#">龙岩</a>
		</div>
	</div>
	<!-- end choose a city -->

	<!-- JS -->
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.bundle.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/jquery.mousewheel.min.js"></script>
	<script src="../js/jquery.mCustomScrollbar.min.js"></script>
	<script src="../js/main.js"></script>
</body>
</html>