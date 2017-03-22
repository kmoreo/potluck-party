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
      $("#poem-list").prepend(response);
      $form.trigger("reset");
    });
  });

  $("#poem-list").on("click", ".button-applaud", function(event){
    event.preventDefault();
    
    var $form = $(this).parent(".form");
    var url = $form.attr('action');
    
    $.ajax({
      url: url,
      method: "put"
    }).done(function(response){
      $form.siblings(".poem-details").children(".applauds").text(response)
    })
  });

});