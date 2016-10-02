var attachListeners = function() {
  $('form#approval').on('click', function(event){
    approvalResponse(event);
  });
}

$(document).ready(function() {
  attachListeners();
});
