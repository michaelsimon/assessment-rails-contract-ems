var attachListeners = function() {
  $('form#approve, form#reject, form#cancel').on('click', function(event){
    approvalRespone(event);
  });
}

$(document).ready(function() {
  attachListeners();
});
