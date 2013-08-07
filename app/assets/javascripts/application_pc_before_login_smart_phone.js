//= require jquery
//= require jquery_ujs
//= require_tree ./pc
//= require ./skOuterClick.js
// application_pc_before_login.js

// loadingの時の挙動
$('head').append(
	'<style type="text/css">#container { display: none; } div#loader { display: block; }</style>'
);

jQuery.event.add(window,"load",function() { // 全ての読み込み完了後に呼ばれる関数
  $("#loader").hide();
  $("#container").css("display", "block");
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

$(document).ready(function(){
  $("#member_new_form_button").click(function(){
    $("#concept").hide('slow', function() {
    $("#new_member").slideDown("slow", function() {
    $('#footer').removeAttr('style');
    });
  });
});
});

$(document).ready(function(){
  $("#login_form_button").click(function(){
    $("#concept").hide('slow', function() {
    $("#login_form").slideDown('slow');
  });
});
});
