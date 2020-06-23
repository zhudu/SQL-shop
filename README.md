# SQL-shop

### 前言：

​		该项目为集美大学大二下数据库课设。由项目组成员共同完成，该项目采用springMVC+spring+hibernate实现，前端部分使用网络模板，其余部分由项目组共同设计，数据库部分采用Microsoft SQL server实现。

​		该项目中sql文件夹是存放部分sql需求及触发器，存储过程的代码。其余部分为eclipse的项目结构。其中WebContent中html存放基础模板信息，admin存放员工、商家、用户、商品的增加更新界面。emp、user、Mer分别为员工、用户、商家模块的实现。

### 界面整体框架：

```javascript
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

	<!-- header页眉 -->
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

	<!-- menu目录 -->
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
				<a href="product.jsp">Product style 1</a>
				<a href="product2.jsp">Product style 2</a>
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

	<!-- catmenu菜单 -->
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

	<!-- footer页脚 -->
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

	<!-- choose a city选择城市 -->
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
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.mousewheel.min.js"></script>
	<script src="js/jquery.mCustomScrollbar.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
```

### 更新日志

> ##### 6.6
>
> 1.员工表中新增登录密码
>
> 2.商品表增加商品类别
>
> 3.分拣表增加分拣状态
>
> 4.配送表增加配送状态
>
> ##### 6.20
>
> 修复购物车结算后数据无法读取、管理员无法更新数据、添加商品购物车界面不发生改变
>
> ##### 6.20-1
>
> 新增顾客未登录时对购物车及结算等功能的过滤操作。更正员工离职时任务的重分配情况。
>
> ##### 6.22
>
> 新增商家功能
>
> ##### 6.22-1
>
> 优化商品下架及用户删除地址的显示

### 实现功能展示：

##### 概览

电子购物商城主要分为三个模块：用户模块、员工模块、商家模块；其中员工又分为分拣员、配送员和管理员。

##### 用户模块一览

正常在用户未登录时，可以浏览商品信息。下图为该商城首页情况。

![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0Yxic5rz0uvtt7FATx5O80bkn3XibYkMC21sp8/0) 

 

其中在首页的导航栏中包含了较多的功能信息

![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0Yx9SAVLlYhmibfDNTPECaGqDnVQHFztS1j0w/0) 

目录：根据商品分类对商品进行检索

![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0YxicnQqgqJlDynXD2AqKDucw5C53qnB6upxc/0) 

其效果分别为：

![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0Yx9sq6nXiczXzkexPkV4ICrGYvJvM1Pxs3no/0)![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0Yx96icLNsVbicc8eAvTImk7U4gnU5Bic5iaibbZA/0) 

![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0YxibRxyiamekgBSb8ptjrEc6xVVZ3XXGpeSsI/0)![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0YxicZvy7VYoaa9zTLicK0bQ2LmXlS4cdprKU4/0) 

 

用户登录状态显示:初始显示为“未登录”，点击跳转登录界面，登出后亦显示“未登录”。且该界面包含注册账户与忘记的功能。（依次为从左到右）

![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0Yx9HpfcoO16o5qJLsWNBHDmSCqM2SlNcjIg/0)![img](https://p.qlogo.cn/qqmail_head/Q3auHgzwzM7qJfYMXHt5doEGNELY23yZus0XmDC0Yx9wzkhg0DYrhvUjymOXoO6Qccv9ypmsQQ4/0)![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeVFEOcexJH9mRdJviaicVPwhLPlez0cMUGrI/0) 

商品检索：（此处以检索手表为例）（检索方式：检索名称中包含检索关键字或者类别包含检索关键字的商品）

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWY2QvPgckxEwNM5TEjp4Z9nS4MnT5mkM4/0) 

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWcMGa0eI8SNvJibYTibCic3mVBNgVGicWCRWQ/0) 

用户成功登录后可以查看购物车中的信息，若尚未登录则会跳转到登录界面。

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWm1p5OgiaY1iaGun3aw3Tnu3SsicI8T65Kfc/0) 

可以购物车界面直接增减商品数量，或者去除商品，亦可对购物车中的商品进行结算。

结算过程中可以选择收货地址或者新增收货地址。

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeXX4gtm7licsvzW66gBib0Gia8qRfxPKWXNJs/0)![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWsxOe7QdoyQLHLlBESGF4FZfyZlJskAdU/0) 

支付完成后跳转至账户详情页，账户详情页可以查看个人信息、改密、查看订单，修改收货地址以及登出等功能。

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeXkDKwYnjYfhjJQRla6biawQicWTnibq6hp4c/0) 

可以看到刚刚结算的商品信息添加到我的订单中去了，并且购物车也清除了该商品。

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeUh5ibM1xkcqKaqmic2ibRtsR7SR6ZKbse79M/0) 

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeXNmGydj8zkF5icgRAwVAvjKDAib07Qgh9ug/0) 

添加收货地址：（并且可以直接点击后侧的x删除地址信息）

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWSpMy6N4W8oXMl0LDFmIX08uORYJJwFL4/0)![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWunvr4J4OibqjSEXmBJPT6mAwEzEOicEXpQ/0) 

 

##### 员工模块一览

员工登录界面与用户登录界面大致功能相似。后台会根据员工的部门号进行员工界面的分发。

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWoh064q0vBoYibEaJeMo60GfDk18SlZXxg/0) 

###### 分拣员界面：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeXQsTKGBPA7kcSCgTbmjBp6nv4OQZWUr9s/0) 

由于为了便于测试，此处登录的员工是刚刚下单的用户的订单所分配的员工：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeW3W9Lic8yodEA7klxHqv5bE80oNyqGmJaA/0) 

待员工分拣完商品后，点击右侧的提交：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeXQ1nxMaxON3g6xeXZReic9hUvfcKq8T9J0/0) 

并且用户界面会发生更改：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeX9pnKh4GdzjSQrpDYXAUMGAEACibw0vJ10/0) 

###### 配送员界面：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeXPbJlCfc9bKNYFURZeeRLQ4arJlJian4NY/0) 

初分配任务时会显示待配送字样，当员工接到货物开始配送时可以点击右侧图标。更新配送状态。

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeUXcdGIxwOoZDuxceexj8mwgxiao3eAXDv4/0) 

开始配送时的配送员界面：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeVkmnnYb0GViaFOjNDExaPIGndTiahRcEdic8/0) 

对应用户界面：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWhV4AqzMHGTQ61YjmU0ddibObmVMolMjCk/0) 

当配送员成功送达货物后，点击右侧图标。

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeXvu7ybt5RDqx93cwczUVLke8Xf3YtR2JQ/0) 

对应用户界面：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeVoseHBENhrGIeFC55PUfqcLz7uZW3z9WM/0) 

###### 管理员界面：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWOAJsdzhbtFP51rEDgYYZshtQwgBEvMjo/0) 

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeX0oQ8310MLAzFwXDmturo1ibzU3Ou1MpWQ/0) 

管理员可以对员工，用户，商家进行增删改操作。具体不一一展示。

##### 商家模块一览

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeVaHJUI34Gt1CxfkMOWsWRUFRE3b4gcXRc/0) 

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeWYNP8ibWAfEDicqTYAushOAIG6ibuHE2onH0/0) 

商品管理：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeUr1pCIFxuGatYoIiaFKWzDLXOaQBNkrOZ4/0) 

可以浏览添加的商品情况：

![img](https://p.qlogo.cn/qqmail_head/ajNVdqHZLLCqQWMopm4DOo60nVicfh4lzOYoNgtcvmeU8YytWOeYxMBOGSrzoVrSPT9sf6XcUCME/0) 

