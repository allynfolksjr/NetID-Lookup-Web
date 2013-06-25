$(document).ready(function(){
  var form_field = $('#netid');
  var button = $('#netid_form');
  var netid;
  var result_field = $('div#result');

  button.on('click',function(){
    make_request_process();
  });

  form_field.keydown(function(k){
    if (k.keyCode === 13) {
      make_request_process();
    }
  });

  var make_request_process = function() {
    turn_loading_on_for_button();
    netid = form_field.val();
    console.log(netid);
    get_netid();
  }

  var get_netid = function() {
    $.get(netid + "?embed=true", function(data) {
      update_results(data);
      turn_loading_off_for_button();
    });
  }

  var update_results = function(html) {
    result_field.html(html);
  }

  var handle_ajax_error = function(error) {
    update_results("This request failed. We don't know more than that.")
  }

  var turn_loading_on_for_button = function() {
    console.log ('on!');
    button.attr('data-loading-text', "Loading...");
    button.toggleClass('disabled');
    button.attr('disabled', 'disabled');
  }

  var turn_loading_off_for_button =  function() {
    console.log('off!');
    button.removeAttr('data-loading-text', "Loading...");
    button.toggleClass('disabled');
    button.removeAttr('disabled', 'disabled');
  }
});

