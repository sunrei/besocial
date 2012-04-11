// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
    if($("#notice").length > 0){
        $("#notice").click(function(){
            $(this).fadeOut(400);
        });
        setTimeout('$("#notice").fadeOut(400);', 10000)
    }
    $("#tab_controls .tab").click(function(){
        if(!$(this).hasClass("active")){
            $("#tab_controls .active").removeClass("active");
           $("#main > .wrapper").load($(this).attr('href'));
            $(this).addClass("active");
        }
        return false;
    });
    $("#new_post .file-wrapper input").live('change',function(){
        //console.log($(this).val());
        $('#new_post .file-wrapper').prepend("<input type='file' />");
        $(this).css("top", "50px");
        $(this).attr('mydata', $(this).val());
        $(this).attr('name', 'post[pictures_attributes][][picture]');
        var fileText = "<li>" + $(this).val() + " <a href='#' class='remove_pending' title='Remove this attachment'>Remove</a></li>";
        $('#pending_list').prepend(fileText);
        //<input type="file" name="post[pictures_attributes][0][picture]" id="post_pictures_attributes_0_picture">
    });
    $('.remove_pending').live('click', function(){
        var thisIndex = $('#pending_list li').index($(this).parent());
        $('#new_post .file-wrapper').children().eq(thisIndex+1).remove();
        $(this).parent().remove();
        return false;
    });
});
