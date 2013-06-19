$(document).ready(function(){
  var button = $('#netid_form');
  var netid;
  var result_field = $('div#result');

  button.on('click',function(){
    turn_loading_on_for_button();
    console.log('hi');
    netid = $('#netid').val();
    console.log(netid);
    get_netid();
  });


  var get_netid = function() {
    $.getJSON(netid, function(data) {
      var fields = [];
      $.each(data, function(k,v){
        fields.push('<li id="' + k + '">' + k + ': ' + v + '</li>');
      });
      update_results(fields.join(''));
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

