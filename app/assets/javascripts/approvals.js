

$(document).ready(function() {
  $('form').on('submit', function(event){
    //code
    event.preventDefault();
    $('#approve').on("click", function(clicked){
      $.ajax({
        url: "/approvals/approve",
        type: 'POST',
        dataType: 'JSON',
        data: {id: $(this)[0].dataset.id}
      }).done(function(response, stat){
        
      });
    });
  });
});
