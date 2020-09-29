$(document).on('turbolinks:load', ()=> {
    // input要素生成
    const buildFileField = (num)=> {
      const html = `<div data-index="${num}" class="js-file_group">
                      <input class="js-file" type="file"
                      name="item[images_attributes][${num}][image]"
                      id="item_images_attributes_${num}_image"><br>
                    </div>`;
      return html;
    }
    // プレビュー要素生成
    const buildImg = (index, url)=> {
      const html = `<div class="single-box">
                        <img data-index="${index}" src="${url}" width="100px" height="100px" class="preview__image">
                        <div class="__edit-box" data-index="${index}">
                            <div class="js-edit">
                                編集
                            </div>
                            <div class="js-remove">
                                削除
                            </div>
                        </div>
                    </div>`;
      return html;
    }
  
    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    // 既に使われているindexを除外
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);
  
    $('.hidden-destroy').hide();
  
    $('#image-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      // ファイルのブラウザ上でのURLを取得する
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
  
      // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else {  // 新規画像追加の処理
        $('#previews').append(buildImg(targetIndex, blobUrl));
        // fileIndexの先頭の数字を使ってinputを作る
        $('#input-hidden').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // 末尾の数に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      }
    });

    // 画像追加
    $('#image-box').on('click', '#input-area .__cover', function(e) {
        let lastIndex = $('#input-hidden .js-file_group').length - 1;
        if (lastIndex == 0) lastIndex = 0
        const inputBtn = $(`input[name="item[images_attributes][${lastIndex}][image]"`)
        inputBtn.click();
    });

    // 画像変更
    $('#image-box').on('click', '.js-edit', function() {
        const targetIndex = $(this).parent().data('index');
        // 該当indexを振られているチェックボックスを取得する
        const inputBtn = $(`#item_images_attributes_${targetIndex}_image`)
        // もしインプットボタンが存在すればボタンをクリック
        if (inputBtn) inputBtn.click();
    });

    // 画像削除
    $('#image-box').on('click', '.js-remove', function() {
      const targetIndex = $(this).parent().data('index');
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);
  
      $(this).parent().parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
  
      // 画像入力欄が0個にならないようにしておく
      if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    });
  });