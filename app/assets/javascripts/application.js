
//= require jquery
//= require jquery_ujs
//= require_tree .

// ゲストのタイトルがcourse_infoに飛ぶ
$(document).ready(function(){
  $("#course_view_title").click(function(){
    window.location = "/course_infos/";
  });
});

// コースのインデックスでパネルをクリックするとそのショーに飛ぶ
$(document).ready(function(){
  $(".course_info_panel").click(function(){
    var infoId = $(this).data('num');
    window.location = "/course_infos/" + infoId;
  });
});


// 続きを読む
$(document).ready(function(){
  $(".show").click(function(){
    var showId = $(this).data('num');
    $(".view_show_" + showId).show('fast');
    $(this).hide();
    $(".show_dod_" + showId).hide();
  });
});


// headerのメニューばー
  $(function() {
    $('li.submenu1').click(function() {
      if ($('li.submenu2').hasClass('click')) {
        $('li.submenu2').removeClass('click');
      }
      else {
        $('.click').removeClass('click');
        $('li.submenu2').addClass('click');
      }
    });
    $('li.submenu1 ul li').hover(
      function() { $('li.submenu2').addClass('hover'); },
      function() { $('li.submenu2').removeClass('hover'); });
  });

//  $(function() {
//    $('li.submenu2').click(function() {
//      if ($(this).hasClass('click')) {
//        $(this).removeClass('click');
//      }
//      else {
//        $('.click').removeClass('click');
//        $(this).addClass('click');
//      }
//    });
//    $('li.submenu2 ul li').hover(
//      function() { $(this).addClass('hover'); },
//      function() { $(this).removeClass('hover'); });
//  });

// footerのアカウント設定
  $(function() {
    $('li.account_menu1').click(function() {
      if ($('li.account_menu2').hasClass('click')) {
        $('li.account_menu2').removeClass('click');
      }
      else {
        $('.click').removeClass('click');
        $('li.account_menu2').addClass('click');
      }
    });
    $('li.account_menu1 ul li').hover(
      function() { $('li.account_menu2').addClass('hover'); },
      function() { $('li.account_menu2').removeClass('hover'); });
  });


/* checkされないと送信されない仕組み */
  $(function() {
    $('#check').click(function(){
    if($(this).prop('checked') == false){
         $('#button_member_new').attr("disabled","disabled");   
    }
    else {
        $('#button_member_new').removeAttr('disabled');
    }
});

  });
  
  // rabbitをクリックするとそのショーに飛ぶ
$(document).ready(function(){
  $(".rabbit").click(function(){
    window.location = "http://rabbit-network.com";
  });
});


  