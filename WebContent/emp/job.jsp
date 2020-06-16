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
		
	</div>
	<!-- end menu -->

	

	<!-- page -->
	<div class="page">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="page__title">
						<h2>欢迎使用ZH-System</h2>
					</div>
				</div>

				<div class="col-12">
					<div class="account">
						<div class="nav page__nav page__nav--white" role="tablist">
							<a class="" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">工作</a>

							<a class="active" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="true">个人信息</a>
							
							<!-- <form action="../empcontrol?function=logout" method="post"><button type="submit">登出</button></form> -->
							<a href="../empcontrol?function=logout">登出</a>
						</div>

						<div class="tab-content">
							<div id="tab1" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-1">
								<div class="account__wrap">
									<table class="account__table">
										<%
										String empjob=(String)session.getAttribute("empjob");
											out.print(empjob);
										%>
										<!-- <thead>
											<tr>
												<th>分拣号</th>
												<th>品名</th>
												<th>截止时间/完成时间</th>
												<th>数量</th>
												<th>状态</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td><a href="#">8451</a></td>
												<td>Power bank B600</td>
												<td>Aug 22, 2019</td>
												<td>2</td>
												<td>待分拣</td>
												<td><form action="../empcontrol?function=sort?Sor_no=" method="post"><button type="submit"><i class="lnr lnr-arrow-up"></i></button></form></td>
											</tr>
											<tr>
												<td><a href="#">7314</a></td>
												<td>Meat grinder zx345</td>
												<td>June 12, 2019</td>
												<td>1</td>
												<td>任务完成</td>
												<td><button type="button"><i class="lnr lnr-sync"></i></button></td>
											</tr>
										</tbody> -->
										
										<!--  <thead>
											<tr>
												<th>配送号</th>
												<th>收货地址</th>
												<th>收件人号码</th>
												<th>配送时间</th>
												<th>送达时间</th>
												<th>状态</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
										<tr>
												<td><a href="#">7314</a></td>
												<td>厦门</td>
												<td>777777</td>
												<td>June 12, 2019</td>
												<td>June 12, 2019</td>
												<td>待配送</td>
												<td><form action="../empcontrol?function=delivery?Del_no="><button type="submit"><i class="lnr lnr-select"></i></button></form></td>
											</tr>
											<tr>
												<td><a href="#">8451</a></td>
												<td>集美大学</td>
												<td>正在配送</td>
												<td>Aug 22, 2019</td>
												<td>Aug 22, 2019</td>
												<td>88888888</td>
												<td><form action="../empcontrol?function=delivery1?Del_no="><button type="button"><i class="lnr lnr-earth"></i></button></form></td>
											</tr>
											<tr>
												<td><a href="#">8451</a></td>
												<td>集美大学</td>
												<td>待确认</td>
												<td>Aug 22, 2019</td>
												<td>Aug 22, 2019</td>
												<td>88888888</td>
												<td><form action="../empcontrol?function=delivery2?Del_no="><button type="button"><i class="lnr lnr-sync"></i></button></form></td>
											</tr>
											<tr>
												<td><a href="#">7314</a></td>
												<td>漳州</td>
												<td>已签收</td>
												<td>June 12, 2019</td>
												<td>June 12, 2019</td>
												<td>9999999</td>
												<td><button type="button"><i class="lnr lnr-sync"></i></button></td>
											</tr>
										</tbody>-->
									</table>
								</div>
							</div>

							<div id="tab2" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-2">
								<div class="row">
									<div class="col-12 col-lg-6">
										<form action="../empcontrol?function=saveemp" method="post" class="account__form" onsubmit="return EmpUpdateDetail()">
											<div class="row">
												<div class="col-12">
													<h3 class="cart__form-title">账户详情</h3>
												</div>

												<%
													String empdetail=(String)session.getAttribute("empdetail");
													out.println(empdetail);
												%>

												<!-- <div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="name" class="form__label">姓名</label>
													<input id="name" type="text" name="name" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="phone" class="form__label">工号</label>
													<input id="phone" type="text" name="phone" onBlur="return EmpUpdateDetail()" class="form__input">
													<span id="checkphone" style="color:#fa7268"></span>
												</div> -->

												<div class="col-12">
													<button class="form__send" type="submit">保存</button>
												</div>
											</div>
										</form>
									</div>

									<div class="col-12 col-lg-6">
										<form action="../empcontrol?function=pwdchange" method="post" class="account__form account__form--last" onsubmit="return EmpUpdatepwd()">
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
													<input id="newpassword" type="password" name="newpassword" onBlur="return EmpUpdatepwd()" class="form__input">
													<span id="checkpwd" style="color:#fa7268"></span>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="confirmpassword" class="form__label">确认密码</label>
													<input id="confirmpassword" type="password" name="confirmpassword" onBlur="return EmpUpdatepwd()" class="form__input">
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
						<p>For questions regarding the use of BORK equipment, you can call 8 800 500 88 99 or your nearest service center. Our experts will quickly find the right solution.</p>
					</div>
				</div>

				<div class="col-12 col-md-6 col-lg-4">
					<div class="cart__features">
						<span>
							<i class="lnr lnr-sync"></i>
						</span>
						<h4>Exchange and return</h4>
						<p>For questions regarding the use of BORK equipment, you can call 8 800 500 88 99 or your nearest service center. Our experts will quickly find the right solution.</p>
					</div>
				</div>

				<div class="col-12 col-md-6 col-lg-4">
					<div class="cart__features">
						<span>
							<i class="lnr lnr-location"></i>
						</span>
						<h4>Tracker</h4>
						<p>For questions regarding the use of BORK equipment, you can call 8 800 500 88 99 or your nearest service center. Our experts will quickly find the right solution.</p>
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