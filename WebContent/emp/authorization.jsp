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
							<a class="active" id="tab-2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="true">个人信息</a>
							
							<a class="" id="tab-1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">用户及商品管理</a>

							<form action="../empcontrol?function=logout" method="post"><button type="submit">登出</button></form>
						</div>

						<div class="tab-content">
							<div id="tab1" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-1">
								<div class="account__wrap">
									<div class="col-12">
										<div class="account">
											<div class="nav page__nav page__nav--white" role="tablist">
												<a class="active" id="tab-11" data-toggle="tab" href="#tab11" role="tab" aria-controls="tab11" aria-selected="true">用户管理</a>
												
												<a class="" id="tab-12" data-toggle="tab" href="#tab12" role="tab" aria-controls="tab12" aria-selected="false">商品管理</a>
												
												<a class="" id="tab-13" data-toggle="tab" href="#tab13" role="tab" aria-controls="tab13" aria-selected="false">员工管理</a>
												
												<a class="" id="tab-14" data-toggle="tab" href="#tab14" role="tab" aria-controls="tab14" aria-selected="false">商家管理</a>
											</div>
											<div class="tab-content">
												<div id="tab11" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-11">
													<table class="account__table">	
														<thead>
															<tr>
																<th>姓名</th>
																<th>用户编码/手机号</th>
																<th>邮箱</th>
																<th>性别</th>
																<th>生日</th>
																<th>密码</th>
																<th><a href="../admin/UserAdd.jsp"><button type="button"><i class="lnr lnr-users"/></button></a></th>
																
															</tr>
														</thead>
				
														<tbody>
															<tr>
																<td><a href="#">张三</a></td>
																<td>484651698</td>
																<td>484651698@qq.com</td>
																<td>男</td>
																<td>June 12, 2019</td>
																<td>xxxxxx</td>
																<th><a href="../admin/Userupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																<form action="../admcontrol?function=userdelete&id=1"><button type="submit"><i class="lnr lnr-cross"></i></button></form></th>
															</tr>
															<tr>
																<td><a href="#">李四</a></td>
																<td>124886215</td>
																<td>124886215@qq.com</td>
																<td>男</td>
																<td>Aug 22, 2019</td>
																<td>88888888</td>
																<th>
																	<a href="../admin/Userupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
															<tr>
																<td><a href="#">李四</a></td>
																<td>124886215</td>
																<td>124886215@qq.com</td>
																<td>男</td>
																<td>Aug 22, 2019</td>
																<td>88888888</td>
																<th>
																	<a href="../admin/Userupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
														</tbody>
													</table>
												</div>
												
												<div id="tab12" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-12">
													<table class="account__table">
														<thead>
															<tr>
																<th>商品编号</th>
																<th>商品名称</th>
																<th>销售价格</th>
																<th>仓库编号</th>
																<th>商家编号</th>
																<th>商品类别</th>
																<th><a href="../admin/Gooadd.jsp"><button type="button"><i class="lnr lnr-users"/></button></a></th>
																
															</tr>
														</thead>
				
														<tbody>
														<tr>
																<td><a href="#">7314</a></td>
																<td>厦门</td>
																<td>待配送</td>
																<td>June 12, 2019</td>
																<td>June 12, 2019</td>
																<td>77777777</td>
																<th>
																	<a href="../admin/Gooupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
															<tr>
																<td><a href="#">8451</a></td>
																<td>集美大学</td>
																<td>正在配送</td>
																<td>Aug 22, 2019</td>
																<td>Aug 22, 2019</td>
																<td>88888888</td>
																<th>
																	<a href="../admin/Gooupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
														</tbody>
													</table>
												</div>
												
												<div id="tab13" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-13">
													<table class="account__table">
														<thead>
															<tr>
																<th>工号</th>
																<th>姓名</th>
																<th>性别</th>
																<th>生日</th>
																<th>部门</th>
																<th>登录密码</th>
																<th><a href="../admin/Empadd.jsp"><button type="button"><i class="lnr lnr-users"/></button></a></th>
															</tr>
														</thead>
				
														<tbody>
														<tr>
																<td><a href="#">7314</a></td>
																<td>厦门</td>
																<td>待配送</td>
																<td>June 12, 2019</td>
																<td>June 12, 2019</td>
																<td>77777777</td>
																<th>
																	<a href="../admin/Empupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
															<tr>
																<td><a href="#">8451</a></td>
																<td>集美大学</td>
																<td>正在配送</td>
																<td>Aug 22, 2019</td>
																<td>Aug 22, 2019</td>
																<td>88888888</td>
																<th>
																	<a href="../admin/Empupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
														</tbody>
													</table>
												</div>
												
												<div id="tab14" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-14">
													<table class="account__table">
														<thead>
															<tr>
																<th>商家编号</th>
																<th>店名</th>
																<th>法人代表</th>
																<th>地址</th>
																<th>联系电话</th>
																<th>邮箱</th>
																<th><a href="../admin/Meradd.jsp"><button type="button"><i class="lnr lnr-users"/></button></a></th>
															</tr>
														</thead>
				
														<tbody>
														<tr>
																<td><a href="#">张三</a></td>
																<td>484651698</td>
																<td>484651698@qq.com</td>
																<td>男</td>
																<td>June 12, 2019</td>
																<td>xxxxxx</td>
																<th>
																	<a href="../admin/Merupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
															<tr>
																<td><a href="#">李四</a></td>
																<td>124886215</td>
																<td>124886215@qq.com</td>
																<td>男</td>
																<td>Aug 22, 2019</td>
																<td>88888888</td>
																<th>
																	<a href="../admin/Merupdate.jsp"><button type="button"><i class="lnr lnr-sync"></i></button></a>
																	<a href=""><button type="button"><i class="lnr lnr-cross"></i></button></a>
																</th>
															</tr>
														</tbody>
													</table>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>

							<div id="tab2" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-2">
								<div class="row">
									<div class="col-12 col-lg-6">
										<form action="#" class="account__form">
											<div class="row">
												<div class="col-12">
													<h3 class="cart__form-title">账户详情</h3>
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="firstname" class="form__label">姓</label>
													<input id="firstname" type="text" name="firstname" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="lastname" class="form__label">名</label>
													<input id="lastname" type="text" name="lastname" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="phone" class="form__label">手机号</label>
													<input id="phone" type="text" name="phone" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="email" class="form__label">Email</label>
													<input id="email" type="text" name="email" class="form__input">
												</div>

												<div class="col-12">
													<button class="form__send" type="button">保存</button>
												</div>
											</div>
										</form>
									</div>

									<div class="col-12 col-lg-6">
										<form action="#" class="account__form account__form--last">
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
													<input id="newpassword" type="password" name="newpassword" class="form__input">
												</div>

												<div class="col-12 col-md-6 col-lg-12 col-xl-6">
													<label for="confirmpassword" class="form__label">确认密码</label>
													<input id="confirmpassword" type="password" name="confirmpassword" class="form__input">
												</div>

												<div class="col-12">
													<button class="form__send" type="button">修改</button>
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