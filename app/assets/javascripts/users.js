// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function getUserStats(){
  $.ajax({
    method: 'GET',
    url: window.location.href + '/stats',
    type: 'json',
    complete: function(data){
      build_UserStats(data.responseJSON);
    }
  });
}