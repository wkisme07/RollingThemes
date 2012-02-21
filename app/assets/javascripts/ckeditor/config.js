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