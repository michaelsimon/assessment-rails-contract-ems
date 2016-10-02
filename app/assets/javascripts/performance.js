var performanceDetail = function() {
  perf_id = $('div[data-performance-id]').attr("data-performance-id");
  $.get(`/performances/${perf_id}/details`, function(data) {
    perf = data.performance_detail;
    $('#perf_name').append(perf.name);
    $('#act').append(`<a href="/acts/${perf.act.id}">${perf.act.name}</a>`);
    $('#venue').append(`<a href="/venues/${perf.venue.id}">${perf.venue.name}</a>`);
    $('#description').append(perf.description);
    $('#tickets').append(`<a href=${perf.tkts_url}">${perf.tkts_url}</a>`);
    $('#date').append(perf.perf_date);
    $('#time').append(perf.perf_time);
  });


}
