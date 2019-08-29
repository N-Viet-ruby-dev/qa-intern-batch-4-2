$( document ).on('turbolinks:load', function() {
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
  })

  $(".btn-signup-form").click(function() {
    $(".signin-form").modal('hide');
    $('body').css('overflow-y', 'hidden')
    $('.signup-form').css('overflow-y', 'auto');

  });

  $(".btn-signin-form").click(function() {
    $(".signup-form").modal('hide');
    $('body').css('overflow-y', 'hidden')
    $('.signin-form').css('overflow-y', 'auto');
  });

  $("#ajjax").click(function() {
    $('.modal').animate({
            scrollTop: 0
        }, 'slow');
    return false
  });
});
