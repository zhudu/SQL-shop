$(document).ready(function () {
	"use strict"; // start of use strict

	/*==============================
	Header
	==============================*/
	$(window).on('scroll', function () {
		if ( $(window).scrollTop() > 0 ) {
			$('.header').addClass('header--active');
			$('.menu__actions').addClass('menu__actions--active');
			$('.catmenu__actions').addClass('catmenu__actions--active');
			$('.header__form').addClass('header__form--active');
			$('.menu__submenu button').addClass('active');
		} else {
			$('.header').removeClass('header--active');
			$('.menu__actions').removeClass('menu__actions--active');
			$('.catmenu__actions').removeClass('catmenu__actions--active');
			$('.header__form').removeClass('header__form--active');
			$('.menu__submenu button').removeClass('active');
		}
	});
	$(window).trigger('scroll');

	$('.header__menu, .menu__btn').on('click', function() {
		if ( $('.catmenu').hasClass('catmenu--active') ) {
			$('.header__catalog').removeClass('header__catalog--active');
			$('.catmenu').removeClass('catmenu--active');
			$('.catmenu__btn').removeClass('catmenu__btn--active');

			$('.header__menu').toggleClass('header__menu--active');
			$('.menu').toggleClass('menu--active');
			$('.menu__btn').toggleClass('menu__btn--active');
		} else {
			$('.header__menu').toggleClass('header__menu--active');
			$('.menu').toggleClass('menu--active');
			$('.menu__btn').toggleClass('menu__btn--active');
			$('.body').toggleClass('body--active');
		}
	});

	$('.header__catalog, .catmenu__btn').on('click', function() {
		if ( $('.menu').hasClass('menu--active') ) {
			$('.header__menu').removeClass('header__menu--active');
			$('.menu').removeClass('menu--active');
			$('.menu__btn').removeClass('menu__btn--active');

			$('.header__catalog').toggleClass('header__catalog--active');
			$('.catmenu').toggleClass('catmenu--active');
			$('.catmenu__btn').toggleClass('catmenu__btn--active');
		} else {
			$('.header__catalog').toggleClass('header__catalog--active');
			$('.catmenu').toggleClass('catmenu--active');
			$('.catmenu__btn').toggleClass('catmenu__btn--active');
			$('.body').toggleClass('body--active');
		}
	});

	$('.header__search, .menu__search, .header__form button').on('click', function() {
		$('.header__content').toggleClass('header__content--active');
	});

	$('.menu__drop').on('click', function(e) {
		e.preventDefault();
		$('.menu__submenu').addClass('active');
	});

	$('.menu__submenu button').on('click', function() {
		$('.menu__submenu').removeClass('active');
	});

	/*==============================
	Home
	==============================*/
	$('.home__slider').on('initialized.owl.carousel changed.owl.carousel', function(e) {
		if (!e.namespace) return;
		var carousel = e.relatedTarget;
		$('.home__counter').html((carousel.relative(carousel.current()) + 1) + ' ' + '/' + ' ' + carousel.items().length);
	}).owlCarousel({
		mouseDrag: false,
		touchDrag: true,
		items: 1,
		dots: false,
		loop: true,
		autoplay: false,
		smartSpeed: 600,
		margin: 0,
		onInitialize: startBg,
	});

	$('.home__btn--prev').on('click', function() {
		$('.home__slider').trigger('prev.owl.carousel');
	});
	$('.home__btn--next').on('click', function() {
		$('.home__slider').trigger('next.owl.carousel');
	});

	/*==============================
	Products slider
	==============================*/
	$('.product-slider').owlCarousel({
		mouseDrag: true,
		touchDrag: true,
		dots: false,
		loop: true,
		autoplay: false,
		smartSpeed: 600,
		margin: 20,
		autoHeight: true,
		responsive : {
			0 : {
				items: 2,
			},
			768 : {
				items: 3,
			},
			992 : {
				items: 3,
				margin: 30,
			},
			1200 : {
				items: 4,
				margin: 30,
			},
		}
	});

	$('.section__btn--prev').on('click', function() {
		$('.product-slider').trigger('prev.owl.carousel');
	});
	$('.section__btn--next').on('click', function() {
		$('.product-slider').trigger('next.owl.carousel');
	});

	/*==============================
	Product slider
	==============================*/
	$('.product-head__slider').on('initialized.owl.carousel changed.owl.carousel', function(e) {
		if (!e.namespace) return;
		var carousel = e.relatedTarget;
		$('.product-head__counter').html((carousel.relative(carousel.current()) + 1) + ' ' + '/' + ' ' + carousel.items().length);
	}).owlCarousel({
		mouseDrag: true,
		touchDrag: true,
		items: 1,
		dots: false,
		loop: true,
		autoplay: false,
		smartSpeed: 600,
		margin: 0,
	});

	$('.product-head__nav--prev').on('click', function() {
		$('.product-head__slider').trigger('prev.owl.carousel');
	});
	$('.product-head__nav--next').on('click', function() {
		$('.product-head__slider').trigger('next.owl.carousel');
	});

	/*==============================
	Bg
	==============================*/
	$('.catalog-head, .product-head').each( function() {
		if ($(this).attr("data-bg")){
			$(this).css({
				'background': 'url(' + $(this).data('bg') + ')',
				'background-position': 'center center',
				'background-repeat': 'no-repeat',
				'background-size': 'cover'
			});
		}
	});

	/*==============================
	About
	==============================*/
	$('.about__slider').owlCarousel({
		mouseDrag: true,
		touchDrag: true,
		dots: true,
		loop: true,
		autoplay: true,
		autoplayTimeout: 7000,
		smartSpeed: 600,
		margin: 0,
		items: 1,
		onInitialize: startBg,
	});

	/*==============================
	Sliders
	==============================*/
	function startBg() {
		$('.home__slide, .about__slide').each( function() {
			if ($(this).attr("data-bg")){
				$(this).css({
					'background': 'url(' + $(this).data('bg') + ')',
					'background-position': 'center center',
					'background-repeat': 'no-repeat',
					'background-size': 'cover'
				});
			}
		});
	}

	/*==============================
	Modal
	==============================*/
	$('.menu__location').magnificPopup({
		fixedContentPos: true,
		fixedBgPos: true,
		overflowY: 'auto',
		type: 'inline',
		preloader: false,
		focus: '#username',
		modal: false,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in',
	});

	$('.about__video a, .land__video a').magnificPopup({
		disableOn: 700,
		type: 'iframe',
		mainClass: 'mfp-fade',
		removalDelay: 300,
		preloader: false,
		fixedContentPos: false
	});

	/*==============================
	Scroll bar
	==============================*/
	$('.modal__cities').mCustomScrollbar({
		axis: "y",
		scrollbarPosition: "outside",
		theme: "custom-bar"
	});

	$('.account__wrap').mCustomScrollbar({
		axis: "x",
		scrollbarPosition: "outside",
		theme: "custom-bar2",
		mouseWheel: {axis: "x"},
	});

	$('.menu__submenu nav').mCustomScrollbar({
		axis: "y",
		scrollbarPosition: "outside",
		theme: "custom-bar3"
	});

});