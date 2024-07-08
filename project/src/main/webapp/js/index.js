$(window).scroll(function () {
	var wTop = $(window).scrollTop();
	var best = $('.best');
	var season = $('.season');
	var gifticon = $('.gifticon');
	var thanks = $('.thanks');

	if (wTop >= best.offset().top - 600) {
		best.addClass('viewing');
	} else if (wTop <= best.offset().top - 600) {
		best.removeClass('viewing');
	}

	if (wTop >= season.offset().top - 600) {
		season.addClass('viewing');
	} else if (wTop <= season.offset().top - 600) {
		season.removeClass('viewing');
	}

	if (wTop >= gifticon.offset().top - 600) {
		gifticon.addClass('viewing');
	} else if (wTop <= gifticon.offset().top - 600) {
		gifticon.removeClass('viewing');
	}

	if (wTop >= thanks.offset().top - 600) {
		thanks.addClass('viewing');
	} else if (wTop <= thanks.offset().top - 600) {
		thanks.removeClass('viewing');
	}
});