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

	<!-- page -->
	<div class="page">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="page__title">
						<h2>Free delivery</h2>
					</div>
				</div>

				<div class="col-12">
					<div class="page__content">
						<div class="nav page__nav" role="tablist">
							<a class="active" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">in City</a>

							<a class="" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Across Country</a>

							<a class="" id="tab-3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">self-pickup</a>
						</div>

						<div class="tab-content">
							<div id="tab1" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-1">
								<div class="page__double">
									<div class="page__double-title">
										<h3>交货 in 厦门 and Minsk region</h3>
									</div>
									
									<div class="page__double-content">
										<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered <b>alteration</b> in some form, by injected humour, or randomised words which don't look even slightly believable.</p>

										<div class="page__table">
											<div class="page__table-title">Time' intervals:</div>
											<div class="page__table-item">
												<span>Morning:</span>
												<span>9:00 â 14:00</span>
											</div>
											<div class="page__table-item">
												<span>Day:</span>
												<span>14:00 â 18:00</span>
											</div>
											<div class="page__table-item">
												<span>Evening:</span>
												<span>17:00 â 20:00</span>
											</div>
											<div class="page__table-item">
												<span>After work:</span>
												<span>19:00 â 23:00</span>
											</div>
											<div class="page__table-item">
												<span>All day:</span>
												<span>9:00 â 22:00</span>
											</div>
											<div class="page__table-item">
												<span>Night delivery:</span>
												<span>22:00 â 08:00</span>
											</div>
										</div>

										<p>If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
									</div>
								</div>

								<div class="page__double">
									<div class="page__double-title">
										<h3>Available 付款 methods</h3>
									</div>
									
									<div class="page__double-content">
										<ul>
											<li>Card payment on the website;</li>
											<li>Cash on delivery;</li>
											<li>Card payment on delivery.</li>
										</ul>
									</div>
								</div>

								<div class="page__double">
									<div class="page__double-title">
										<h3>Terms of delivery</h3>
									</div>

									<div class="page__double-content">
										<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>

										<ul>
											<li>Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</li>
											<li>If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</li>
											<li>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.</li>
											<li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</li>
											<li>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</li>
										</ul>

										<p>It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
									</div>
								</div>
							</div>

							<div id="tab2" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-2">
								<div class="page__single">
									<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>

									<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
								</div>

								<div class="page__double">
									<div class="page__double-title">
										<h3>Available 付款 methods</h3>
									</div>
									
									<div class="page__double-content">
										<ul>
											<li>Card payment on the website;</li>
											<li>Cash on delivery;</li>
											<li>Card payment on delivery.</li>
										</ul>
									</div>
								</div>

								<div class="page__double">
									<div class="page__double-title">
										<h3>Terms of delivery</h3>
									</div>

									<div class="page__double-content">
										<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>

										<ul>
											<li>Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</li>
											<li>If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</li>
											<li>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.</li>
											<li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</li>
											<li>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</li>
										</ul>

										<p>It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
									</div>
								</div>
							</div>

							<div id="tab3" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-3">
								<div class="page__single">
									<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>

									<p>If you are going to use a passage of Lorem Ipsum.</p>
								</div>

								<div class="page__double">
									<div class="page__double-title">
										<h3>There is a boutiques nearby you:</h3>
									</div>

									<div class="page__double-content">
										<p><b>jimei university. post code 361021<br> Mon. - Sun.: 10.00 - 22.00<br> 8 800 333 00 44</b></p>

										<p><b>347 Pearl Drive Silver Spring, MD 20901<br> Mon. - Sun.: 10.00 - 22.00<br> 8 800 333 00 55</b></p>

										<p><b>299 Poor House Street Toledo, OH 43612<br> Mon. - Sun.: 10.00 - 22.00<br> 8 800 333 00 66</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end page -->

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