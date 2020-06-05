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
							<a href="account.jsp" class="header__phone">
								8 800 333 00 44
							</a>

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
			<a href="account.jsp">Account</a>
			<a href="catalog.jsp">目录</a>
			<a href="news.jsp">News</a>
			<a href="about.jsp">About</a>
			<a class="menu__drop" href="#">Pages</a>
			<a href="authorization.jsp">Log In / Sign Up</a>
		</nav>

		<div class="menu__submenu">
			<button type="button"><i class="lnr lnr-arrow-left"></i> Back</button>

			<nav>
				<a href="product.jsp">Product style 1</a>
				<a href="product2.jsp">Product style 2</a>
				<a href="cart.jsp">Cart</a>
				<a href="checkout.jsp">Checkout</a>
				<a href="delivery.jsp">Delivery</a>
				<a href="getintouch.jsp">Get in touch</a>
				<a href="payment.jsp">Payment</a>
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
						<h2>Get in touch</h2>
					</div>
				</div>

				<div class="col-12">
					<form action="#" class="page__content page__content--form">
						<div class="row">
							<div class="col-12 col-lg-6">
								<label for="name" class="form__label">Name</label>
								<div class="form__wrap form__wrap--required">
									<input id="name" type="text" name="name" class="form__input" required>
								</div>
							</div>

							<div class="col-12 col-lg-6">
								<label for="phone" class="form__label">Phone</label>
								<div class="form__wrap form__wrap--required">
									<input id="phone" type="text" name="phone" class="form__input" required>
								</div>
							</div>

							<div class="col-12 col-lg-6">
								<label for="email" class="form__label">Email</label>
								<div class="form__wrap">
									<input id="email" type="text" name="email" class="form__input">
								</div>
							</div>

							<div class="col-12 col-lg-6">
								<label for="topic" class="form__label">Topic</label>
								<div class="form__wrap form__wrap--select">
									<select id="topic" name="city" class="form__select">
										<option value="1">厦门</option>
										<option value="2">New York</option>
										<option value="3">漳州</option>
									</select>
								</div>
							</div>

							<div class="col-12">
								<label for="comment" class="form__label">Comment</label>
								<div class="form__wrap">
									<textarea id="comment" name="comment" class="form__textarea"></textarea>
								</div>
							</div>

							<div class="col-12">
								<button class="form__send" type="button">Send</button>
							</div>
						</div>
					</form>
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
							<span class="footer__title">Company</span>
							<ul class="footer__list">
								<li><a href="about.jsp">About Us</a></li>
								<li><a href="news.jsp">News</a></li>
								<li><a href="catalog.jsp">Catalog</a></li>
								<li><a href="account.jsp">Account</a></li>
							</ul>
						</div>

						<div class="footer__item">
							<span class="footer__title">Services</span>
							<ul class="footer__list">
								<li><a href="getintouch.jsp">Get in touch</a></li>
								<li><a href="payment.jsp">Payment</a></li>
								<li><a href="delivery.jsp">Delivery</a></li>
								<li><a href="refund.jsp">Exchange and refund</a></li>
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
							<span class="footer__title">Contacts</span>
							
							<p class="footer__text">8258 Hickory Ave.<br> Oxford, MS 38655</p>

							<p class="footer__text">
								Tel.: <a href="#">8 800 333 00 44</a><br>
								Email: <a href="#">support@shum.com</a>
							</p>
						</div>
					</div>
				</div>

				<div class="col-12">
					<div class="footer__copyright">
						<small>Copyright Â© 2019</small>

						<div>
							<a href="privacy.jsp">Terms of Use</a>
							<a href="privacy.jsp">Privacy Policy</a>
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
			<a href="#">New York</a>
			<a href="#">Tokyo</a>
			<a href="#">Cape Town</a>
			<a href="#">Rio de Janeiro</a>
			<a href="#">Sydney</a>
			<a href="#">Lemesos</a>
			<a href="#">Dinajpur</a>
			<a href="#">Cartagena</a>
			<a href="#">Waitakere</a>
			<a href="#">Montpellier</a>
			<a href="#">Berlin</a>
			<a href="#">Valencia</a>
			<a href="#">Parma</a>
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