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
  hh = t.getUTCHours();
  mm = addZeroMins(t.getUTCMinutes());
  ap = amPM(hh)

  return  hh + ":" + mm + " " + ap;
}

var performanceDetail = function() {
  perf_id = $('div[data-performance-id]').attr("data-performance-id");
  $.get(`/performances/${perf_id}/details`, function(data) {

    var perfObject =  new Performance(data.performance_detail);

    $('#perf_name').append(perfObject.name);
    $('#act').append(`<a href="/acts/${perfObject.act_id}">${perfObject.act_name}</a>`);
    $('#venue').append(`<a href="/venues/${perfObject.venue_id}">${perfObject.venue_name}</a>`);
    $('#description').append(perfObject.description);
    $('#tickets').append(`<a href=${perfObject.tkts_url}">${perfObject.tkts_url}</a>`);
    $('#date').append(perfObject.fmatDate());
    $('#time').append(perfObject.fmatTime());
  });
}
