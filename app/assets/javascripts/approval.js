var Approval = function(attr) {
  this.id = attr.id;
  this.contract_id = attr.contract_id;
  this.user_id = attr.uder_id;
  this.date_requested = attr.date_requested;
  this.date_answered = attr.date_answered;
  this.status = attr.status;
}

Approval.prototype.fmatDate = function(dt) {
  d = Date.parse(dt);
  d = new Date(d);
  var dayShortNames = ["Sun", "Mon", "Tues", "Weds", "Thurs", "Fri", "Sat"];

  return dayShortNames[d.getUTCDay()] + " " +(d.getUTCMonth()+1)+"/"+d.getUTCDate()+"/"+d.getUTCFullYear();
}

var approvalResponse = function(event){
  event.preventDefault();
  answer = event.currentTarget.getAttribute("data-approval-answer");
    $.ajax({
      url: "/approvals/" + answer,
      type: 'POST',
      dataType: 'JSON',
      data: {id: event.currentTarget.getAttribute("data-approval-id")}
    }).done(function(response, stat){
      approvalObject = new Approval(response);
      $(`[data-approval-id="${approvalObject.id}"] > td#date_answered`).text(approvalObject.fmatDate(approvalObject.date_answered));
      $(`[data-approval-id="${approvalObject.id}"] > td#status`).text(approvalObject.status);
      $(`[data-approval-id="${approvalObject.id}"] > td#buttons`).text("")
    }).error(function() {
      alert("There was an error processing your response submission. Please try again.")
    });
}
