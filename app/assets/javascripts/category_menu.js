$(function(){
    // カテゴリーメニュークラス変数定義
    const nav_category_cls = '.nav__category';
    const ul_category_cls = '.category__parents';
    const li_parent_cls = 'li.parents__item';
    const ul_children_cls = 'ul.category__children';
    const li_children_cls = 'li.children__item';
    const ul_grandchildren_cls = 'ul.category__grand-children';

    // 任意の要素にクラスを付与
    function toggleDisplayNone(element) {
        element.toggle('.display--none');
    }

    // サブカテゴリメニューの表示切替
    function toggleCategoriesMenu(tgt_ul_cls, index) {
        const ul_element = $(tgt_ul_cls).eq(index);
        toggleDisplayNone(ul_element);
    }

    // ナビゲーションのカテゴリーメニューイベント
    $(nav_category_cls).on({
        'mouseenter': function(){toggleDisplayNone($(ul_category_cls))},
        'mouseleave': function(){toggleDisplayNone($(ul_category_cls))}
    });

    // 親カテゴリーイベント
    $(li_parent_cls).on({
        'mouseenter': function(){toggleCategoriesMenu(ul_children_cls, $(li_parent_cls).index(this))},
        'mouseleave': function(){toggleCategoriesMenu(ul_children_cls, $(li_parent_cls).index(this))}
    })

    // 子カテゴリメニューのイベント
    $(li_children_cls).on({
        'mouseenter': function(){toggleCategoriesMenu(ul_grandchildren_cls, $(li_children_cls).index(this))},
        'mouseleave': function(){toggleCategoriesMenu(ul_grandchildren_cls, $(li_children_cls).index(this))}
    })
})