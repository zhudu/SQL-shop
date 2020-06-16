<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/paymentfont.min.css">
	<link rel="stylesheet" href="css/main.css">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/temp.ico" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/temp.ico">
	<link rel="apple-touch-icon" sizes="72x72" href="icon/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="icon/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="icon/apple-touch-icon-144x144.png">

	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>ZH-购物商城</title>

</head>

<body class="body">

	<!-- header -->
	<header class="header header--dark">
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
								<img src="img/temp1.png" alt="">
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
								<%
								String cartnum=String.valueOf(session.getAttribute("cartnum"));
								if(cartnum.equals("null")==false){
									if(cartnum.equals("0")==false){
										out.print("<span>"+cartnum+"</span>");
									}
								}
								%>
							</a>
							
							<button class="header__menu" type="button">
								<span></span>
								<span></span>
								<span></span>
							</button>
						</div>

						<form action="usercontrol?function=search" method="post" class="header__form">
							<input id="search" name="search" type="text" placeholder="点击Enter进行搜索">
							<button type="submit">
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
			<a href="usercontrol?function=class&class=文具">文具</a>
			<a href="usercontrol?function=class&class=家具">家具</a>
			<a href="usercontrol?function=class&class=手表">手表</a>
			<a href="usercontrol?function=class&class=服饰">服饰</a>
		</nav>
	</div>
	<!-- end catmenu -->

	<!-- cart -->
	<div class="cart">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="cart__title">
						<h2>你的订单</h2>
						<a href="catalog.jsp"><i class="lnr lnr-arrow-left"></i> 商品</a>
					</div>
				</div>

				<div class="col-12">
					<div class="cart__wrap">
						<div class="cart__content">
							<div class="cart__item">
								<div class="cart__item-img">
									<img src="img/products/product6.png" alt="">
								</div>

								<div class="cart__item-wrap">
									<div class="cart__item-content">
										<h3>Meat grinder zx345</h3>
										<ul>
											<li>It uses a dictionary</li>
										</ul>
									</div>

									<div class="cart__item-quantity">
										<button>
											<i class="lnr lnr-chevron-left"></i>
										</button>
										<input type="text" value="1">
										<button>
										<a href="control?function=">
											<i class="lnr lnr-chevron-right"></i></a>
										</button>
									</div>

									<div class="cart__item-price">$399</div>

									<button class="cart__item-delete" type="button">
										<i class="lnr lnr-cross"></i>
									</button>
								</div>
							</div>

							<div class="cart__item">
								<div class="cart__item-img">
									<img src="img/products/product5.png" alt="">
								</div>

								<div class="cart__item-wrap">
									<div class="cart__item-content">
										<h3>Microwave oven M707</h3>
										<ul>
											<li>Letraset sheets</li>
											<li>Lorem Ipsum comes</li>
											<li>The first line</li>
											<li>It uses a dictionary</li>
											<li>Various versions</li>
										</ul>
									</div>

									<div class="cart__item-quantity">
										<button>
											<i class="lnr lnr-chevron-left"></i>
										</button>
										<input type="text" value="1">
										<button>
											<i class="lnr lnr-chevron-right"></i>
										</button>
									</div>

									<div class="cart__item-price">$430</div>

									<button class="cart__item-delete" type="button">
										<i class="lnr lnr-cross"></i>
									</button>
								</div>
							</div>
						</div>

						<div class="cart__total">
							<div class="cart__total-wrap">
								<div class="cart__total-value">共计: <b>$829</b></div>
								<a href="checkout.jsp" class="cart__total-btn">结算</a>
							</div>
						</div><!--  -->
					</div>
				</div>

				<div class="col-12 col-md-6 col-lg-4">
					<div class="cart__features">
						<span>
							<i class="lnr lnr-phone"></i>
						</span>
						<h4>支持</h4>
						<p>如果对使用该系统有疑问，可以致电8 888 888 888或离您最近的服务中心。我们将迅速找到正确的解决方案。</p>
					</div>
				</div>

				<div class="col-12 col-md-6 col-lg-4">
					<div class="cart__features">
						<span>
							<i class="lnr lnr-sync"></i>
						</span>
						<h4>换货和退货</h4>
						<p>如果对使用该系统有疑问，可以致电8 888 888 888或离您最近的服务中心。我们将迅速找到正确的解决方案。</p>
					</div>
				</div>

				<div class="col-12 col-md-6 col-lg-4">
					<div class="cart__features">
						<span>
							<i class="lnr lnr-location"></i>
						</span>
						<h4>定位</h4>
						<p>如果对使用该系统有疑问，可以致电8 888 888 888或离您最近的服务中心。我们将迅速找到正确的解决方案。</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end cart -->

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
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.mousewheel.min.js"></script>
	<script src="js/jquery.mCustomScrollbar.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>