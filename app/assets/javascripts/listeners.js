var attachListeners = function() {

  $('form#approval').on('click', function(event){
    approvalResponse(event);
  });

  $('form#new_document, form#edit_document').on('submit', function(event){
    documentSubmit(event);
  });

  if ($('div[data-contract-id]').length) {
    contractDetail(event);
  }

  $('#documents').on('click', 'a#edit-doc', function(event){
    editDocumentInfo(event);
  });

  $('#new-doc').on('click', function(event){
    newDocument(event);
  });

  $('#upcoming_perf, #past_perf').on('click', 'a#del-perf', function(event){
    performanceDelete(event);
  });

  if ($('div[data-performance-id]').length) {
    performanceDetail(event);
  }

  $('#documents').on('click', 'a#del-doc', function(event){
    documentDelete(event);
  });

  if ($('div[data-performance-all-list]').length) {
    performanceList({type: "home"});
  }

  if ($('div[data-performance-venue-list]').length) {
    performanceList({type: "venue", id: $('div[data-performance-venue-list]').attr('data-performance-venue-list')});
  }

  if ($('div[data-performance-act-list]').length) {
    performanceList({type: "act", id: $('div[data-performance-act-list]').attr('data-performance-act-list')});
  }

}

$(document).ready(function() {
  attachListeners();
});
