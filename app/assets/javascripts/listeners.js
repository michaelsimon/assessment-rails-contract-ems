var attachListeners = function() {

  $('form#approval').on('click', function(event){
    approvalResponse(event);
  });

  $('form#new_document, form#edit_document').on('submit', function(event){
    documentSubmit(event);
  });

  $('a#edit-doc').on('click', function(event){
    editDocumentInfo(event);
  });

  $('a#new-doc').on('click', function(event){
    newDocument(event);
  });

  $('a#del-doc').on('click', function(event){
    documentDelete(event);
  });

  if ($('div[data-performance-id]').length) {
    performanceDetail(event);
  }

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
