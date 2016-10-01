var approvalRespone = function(event){
  debugger;
  event.preventDefault();
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
  } else if (event.currentTarget.id === "reject") {
    $.ajax({
      url: "/approvals/reject",
      type: 'POST',
      dataType: 'JSON',
      data: {id: $(this)[0][0].dataset.id}
    }).done(function(response, stat){
      $(`[data-approval-id="${response.id}"] > td#date_answered`)["0"].innerHTML = response.date_answered;
      $(`[data-approval-id="${response.id}"] > td#status`)["0"].innerHTML = "rejected";
      $(`[data-approval-id="${response.id}"] > td#buttons`)["0"].innerHTML = "";
    });
  } else if (event.currentTarget.id === "cancel") {
    $.ajax({
      url: "/approvals/cancel",
      type: 'POST',
      dataType: 'JSON',
      data: {id: $(this)[0][0].dataset.id}
    }).done(function(response, stat){
      $(`[data-approval-id="${response.id}"] > td#date_answered`)["0"].innerHTML = response.date_answered;
      $(`[data-approval-id="${response.id}"] > td#status`)["0"].innerHTML = "canceled";
      $(`[data-approval-id="${response.id}"] > td#buttons`)["0"].innerHTML = "";
    });
  }
}
