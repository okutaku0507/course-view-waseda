//= require jquery
//= require jquery_ujs
//= require_tree ./pc
//= require ./skOuterClick.js
// application_pc_before_login.js

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
