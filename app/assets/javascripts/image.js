$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
        $('#img_prev').css('width','250px');
        $('#img_prev').css('height','200px');
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#customFile").change(function(){
    readURL(this);
  });
  //  bootstrapの設定
  $('.custom-file-input').on('change',function(){
    $(this).next('.custom-file-label').html($(this)[0].files[0].name);
  })
 });


