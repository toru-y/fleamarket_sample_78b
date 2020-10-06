$(function() {
    
	$('.transaction-tabs li').click(function() {
        // 処理：　クリックしたタブのリスト(お知らせ/やることリスト)の表示・非表示切り替える
		var index = $('.transaction-tabs li').index(this);
		// リストを全非表示
		$('.tab-content-transaction ul').css('display','none');
		// タブと同じインデックスのリストを表示
		$('.tab-content-transaction ul').eq(index).css('display','block');
        // アクティブタブの変更
		$('.transaction-tabs li').removeClass('active');
		$(this).addClass('active')
	});
});

$(function() {
	$('.tabs li').click(function() {
        // 処理：　クリックしたタブのリスト(取引中/過去の取引)の表示・非表示切り替える
		var index = $('.tabs li').index(this);
		$('.tab-content-notification-todo ul').css('display','none');
		$('.tab-content-notification-todo ul').eq(index).css('display','block');
		$('.tabs li').removeClass('active');
		$(this).addClass('active')
	});
});