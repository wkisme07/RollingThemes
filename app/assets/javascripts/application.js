// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.facebox
//= require ckeditor/ckeditor
// require_tree .

$(document).ready(function(){
  $('a[rel*=facebox]').facebox();

  // select/deselect all items
  $('.toggle').click(function(){
    var check = $(this).is(':checked');
    $('.table td input[type=checkbox]').attr('checked', check);
  });

  // hide alert
  $('.flash').click(function(){
    $(this).slideUp();
  });

  // ck editor ajax request
  $('form[data-remote]').bind("ajax:before", function(){
    for (instance in CKEDITOR.instances){
      CKEDITOR.instances[instance].updateElement();
    }
  });

});

// DONT CLOSE FACEBOX WHEN DOCUMENT IS CLICKED
$.extend($.facebox.settings, {
  modal : true
});
$(document).bind('loading.facebox', function(){
  $("#facebox_overlay").unbind("click").click(function(){
    if (!$.facebox.settings.modal){
      $(document).trigger('close.facebox');
    }
  })
});


CKEDITOR.config.toolbar_AdminSimple =
[
    { name: 'document',    items : [ 'Source','-','Save','Preview' ] },
    { name: 'clipboard',   items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
    { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight', 'SelectAll' ] },
    { name: 'links',       items : [ 'Link','Unlink','Anchor','Image','Smiley' ] },
    '/',
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items : [ 'TextColor','BGColor' ] }
];

CKEDITOR.config.toolbar = 'AdminSimple';