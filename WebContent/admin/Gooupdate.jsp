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
	<title>ZH-System</title>

</head>

<body class="body">

	<!-- header -->
	<header class="header header--dark">
		<div class="container">
			<div class="row">
				
				<div class="col-12">
					<div class="header__content">
						<div class="header__bar header__bar--left">
							
						</div>

						<div class="header__bar header__bar--center">
							<a href="index.jsp" class="header__logo">
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

	<!-- page -->
	<div class="page">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="page__title">
						<h2>更新产品信息</h2>
					</div>
				</div>

				<div class="col-12">
					<div class="authorization">
						<div class="nav page__nav" role="tablist">
							<a href="../Emp/admin.jsp">返回</a>
							
							<a class="active" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">更新信息</a>

						</div>

						<div class="tab-content">
							<div id="tab1" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-1">
								<form action="../admcontrol?function=gooupdate" method="post"  class="authorization__form">
									<div class="row">
										<div class="col-12">
											<label for="name" class="form__label">品名</label>
											<input id="name" type="text" name="name" class="form__input">
										</div>

										<div class="col-12">
											<label for="Goo_no" class="form__label">商品编号</label>
											<input id="Goo_no" type="text" name="Goo_no" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="Goo_price" class="form__label">售价</label>
											<input id="Goo_price" type="text" name="Goo_price" class="form__input">
										</div>

										<div class="col-12">
											<label for="Store" class="form__label">仓库号</label>
											<input id="Store" type="text" name="Store" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="Mer_no" class="form__label">商家编号</label>
											<input id="Mer_no" type="text" name="Mer_no" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="Goo_class" class="form__label">商品类别</label>
											<input id="Goo_class" type="text" name="Goo_class" class="form__input">
										</div>

										<div class="col-12">
											<button class="form__send" type="submit">更新</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end page -->

	<!-- footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="footer__content">
						<div class="footer__item">
							<span class="footer__title">公司</span>
							<ul class="footer__list">
								<li><a href="../emp/about.jsp">关于我们</a></li>
								<li><a href="../emp/news.jsp">新闻</a></li>
								<li><a href="../emp/catalog.jsp">目录</a></li>
								<li><a href="../emp/account.jsp">账户</a></li>
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
							<a href="../emp/privacy.jsp">使用条款</a>
							<a href="../emp/privacy.jsp">隐私政策</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end footer -->

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