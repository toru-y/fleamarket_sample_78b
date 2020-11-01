$(function() {
    
	$('.transaction-tabs li').click(function() {
		var index = $('.transaction-tabs li').index(this);
		$('.tab-content-transaction ul').css('display','none');
		$('.tab-content-transaction ul').eq(index).css('display','block');
		$('.transaction-tabs li').removeClass('active');
		$(this).addClass('active')
	});
});

$(function() {
	$('.tabs li').click(function() {
		var index = $('.tabs li').index(this);
		$('.tab-content-notification-todo ul').css('display','none');
		$('.tab-content-notification-todo ul').eq(index).css('display','block');
		$('.tabs li').removeClass('active');
		$(this).addClass('active')
	});
});