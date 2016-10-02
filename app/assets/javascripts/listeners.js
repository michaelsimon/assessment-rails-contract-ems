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
}
$(document).ready(function() {
  attachListeners();
});
