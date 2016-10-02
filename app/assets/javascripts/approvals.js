var approvalResponse = function(event){
  event.preventDefault();
  answer = event.currentTarget.getAttribute("data-approval-answer")
  if (event.currentTarget.getAttribute("data-approval-answer") === "approve") {
    $.ajax({
      url: "/approvals/approve",
      type: 'POST',
      dataType: 'JSON',
      data: {id: event.currentTarget.getAttribute("data-approval-id")}
    }).done(function(response, stat){
      $(`[data-approval-id="${response.id}"] > td#date_answered`)["0"].innerHTML = response.date_answered;
      $(`[data-approval-id="${response.id}"] > td#status`)["0"].innerHTML = "approved";
      $(`[data-approval-id="${response.id}"] > td#buttons`)["0"].innerHTML = "";
    });
  } else if (event.currentTarget.getAttribute("data-approval-answer") === "reject") {
    $.ajax({
      url: "/approvals/reject",
      type: 'POST',
      dataType: 'JSON',
      data: {id: event.currentTarget.getAttribute("data-approval-id")}
    }).done(function(response, stat){
      $(`[data-approval-id="${response.id}"] > td#date_answered`)["0"].innerHTML = response.date_answered;
      $(`[data-approval-id="${response.id}"] > td#status`)["0"].innerHTML = "rejected";
      $(`[data-approval-id="${response.id}"] > td#buttons`)["0"].innerHTML = "";
    });
  } else if (event.currentTarget.getAttribute("data-approval-answer") === "cancel") {
    $.ajax({
      url: "/approvals/cancel",
      type: 'POST',
      dataType: 'JSON',
      data: {id: event.currentTarget.getAttribute("data-approval-id")}
    }).done(function(response, stat){
      $(`[data-approval-id="${response.id}"] > td#date_answered`)["0"].innerHTML = response.date_answered;
      $(`[data-approval-id="${response.id}"] > td#status`)["0"].innerHTML = "canceled";
      $(`[data-approval-id="${response.id}"] > td#buttons`)["0"].innerHTML = "";
    });
  }
}
