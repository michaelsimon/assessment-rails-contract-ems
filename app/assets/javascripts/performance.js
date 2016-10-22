var Performance = function(attr) {
  this.id = attr.id;
  this.act_name = attr.act.name;
  this.venue_name = attr.venue.name;
  this.act_id = attr.act.id;
  this.venue_id = attr.venue.id;
  this.name = attr.name;
  this.perf_date = attr.perf_date;
  this.perf_time = attr.perf_time;
  this.tkts_url = attr.tkts_url;
  this.description = attr.description;
  this.contract_id = (attr.contract ? attr.contract.id : undefined);
  this.contract_status = (attr.contract ? attr.contract.status : undefined);
  this.rights = attr.rights;
}

Performance.prototype.fmatDate = function() {
  d = Date.parse(this.perf_date);
  d = new Date(d);
  var dayShortNames = ["Sun", "Mon", "Tues", "Weds", "Thurs", "Fri", "Sat"];

  return dayShortNames[d.getUTCDay()] + " " +(d.getUTCMonth()+1)+"/"+d.getUTCDate()+"/"+d.getUTCFullYear();
}

Performance.prototype.fmatTime = function() {
  function addZeroMins(i) {
    if (i < 10) {
      i = "0" + i;
    }
    return i;
  }
  function amPM(x) {
    x < 12 ? x = "AM" : x = "PM";
    return x;
  }
  t = new Date(this.perf_time);
  hh = ((t.getUTCHours() + 11) % 12 + 1);
  mm = addZeroMins(t.getUTCMinutes());
  ap = amPM(hh)

  return  hh + ":" + mm + " " + ap;
}

var performanceDetail = function() {
  perf_id = $('div[data-performance-id]').attr("data-performance-id");
  $.get(`/performances/${perf_id}/details`, function() {}).done(function(data) {

    var perfObject =  new Performance(data.performance_detail);

    $('#perf_name').append(perfObject.name);
    $('#act').append(`<a href="/acts/${perfObject.act_id}">${perfObject.act_name}</a>`);
    $('#venue').append(`<a href="/venues/${perfObject.venue_id}">${perfObject.venue_name}</a>`);
    $('#description').append(perfObject.description);
    $('#tickets').append(`<a href=${perfObject.tkts_url}">${perfObject.tkts_url}</a>`);
    $('#date').append(perfObject.fmatDate());
    $('#time').append(perfObject.fmatTime());
  }).error(function() {
    alert("There was an error loading the performance information. Please try again.");
  });
}

var performanceList = function(params) {
  $.get("/performances/list", params, function(){}).done(function(data) {
    var performances = data.performances
    $.each(performances, function(index, performance) {
      perf = new Performance(performance);
      if (Date.parse(perf.perf_date) > Date.now()) {
        time = "upcoming";
      } else {
        time = "past";
      }
      $(`tbody#${time}_perf`).append (`
        <tr data-performance-id="${perf.id}">
        <td class="col-md-2">${perf.name}</td>
        <td><a href="/acts/${perf.act_id}/">${perf.act_name} <i class="fa fa-arrow-circle-right"></i></a>
        <td><a href="/venues/${perf.venue_id}/">${perf.venue_name} <i class="fa fa-arrow-circle-right"></i></a>
        <td> ${perf.fmatDate()} @ ${perf.fmatTime()}</td>
        <td>${perf.contract_id !== undefined ? `<a href="/contracts/${perf.contract_id}/">${perf.contract_status}  <i class="fa fa-arrow-circle-right"></i></a>` : ""}
        </td>
        <td>${perf.rights}</td>
        </tr>
        `);
      });
    }).error(function() {
      alert("There was an error loading the listing of performances. Please try again.");
    });
  }
  var performanceDelete = function(event) {
    event.preventDefault();
    $.ajax({
      url: event.currentTarget.href,
      type: 'DELETE',
      dataType: 'JSON'
    }).done(function(response, status, jqXHR){
      $(`tr[data-performance-id='${response.id}']`).remove();
    }).error(function() {
      alert("There was an error processing your Performance delete request. Please try again.")
    });
  }
