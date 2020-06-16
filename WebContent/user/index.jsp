<%@page import="javafx.scene.control.Alert"%>
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

							<a href="../usercontrol?function=cart" class="header__cart">
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

						<form action="../usercontrol?function=search" method="post" class="header__form">
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
			<a href="../usercontrol?function=class&class=文具">文具</a>
			<a href="../usercontrol?function=class&class=家具">家具</a>
			<a href="../usercontrol?function=class&class=手表">手表</a>
			<a href="../usercontrol?function=class&class=服饰">服饰</a>
		</nav>
	</div>
	<!-- end catmenu -->

	<!-- home -->
	<section class="home">
		<div class="home__slider owl-carousel">
			<div class="home__slide" data-bg="../img/home/watch.jpg">
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-10 col-lg-6 col-xl-5">
							<div class="home__content">
								<h1 class="home__title">手表</h1>
								<p class="home__text">是用“石英晶体”作为振荡器，通过电子分频去控制马达运转，带动指针，走时精度很高。电子行针表。即是将电子机芯与石英机芯组合而成的，既有电子显示又有表针行走指示的手表。</p>
								<a href="product.jsp" class="home__link">了解更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="home__slide" data-bg="../img/home/desk.jpg">
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-10 col-lg-6 col-xl-5">
							<div class="home__content">
								<h1 class="home__title">家具</h1>
								<p class="home__text">家具的类型、数量、功能、形式、风格和制作水平以及当时的占有情况，还反映了一个国家与地区在某一历史时期的社会生活方式，社会物质文明的水平以及历史文化特征。家具是某一国家或地域在某一历史时期社会生产力发展水平的标志，是某种生活方式的缩影，是某种文化形态的显现，因而家具凝聚了丰富而深刻的社会性。</p>
								<a href="product.jsp" class="home__link">了解更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="home__slide" data-bg="../img/home/pen.jpg">
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-10 col-lg-6 col-xl-5">
							<div class="home__content">
								<h1 class="home__title">文房四宝</h1>
								<p class="home__text">梅尧臣《再和潘歙州纸砚》诗：“文房四宝出二郡，迩来赏玩君与予。”</p>
								<a href="product.jsp" class="home__link">了解更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="home__counter"></div>

					<div class="home__nav">
						<button class="home__btn home__btn--prev" type="button">
							<i class="lnr lnr-arrow-left"></i>
						</button>
						<button class="home__btn home__btn--next" type="button">
							<i class="lnr lnr-arrow-right"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end home -->

	<!-- product grid -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product-grid row">
						<div class="col-12 col-md-8 col-xl-6">
							<article class="product product--big">
								<a href="../usercontrol?function=product&no=CZ888898" class="product__link"></a>
								<img class="product__cover" src="../img/picture/016.jpg" alt="">
								<a href="../usercontrol?function=productadd&no=CZ888898" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">华为手环4</h3>
									<span class="product__price">￥159.00</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="../usercontrol?function=product&no=CZ845788" class="product__link"></a>
								<div class="product__img">
									<!-- <img src="../img/products/product2.png" alt=""> -->
									<img alt="" src="../img/picture/001.jpg">
								</div>
								<a href="../usercontrol?function=productadd&no=CZ845788" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">usb安卓数据线快充</h3>
									<span class="product__price">￥7.90</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="../usercontrol?function=product&no=AH000004" class="product__link"></a>
								<div class="product__img">
									<!-- <img src="../img/products/product3.png" alt=""> -->
									<img alt="" src="../img/picture/014.jpg">
								</div>
								<a href="../usercontrol?function=productadd&no=AH000004" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">护眼台灯</h3>
									<span class="product__price product__price--new">￥69.00</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="../usercontrol?function=product&no=AH000001" class="product__link"></a>
								<div class="product__img">
									<!-- <img src="../img/products/product5.png" alt=""> -->
									<img alt="" src="../img/picture/025.jpg">
								</div>
								<a href="../usercontrol?function=productadd&no=AH000001" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">卧室储物小柜子</h3>
									<span class="product__price">￥44.00</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="../usercontrol?function=product&no=AH000003" class="product__link"></a>
								<div class="product__img">
									<img src="../img/picture/018.jpg" alt="">
								</div>
								<a href="../usercontrol?function=productadd&no=AH000003" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">简约沙发</h3>
									<span class="product__price">￥2350.00</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="../usercontrol?function=product&no=ZX156472" class="product__link"></a>
								<div class="product__img">
									<img src="../img//picture/017.jpg" alt="">
								</div>
								<a href="../usercontrol?function=productadd&no=ZX156472" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">活着</h3>
									<span class="product__price product__price--new">￥24.80</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-3">
							<article class="product">
								<a href="../usercontrol?function=product&no=ZX156467" class="product__link"></a>
								<div class="product__img">
									<img src="../img//picture/005.jpg" alt="">
								</div>
								<a href="../usercontrol?function=productadd&no=ZX156467" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">朝花夕拾</h3>
									<span class="product__price">￥38.50</span>
								</footer>
							</article>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end product grid -->

	

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