

$(document).ready(function() {
  $('form').on('click', function(event){
    //code
    event.preventDefault();
    // debugger;
    if (event.currentTarget.id === "approve") {
      $.ajax({
        url: "/approvals/approve",
        type: 'POST',
        dataType: 'JSON',
        data: {id: $(this)[0][0].dataset.id}
      }).done(function(response, stat){
        $(`[data-approval-id="${response.id}"] > td#date_answered`)["0"].innerHTML = response.date_answered;
        $(`[data-approval-id="${response.id}"] > td#status`)["0"].innerHTML = "approved";
        $(`[data-approval-id="${response.id}"] > td#buttons`)["0"].innerHTML = "";
      });
  }
  });
});
