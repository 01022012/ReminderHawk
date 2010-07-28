function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
        });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});


var ReminderHawk = {
        addPhoneNumber: function(link) {
         var num_phones = $(".phone_num").size();
         $(link).parent().before('<p><input type="text" class="phone_num" size="30" name="event[phone_numbers_attributes]['+num_phones+'][number]" id="event_phone_numbers_attributes_'+num_phones+'_number"></p>');
        },

        addReminder: function(link) {
         var num_reminders = $(".duration").size();
         num_reminders = num_reminders + 1;
         $(link).parent().before('<p><input class="duration" id="event_reminders_attributes_'+num_reminders+'_duration" name="event[reminders_attributes]['+num_reminders+'][duration]" size="10" value="3" type="text">  <select id="event_reminders_attributes_'+num_reminders+'_unit" name="event[reminders_attributes]['+num_reminders+'][unit]"><option value="0">Minutes</option><option value="1" selected="selected">Hours</option><option value="2">Days</option></select></p>');
        }
}
