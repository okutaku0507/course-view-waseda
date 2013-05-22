
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
  $("#teacher_rank_open_button").click(function(){
     $("#cover")
     .css({
       'width': $(window).width(),
       'height': $('#container').height()
     })
     .show();
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
    $("#teacher_rank_prompt").hide();
    $("#cover").hide();
  });
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
     $("#account_view_cover")
     .css({
       'width': $(window).width(),
       'height': $('#container').height()
     })
     .show();
    $("#account_view_index").css({
      'position': 'absolute',
      'top': $(window).scrollTop() + 50 + 'px'
    });
    $("#account_view_index").slideDown('fast');
    $("#account_view_delete_button").show();
    $("#account_view_add_button").hide();
  });
});

$(document).ready(function(){
  $("#account_view_delete_button").click(function(){
    $("#account_view_index").hide();
    $("#account_view_delete_button").hide();
    $("#account_view_add_button").show();
     $("#account_view_cover").hide();
  });
});


/* 時間割が表示される仕組み */

$(document).ready(function(){
  $("#account_schedule_add_button").click(function(){
     $("#account_view_cover")
     .css({
       'width': $(window).width(),
       'height': $('#container').height()
     })
     .show();
    $("#account_view_index").css({
      'position': 'absolute',
      'top': $(window).scrollTop() + 50 + 'px'
    });

    $("div#account_schedule").slideDown('fast');
    $("#account_schedule_delete_button").show();
    $("#account_schedule_add_button").hide();
  });
});

$(document).ready(function(){
  $("#account_schedule_delete_button").click(function(){
    $("div#account_schedule").hide();
    $("#account_schedule_delete_button").hide();
    $("#account_schedule_add_button").show();
    $("#account_view_cover").hide();
  });
});


// noticeの表示
$(document).ready(function(){
  $("#notice").css({
      'left': $(window).width() / 2 - 350 + 'px',
      'top': $(window).scrollTop() + 70 + 'px'
  })
  $("#notice")
  .show()
  .delay(2000)
  .slideUp('fast');
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
