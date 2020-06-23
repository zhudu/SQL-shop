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
						</div>

						<div class="header__bar header__bar--center">
							<a href="account.jsp" class="header__logo">
								<img src="../img/temp1.png" alt="">
							</a>
						</div>

						<div class="header__bar header__bar--right">
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->

	<!-- catalog-head -->
	<div class="catalog-head" data-bg="../img/catalog/catalog-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
					<div class="catalog-head__content">
						<h2 class="catalog-head__title">商品一览</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end catalog-head -->

	<!-- content -->
	<div class="section">
		<div class="container">
			<div class="row">
				

				<!-- product-grid-->
				<div class="col-12">
					<div class="product-grid row">
						<%
							String M2Goods=(String)session.getAttribute("M2Goods");
							out.println(M2Goods);
						%>
						<!--<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product2.png" alt="">
								</div>
								<footer class="product__footer">
									<h3 class="product__title">Forged kettle 0.8</h3>
									<span class="product__price">$1 599</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product3.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Power bank B600</h3>
									<span class="product__price product__price--new">$55</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product4.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Microwave oven M707</h3>
									<span class="product__price">$430</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product4.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Toaster t298</h3>
									<span class="product__price">$200</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Iron s101</h3>
									<span class="product__price product__price--new">$137</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product6.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Meat grinder zx345</h3>
									<span class="product__price">$399</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product5.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Microwave oven M707</h3>
									<span class="product__price">$430</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product4.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Toaster t301</h3>
									<span class="product__price product__price--new">$250</span>
								</footer>
							</article>
						</div>

						<div class="col-6 col-md-4 col-xl-4">
							<article class="product">
								<a href="product.jsp" class="product__link"></a>
								<div class="product__img">
									<img src="../img/products/product3.png" alt="">
								</div>
								<a href="#" class="product__add"><svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px"><path fill-rule="evenodd" d="M15.000,8.000 L8.000,8.000 L8.000,15.000 L7.000,15.000 L7.000,8.000 L-0.000,8.000 L-0.000,7.000 L7.000,7.000 L7.000,-0.000 L8.000,-0.000 L8.000,7.000 L15.000,7.000 L15.000,8.000 Z"/></svg></a>
								<footer class="product__footer">
									<h3 class="product__title">Power bank B880</h3>
									<span class="product__price product__price--new">$65</span>
								</footer>
							</article>
						</div>-->
					</div>
				</div>
				<!-- end product-grid -->
			</div>
		</div>
	</div>
	<!-- end content -->

	

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