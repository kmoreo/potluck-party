$(document).ready(function() {

  $("#new-poem-form").on("submit", function(event){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr('action');
    var method = $form.attr('method');
    var data = $form.serialize();
  
    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      $("#poems").prepend(response);
      $form.trigger("reset");
    });
  });

  

});