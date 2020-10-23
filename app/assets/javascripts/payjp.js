$(function(){
  var form = $("#card__form");
  // カード登録ボタンが押されたとき
  $('#card_regist_submit').on('click', function(e){
    Payjp.setPublicKey("ここに公開鍵のトークン")
    e.preventDefault();
    // 入力されたカード情報を取得
    let card = {
      number: $('#card-number').val(),
      cvc: $('#card-cvc').val(),
      exp_month: $('#card-exp-month').val(),
      exp_year: $('#card-exp-year').val(),
    }
    // Token作成
    Payjp.createToken(card, function(status, response){
      if (status == 200) {
        // ボタン無効
        $(this).find("input[type=submit]").prop("disabled", true);
        // 入力値を送信パラメータに入れない
        $('#card-number').removeAttr('name');
        $('#card-cvc').removeAttr('name');
        $('#card-exp-month').removeAttr('name');
        $('#card-exp-year').removeAttr('name');
        // tokenを送信パラメータに入れる
        $("#card_token").append(
          $('<input type="hidden" id="test" name="payjpToken">').val(response.id)
        );
        // submit(カード登録cards#create)
        document.inputForm.submit();
      } else {
        alert('カードの内容が正しくありません')
      }
    })
  })
})