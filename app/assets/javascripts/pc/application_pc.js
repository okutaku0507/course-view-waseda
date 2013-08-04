// application_pc.js

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

$(document).ready(function(){
  $(".admin_course_info_panel").click(function(){
    var infoId = $(this).data('num');
    window.location = "/admin/course_infos/" + infoId;
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


$(document).ready(function(){
    $('span.pulldown_menu_open').click(function() {
    $('div.menu_box_label').show();
    $(this).hide();
    $('span.pulldown_menu_close').show();
  });
});

$(document).ready(function(){
    $('span.pulldown_menu_close').click(function() {
    $('div.menu_box_label').hide();
    $(this).hide();
    $('span.pulldown_menu_open').show();
    $('div.account_setting').hide();
  });
});

$(document).ready(function(){
  $('div#menu_box').skOuterClick(function() {
    $('div.menu_box_label').hide();
    $('div.account_setting').hide();
    $('span.pulldown_menu_close').hide();
    $('span.pulldown_menu_open').show();
  });
});

$(document).ready(function(){
    $('p.account_button').click(function() {
    $('div.account_setting').slideDown();
  });
});


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

$(document).ready(function(){
  $(".rabbit_before_login").click(function(){
    window.location = "http://rabbit-network.com";
  });
});

  // guestが加筆ボタンをクリックしたときの仕組み
$(document).ready(function(){
  $("#guest_view_add_button").click(function(){
    alert("Course Viewに参加してください！");
  });
});
// 教授評価がprompt風に出てくる仕組み
$(document).ready(function(){
  $("td.teacher_rank_prompt").click(function(){
     $("#cover").show();
    $("#teacher_rank_prompt")
    .css({
      'position': 'absolute',
      'top': $(window).scrollTop() + 200 + 'px',
      'left': $(window).width() / 2 - 100 + 'px',
    })
    .show();
  });
});

$(document).ready(function(){
  $("#teacher_rank_colse_button").click(function(){
    $("#teacher_rank_prompt").fadeOut('fast', function() {
    $("#cover").fadeOut('fast');
    });
  });
});

$(document).ready(function(){
   if($('#container').height() > $(window).height()){
     $("#cover")
     .css({
       'width': "100%",
       'height': $('#container').height() + 40 + 'px'
     });
    }else{
         $("#cover")
     .css({
       'width': "100%",
       'height': "100%"
     });
    }
});


/* 時間割の講義の詳細が出る仕組み 
$(document).ready(function(){
  $(".schedule_panel").click(function(){
    var TakeCourseId = $(this).data('num');
    $("#take_course_detail_" + TakeCourseId)
    .css({
      'position': 'absolute',
      'background-color': '#ffffff',
      'text-align': 'left',
      'border-radius': '5px',
      'box-shadow': '1px 1px 3px 0 #000000',
      'padding': '10px 20px'
    })
    .slideDown();
  });
});

$(document).ready(function(){
  $(".take_course_detail_close_button").click(function(){
    var TakeCourseId = $(this).data('num');
    $("#take_course_detail_" + TakeCourseId).slideUp();
  });
});*/

// アカウントのviewの加・消

$(document).ready(function(){
  $("#account_view_add_button").click(function(){
     $("#account_view_cover").fadeIn('fast', function(){
    $("#account_view_index")
    .delay(100)
    .slideDown('fast');     
     });
    $("#account_view_index").css({
      'position': 'absolute',
      'top': $(window).scrollTop() + 50 + 'px'
    });
    $("#account_view_delete_button").show();
  });
});

$(document).ready(function(){
  $("#account_view_delete_button").click(function(){
    $("#account_view_index").slideUp('fast', function() {
    $("#account_view_cover")
    .delay(200)
    .fadeOut('fast')
    });
    $("#account_view_delete_button").hide();
  });
});


/* 時間割が表示される仕組み */

$(document).ready(function(){
  $("#account_schedule_add_button").click(function(){
    $("div#account_schedule").slideDown('fast');
    $("#account_schedule_delete_button").show();
  });
});

$(document).ready(function(){
  $("#account_schedule_delete_button").click(function(){
    $("div#account_schedule").slideUp('fast', function() {
    $("#account_view_cover")
    .delay(200)
    .fadeOut('fast')
    });
    $("#account_schedule_delete_button").hide();
  });
});

$(document).ready(function(){
   if($('#container').height() > $(window).height()){
     $("#account_view_cover")
     .css({
       'width': "100%",
       'height': $('#container').height() + 40 + 'px'
     });
    }else{
         $("#account_view_cover")
     .css({
       'width': "100%",
       'height': "100%"
     });
    }
});

$(document).ready(function(){
  $("#other_schedule_index_open_button").click(function(){
    $("div#other_schedule_index").slideDown();
    $(this).hide();
  });
});

// noticeの表示
$(document).ready(function(){
  $("#notice")
  .show()
  .delay(5000)
  .slideUp('fast');
});


// 履修の編集が出る仕組み

$(document).ready(function(){
  $("span.take_course_edit_button").click(function(){
    var TakeCourseId = $(this).data('num');
    $(".take_course_detail_edit_hide_" + TakeCourseId).show();
    $(".take_course_detail_open_" + TakeCourseId).hide();
  });
});

// 講義more検索
$(document).ready(function(){
  $("#add_search_open_button").click(function(){
    $("#add_search").slideDown('fast');
    $(this).hide();
    $("#add_search_close_button").show();
  });
});

$(document).ready(function(){
  $("#add_search_close_button").click(function(){
    $("#add_search").slideUp('fast');
    $(this).hide();
    $("#add_search_open_button").show();
  });
});

$(document).ready(function(){
  $('div#search').skOuterClick(function() {
    $("#add_search").slideUp('fast');
    $("#add_search_close_button").hide();
    $("#add_search_open_button").show();
  });
});

// レスポンスがプルダウン

$(document).ready(function(){
  $(".response_add_button").click(function(){
    var CourseViewId = $(this).data('num');
    $("#response_add_" + CourseViewId).slideDown('fast');
  });
});

$(document).ready(function(){
  $(".show_response_add_button").click(function(){
    var CourseViewId = $(this).data('num');
    $("#response_add_" + CourseViewId).slideDown('fast');
  });
});


/* コメントのタイムライン */

$(document).ready(function(){
  $("#comment_log_add_button").click(function(){
    $("#comment_log_panel").slideDown('fast', function() {
    if($('#comment_log_panel').height() > 320){
    $("#comment_log_index").css({
       'overflow': 'scroll',
       'overflow-x': 'hidden',
       'height': 290 + "px"
    });
    $("#comment_log_panel").css({
       'height': 310 + "px"
    });
    }
    
    });
  });
});

$(document).ready(function(){
  $('div#mypage_buttons').skOuterClick(function() {
    $("#comment_log_panel").slideUp('fast');
  });
});

// loupeがでる仕組み
$(document).ready(function(){
  $('td.schedule_detail').hover(function() {
    var loupeId = $(this).data('num');
    $("a." + loupeId).show('fast');
    },
  function() {
    var loupeId = $(this).data('num');
    $("a." + loupeId).hide();
  });
});

// アカウントの時間割で講義作成の検索が出る仕組み

$(document).ready(function(){
    $('#course_creater_button').click(function() {
    $('div#new_schedule_form').show('fast');
    $(this).hide();
  });
});

// パスワードの変更がプルダウン

$(document).ready(function(){
    $('p.password_setting_button').click(function() {
    $('div#member_password_edit').slideDown('fast');
    $('div#withdrawal_form').slideUp('fast');
  });
});

$(document).ready(function(){
      $('p.withdrawal_setting_button').click(function() {
      $('div#member_password_edit').slideUp('fast');
      $('div#withdrawal_form').slideDown('fast');
  });
});

// 講義検索結果が講義がみつからなかったとき

$(document).ready(function(){
      $('#search_info_title').click(function() {
      $('div#search_info').slideDown('fast');
  });
});

$(document).ready(function(){
      $('.new_course_info_button').click(function() {
      $('#search_no_course').hide();
      $('div#new_course').slideDown('slow');
  });
});


//  likeの非同期通信
  
//$(document).ready(function(){
//  $("#good_button").click(function(){
//    var infoId = $(this).data('num');
//    $.ajax({
//    type: "PUT",
//    url: "/course_infos/" + infoId + "/like",
//    data: "",
//    success: function(){
//    alert('points');
//    }
//    });
//  });
//});

//$(document).ready(function(){
//  $("#no_good").click(function(){
//    var infoId = $(this).data('num');
//    $.ajax({
//    type: "PUT",
//    url: "/course_infos/" + infoId + "/unlike",
//    data: "",
//    success: function(){
//    alert('points');
//    }
//    });
//  });
//});


