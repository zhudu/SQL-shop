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
							<a class="header__logo">
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
						<h2>账户</h2>
						<a href="../empcontrol?function=M2G"><i class="lnr lnr-arrow-left"></i> 商品一览</a>
					</div>
				</div>

				<div class="col-12">
					<div class="account">
						<div class="nav page__nav page__nav--white" role="tablist">
							
							<a class="active" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="true">商家详情</a>
							
							<a class="" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">商品管理</a>

							<a href="../empcontrol?function=merlogout">登出</a>
						</div>

						<div class="tab-content">
							<div id="tab1" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-1">
								<div class="account__wrap">
									<table class="account__table">
										
											<%
												String Mer2Goods=(String)session.getAttribute("Mer2Goods");
												out.println(Mer2Goods);
											%>
											<!-- <thead>
											<tr>
												<th>商品条码</th>
												<th>品名</th>
												<th>售价</th>
												<th>仓库号</th>
												<th>类别</th>
												<th></th>
											</tr>
										</thead>

										<tbody><tr>
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
											</tr> 
										</tbody>-->
									</table>
								</div>
							</div>

							<div id="tab2" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-2">
								<div class="row">
									<div class="col-12 col-lg-6">
										<form action="../empcontrol?function=saveMer" method="post" class="account__form" onsubmit="return AccountUpdateDetail()">
											<div class="row">
												<div class="col-12">
													<h3 class="cart__form-title">账户详情</h3>
												</div>

												<%
													String merdetail=(String)session.getAttribute("merdetail");
													out.println(merdetail);
												%>
												
												 <!--<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="name" class="form__label">店名</label>
													<input id="name" type="text" name="name" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="Mer_legal" class="form__label">法人代表</label>
													<input id="Mer_legal" type="text" name="Mer_legal" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="Mer_phone" class="form__label">联系电话</label>
													<input id="Mer_phone" type="text" name="Mer_phone" class="form__input">
												</div> 

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="email" class="form__label">Email</label>
													<input id="email" type="text" name="email" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12">
													<label for="Mer_address" class="form__label">地址</label>
													<input id="Mer_address" type="text" name="Mer_address" class="form__input">
												</div>
												-->
												

												<div class="col-12">
													<button class="form__send" type="submit">保存</button>
												</div>
											</div>
										</form>
									</div>

									<div class="col-12 col-lg-6">
										<form action="../empcontrol?function=merpwdchange" method="post" class="account__form account__form--last" onsubmit="return AccountUpdatepwd()">
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