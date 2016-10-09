var Contract = function(attr) {
  this.id = attr.id;
  this.name = attr.performance.name;
  this.perf_date = attr.performance.perf_date
  this.act_name = attr.performance.act.name;
  this.act_id = attr.performance.act.id;
  this.venue_name = attr.performance.venue.name;
  this.venue_id = attr.performance.venue.id;
  this.submit_date = attr.submit_date;
  this.due_date = attr.due_date;
  this.status = attr.status;
  this.details = attr.details;
}

Contract.prototype.fmatDate = function(dt) {
  d = Date.parse(dt);
  d = new Date(d);
  var dayShortNames = ["Sun", "Mon", "Tues", "Weds", "Thurs", "Fri", "Sat"];

  return dayShortNames[d.getUTCDay()] + " " +(d.getUTCMonth()+1)+"/"+d.getUTCDate()+"/"+d.getUTCFullYear();
}
Contract.prototype.curStatus = function() {
  fullStatus = ""
  switch(this.status) {
    case 'pend' : fullStatus = "Pending"
    break;
    case 'submit' : fullStatus = "Submitted";
    break;
    case 'app' : fullStatus = "Approved";
    break;
    case 'ff' : fullStatus = "Fulfilled";
    break;
    case 'cancel' : fullStatus = "Cancelled";
    break;
  }
  return fullStatus;
}

var contractDetail = function() {
  contract_id = $('div[data-contract-id]').attr("data-contract-id");
  $.get(`/contracts/${contract_id}/details`, function(){}).done(function(data){

    var contractObject =  new Contract(data.contract);

    $('#performance_name').append(contractObject.name);
    $('#act').append(`<a href="/acts/${contractObject.act_id}">${contractObject.act_name} <i class="fa fa-arrow-circle-right"></i></a>`);
    $('#venue').append(`<a href="/venues/${contractObject.venue_id}">${contractObject.venue_name} <i class="fa fa-arrow-circle-right"></i></a>`);
    $('#contract_details').append(contractObject.details);
    $('#due_date').append(contractObject.fmatDate(contractObject.due_date));
    $('#submit_date').append(contractObject.fmatDate(contractObject.submit_date));
    $('#perf_date').append(contractObject.fmatDate(contractObject.perf_date));
    $('#contract_status').append(contractObject.curStatus());

    var allDocuments = data.contract.documents;
    allDocuments.forEach(function(document){
      documentObject = new Document(document);
      $('#documents').append(`<tr doc-id="${documentObject.id}"><td><a href="/contracts/${contractObject.id}/documents/${documentObject.id}">${documentObject.name}</a></td><td>${documentObject.description}</td><td>buttons</td></tr>`);
    });

  }).error(function() {
    alert("There was an error loading the contract information. Please try again.");
  });
}
