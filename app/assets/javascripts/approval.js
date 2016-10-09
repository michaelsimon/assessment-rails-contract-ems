var approvalResponse = function(event){
  event.preventDefault();
  answer = event.currentTarget.getAttribute("data-approval-answer");
    $.ajax({
      url: "/approvals/" + answer,
      type: 'POST',
      dataType: 'JSON',
      data: {id: event.currentTarget.getAttribute("data-approval-id")}
    }).done(function(response, stat){
      $(`[data-approval-id="${response.id}"] > td#date_answered`).text(response.date_answered);
      $(`[data-approval-id="${response.id}"] > td#status`).text(response.status);
      $(`[data-approval-id="${response.id}"] > td#buttons`).text("")
    }).error(function() {
      alert("There was an error processing your response submission. Please try again.")
    });
}
