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
    $('form').attr({
      class: 'edit_document',
      id: `edit_document`,
      action: `/contracts/${response.contract_id}/documents/${response.id}`
    });
    $('form').append('<input type="hidden" name="_method" value="patch" />');
    $('#document_name').val(response.name);
    $('#document_description').val(response.description);
    $('#document_location').val(response.location);
    $('#modalDocTitle').html("Edit Document");
    $('#modalSubmit').attr('value','Update Document');
    $('#modalDocument').modal("show");
  });
}


var documentSubmit = function(event) {
  event.preventDefault();
  $.ajax({
    url: event.currentTarget.action,
    type: 'POST',
    dataType: 'JSON',
    data: $('#new_document, #edit_document').serialize()
  }).done(function(response, status, jqXHR){
    if (jqXHR.status === 201) {
      $('#documents > tbody').append(`<tr doc-id="${response.id}"><td><a href="${response.location}">${response.name}</a></td><td>${response.description}</td><td>buttons</td></tr>`)
    }
    else if (jqXHR.status === 200) {
      $(`#documents > tbody > tr[data-id="${response.id}"] > td:eq(0) > a`).text(response.name);
      $(`#documents > tbody > tr[data-id="${response.id}"] > td:eq(1)`).text(response.description);
    }
    $('#modalDocument').modal("hide");
  });
}
