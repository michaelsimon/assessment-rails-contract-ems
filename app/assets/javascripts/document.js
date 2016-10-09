var Document = function(attr) {
  this.id = attr.id;
  this.contract_id = attr.contract_id;
  this.name = attr.name;
  this.description = attr.description;
}

var newDocument = function(event) {
  event.preventDefault();
  $('form#new_document, form#edit_document').attr({
    class: 'new_document',
    id: `new_document`,
    action: `${event.currentTarget.pathname}/documents`
  });
  $('#document_name').val("");
  $('#document_description').val("");
  $('#document_location').val("");
  $('#modalDocTitle').html("New Document");
  $('#modalSubmit').attr('value','Create Document');
  $("input[name='_method']").remove()
  $('#modalDocument').modal("show");
}

var editDocumentInfo = function(event) {
  event.preventDefault();
  $.get(event.currentTarget.pathname, function() {
  }).done(function(response, stat){
    doc = response.document
    $('form').attr({
      class: 'edit_document',
      id: `edit_document`,
      action: `/contracts/${doc.contract_id}/documents/${doc.id}`
    });
    $('form').append('<input type="hidden" name="_method" value="patch" />');
    $('#document_name').val(doc.name);
    $('#document_description').val(doc.description);
    $('#document_location').val(doc.location);
    $('#modalDocTitle').html("Edit Document");
    $('#modalSubmit').attr('value','Update Document');
    $('#modalDocument').modal("show");
  }).error(function() {
    alert("There was an error processing your Edit Document request. Please try again.")
  });;
}


var documentSubmit = function(event) {
  event.preventDefault();
  $.ajax({
    url: event.currentTarget.action,
    type: 'POST',
    dataType: 'JSON',
    data: $('#new_document, #edit_document').serialize()
  }).done(function(response, status, jqXHR){
    doc = new Document(response.document);
    if (jqXHR.status === 201) {
      $('#documents').append(`<tr doc-id="${doc.id}"><td><a href="/contracts/${doc.contract_id}/documents/${doc.id}">${doc.name}</a></td><td>${doc.description}</td><td>buttons</td></tr>`)
    }
    else if (jqXHR.status === 200) {
      $(`#documents > tr[data-document-id="${doc.id}"] > td:eq(0) > a`).text(doc.name);
      $(`#documents > tr[data-document-id="${doc.id}"] > td:eq(1)`).text(response.description);
    }
    $('#modalDocument').modal("hide");
  }).error(function() {
    alert("There was an error processing your Document create/update request. Please try again.")
  });
}

var documentDelete = function(event) {
  event.preventDefault();
  $.ajax({
    url: event.currentTarget.href,
    type: 'DELETE'
  }).done(function(response, status, jqXHR){
    $(`tr[data-document-id='${response.document.id}']`).remove();
  }).error(function() {
    alert("There was an error processing your Document delete request. Please try again.")
  });;
}
