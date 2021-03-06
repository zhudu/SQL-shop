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
						<h2>商家登录</h2>
					</div>
				</div>

				<div class="col-12">
					<div class="authorization">
						<div class="nav page__nav" role="tablist">
							<a class="active" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">登录</a>

							<a class="" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">注册</a>
							
							<a class="" id="tab-3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">忘记密码</a>
						</div>
						
						<div class="tab-content">	<!-- 登录 -->
							<div id="tab1" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-1">
								<form action="../empcontrol?function=merlogin" method="post" class="authorization__form">
									<div class="row">
										<div class="col-12">
											<label for="phone" class="form__label">商家编号</label>
											<input id="phone" type="text" name="phone" value="${cookie.m.value}" class="form__input">
										</div>

										<div class="col-12">
											<label for="password" class="form__label">密码</label>
											<input id="password" type="password" name="password" class="form__input">
										</div>

										<div class="col-12">
											<div class="form__checkbox">
												<input id="remember" name="remember" type="checkbox" checked="checked">
												<label for="remember">记住账号</label>
											</div>
										</div>

										<div class="col-12">
											<button class="form__send" type="submit">提交</button>
										</div>
									</div>
								</form>
							</div>
							
							<!-- 注册 -->
							<div id="tab2" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-2">
								<form action="../empcontrol?function=merregister" method="post" class="authorization__form">
									<div class="row">
										<div class="col-12">
											<label for="name" class="form__label">店名</label>
											<input id="name" type="text" name="name" class="form__input">
										</div>

										<div class="col-12">
											<label for="phone1" class="form__label">联系电话</label>
											<input id="phone1" type="text" name="phone1" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="Mer_no" class="form__label">商家编号</label>
											<input id="Mer_no" type="text" name="Mer_no" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="Mer_legal" class="form__label">法人代表</label>
											<input id="Mer_legal" type="text" name="Mer_legal" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="Mer_address" class="form__label">地址</label>
											<input id="Mer_address" type="text" name="Mer_address" class="form__input">
										</div>

										<div class="col-12">
											<label for="password1" class="form__label">密码</label>
											<input id="password1" type="password" name="password1" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="password2" class="form__label">确认密码</label>
											<input id="password2" type="password" name="password2" class="form__input">
										</div>

										<div class="col-12">
											<div class="form__checkbox">
												<input id="privacy" name="privacy" type="checkbox" checked="checked">
												<label for="privacy">我同意 <a href="privacy.jsp">隐私政策</a></label>
											</div>
										</div>

										<div class="col-12">
											<button class="form__send" type="submit">提交</button>
										</div>
									</div>
								</form>
							</div>
							
							<!-- 忘记密码 -->
							<div id="tab3" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-3">
								<form action="../empcontrol?function=merforget" method="post" class="authorization__form">
									<div class="row">
										<div class="col-12">
											<label for="phone2" class="form__label">商家编号</label>
											<input id="phone2" type="text" name="phone2" class="form__input">
										</div>
										
										<div class="col-12">
											<label for="id" class="form__label">联系电话</label>
											<input id="id" type="text" name="id" class="form__input">
										</div>

										<div class="col-12">
											<label for="password3" class="form__label">密码</label>
											<input id="password3" type="password" name="password3" class="form__input">
										</div>

										<div class="col-12">
											<label for="password4" class="form__label">确认密码</label>
											<input id="password4" type="password" name="password4" class="form__input">
										</div>

										<div class="col-12">
											<button class="form__send" type="submit">更新密码</button>
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

	<!-- JS -->
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.bundle.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/jquery.mousewheel.min.js"></script>
	<script src="../js/jquery.mCustomScrollbar.min.js"></script>
	<script src="../js/main.js"></script>
	<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>