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
			<a href="authorization.jsp">登录 / 注册</a>
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

	<!-- page -->
	<div class="page">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="page__title">
						<h2>用户授权</h2>
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
								<form action="../usercontrol?function=login" method="post" class="authorization__form">
									<div class="row">
										<div class="col-12">
											<label for="phone" class="form__label">手机号</label>
											<input id="phone" type="text" name="phone" value="${cookie.u.value}" class="form__input">
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
								<form action="../usercontrol?function=register" method="post" class="authorization__form" onsubmit="return AuthorizationRegister()">
									<div class="row">
										<div class="col-12">
											<label for="name" class="form__label">姓名</label>
											<input id="name" type="text" name="name" class="form__input">
										</div>

										<div class="col-12">
											<label for="phone1" class="form__label">手机号</label>
											<input id="phone1" type="text" name="phone1" onBlur="return AuthorizationRegister()" class="form__input">
											<span id="checkphone" style="color:#fa7268"></span>
										</div>
										
										<div class="col-12">
											<label for="Cli_id" class="form__label">身份证号</label>
											<input id="Cli_id" type="text" name="Cli_id" onBlur="return AuthorizationRegister()" class="form__input">
											<span id="checkcliid" style="color:#fa7268"></span>
										</div>

										<div class="col-12">
											<label for="password1" class="form__label">密码</label>
											<input id="password1" type="password" name="password1" onBlur="return AuthorizationRegister()" class="form__input">
											<span id="checkclipwd" style="color:#fa7268"></span>
										</div>
										
										<div class="col-12">
											<label for="password2" class="form__label">确认密码</label>
											<input id="password2" type="password" name="password2" onBlur="return AuthorizationRegister()" class="form__input">
											<span id="checkpwd2" style="color:#fa7268"></span>
										</div>

										<div class="col-12">
											<div class="form__checkbox">
												<input id="privacy" name="privacy" type="checkbox" onBlur="return AuthorizationRegister()"  checked="checked">
												<label for="privacy">我同意 <a href="privacy.jsp">隐私政策</a></label>
												<span id="checkprivacy" style="color:#fa7268"></span>
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
								<form action="../usercontrol?function=forget" method="post" class="authorization__form" onsubmit="return AuthorizationForget()">
									<div class="row">
										<div class="col-12">
											<label for="phone2" class="form__label">手机号</label>
											<input id="phone2" type="text" name="phone2" onBlur="return AuthorizationForget()" class="form__input">
											<span id="checkphone1" style="color:#fa7268"></span>
										</div>
										
										<div class="col-12">
											<label for="id" class="form__label">身份证号</label>
											<input id="id" type="text" name="id" onBlur="return AuthorizationForget()" class="form__input">
											<span id="checkcliid1" style="color:#fa7268"></span>
										</div>

										<div class="col-12">
											<label for="password3" class="form__label">密码</label>
											<input id="password3" type="password" name="password3" onBlur="return AuthorizationForget()" class="form__input">
											<span id="checkclipwd1" style="color:#fa7268"></span>
										</div>

										<div class="col-12">
											<label for="password4" class="form__label">确认密码</label>
											<input id="password4" type="password" name="password4" onBlur="return AuthorizationForget()" class="form__input">
											<span id="checkpwd4" style="color:#fa7268"></span>
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
	<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>