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

						<form action="../usercontrol?function=search" class="header__form">
							<input id="searchname" type="text" name="searchname" placeholder="点击Enter进行搜索">
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
				<a href="../usercontrol?function=cart">Cart</a>
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
						<h2>账户</h2>
						<a href="index.jsp"><i class="lnr lnr-arrow-left"></i> 返回主页</a>
					</div>
				</div>

				<div class="col-12">
					<div class="account">
						<div class="nav page__nav page__nav--white" role="tablist">
							
							<a class="active" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="true">账户详情</a>
							
							<a class="" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">我的订单</a>
							
							<a class="" id="tab-3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">收货地址</a>

							<a href="../usercontrol?function=logout">登出</a>
						</div>

						<div class="tab-content">
							<div id="tab1" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-1">
								<div class="account__wrap">
									<table class="account__table">
										<thead>
											<tr>
												<th>订单号</th>
												<th>品名</th>
												<th>下单时间</th>
												<th>数量</th>
												<th>总价</th>
												<th>状态</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
											<%
												String FormDetail=(String)session.getAttribute("FormDetail");
												out.println(FormDetail);
											%>
											<!-- <tr>
												<td><a href="#">8451</a></td>
												<td>Power bank B600</td>
												<td>Aug 22, 2019</td>
												<td>2</td>
												<td>$110</td>
												<td>Not confirmed</td>
												<td><button type="button"><i class="lnr lnr-cross"></i></button></td>
											</tr>
											<tr>
												<td><a href="#">8126</a></td>
												<td>Toaster t298</td>
												<td>July 22, 2019</td>
												<td>1</td>
												<td>$200</td>
												<td>Delivered</td>
												<td><button type="button"><i class="lnr lnr-sync"></i></button></td>
											</tr>
											<tr>
												<td><a href="#">7314</a></td>
												<td>Meat grinder zx345</td>
												<td>June 12, 2019</td>
												<td>1</td>
												<td>$399</td>
												<td>Canceled</td>
												<td><button type="button"><i class="lnr lnr-sync"></i></button></td>
											</tr> -->
										</tbody>
									</table>
								</div>
							</div>

							<div id="tab2" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-2">
								<div class="row">
									<div class="col-12 col-lg-6">
										<form action="../usercontrol?function=saveClient" method="post" class="account__form" onsubmit="return AccountUpdateDetail()">
											<div class="row">
												<div class="col-12">
													<h3 class="cart__form-title">账户详情</h3>
												</div>

												<%
													String clientdetail=(String)session.getAttribute("clientdetail");
													out.println(clientdetail);
												%>
												
												<!-- <div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="name" class="form__label">姓名</label>
													<input id="name" type="text" name="name" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="phone" class="form__label">手机号</label>
													<input id="phone" type="text" name="phone" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="email" class="form__label">Email</label>
													<input id="email" type="text" name="email" class="form__input">
												</div> -->

												<div class="col-12">
													<button class="form__send" type="submit">保存</button>
												</div>
											</div>
										</form>
									</div>

									<div class="col-12 col-lg-6">
										<form action="../usercontrol?function=pwdchange" method="post" class="account__form account__form--last" onsubmit="return AccountUpdatepwd()">
											<div class="row">
												<div class="col-12">
													<h3 class="cart__form-title">修改密码</h3>
												</div>
									
												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="oldpassword" class="form__label">旧密码</label>
													<input id="oldpassword" type="password" name="oldpassword" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="newpassword" class="form__label">新密码</label>
													<input id="newpassword" type="password" name="newpassword" onBlur="return AccountUpdatepwd()" class="form__input">
													<span id="checkpwd" style="color:#fa7268"></span>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="confirmpassword" class="form__label">确认密码</label>
													<input id="confirmpassword" type="password" name="confirmpassword" onBlur="return AccountUpdatepwd()" class="form__input">
													<span id="checkpwd2" style="color:#fa7268"></span>
												</div>

												<div class="col-12">
													<button class="form__send" type="submit">修改</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							
							<div id="tab3" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-3">
								<div class="account__wrap">
									<table class="account__table">
										<thead>
											<tr>
												<th>收件人</th>
												<th>地址</th>
												<th>手机号</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
											<%
												String detail=(String)session.getAttribute("AddressDetail");
												if(detail==null){
													out.println("快去新增收货地址吧！<br>");
												}else{
													out.println(detail);
													
												}
											%>
											<!-- <tr>
												<td><a href="#">8451</a></td>
												<td>Power bank B600</td>
												<td>Aug 22, 2019</td>
												<td><button type="button"><i class="lnr lnr-cross"></i></button></td>
											</tr> -->
										</tbody>
									</table>
									<div class="col-12">
										<a href="address.jsp" class="form__send">新增收货地址</a>
									</div>
								</div>
							</div>
						</div>
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