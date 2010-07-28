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
/*
        function remove_fields(link) {  
            $(link).prev("input[type=hidden]").val("1");  
            $(link).closest(".fields").hide();  
        }  
          
        function add_fields(link, association, content) {  
            var new_id = new Date().getTime();  
            var regexp = new RegExp("new_" + association, "g");  
            $(link).parent().before(content.replace(regexp, new_id));  
        }  
*/
        addPhoneNumber: function(link) {
         var num_phones = $(".phone_num").size();
         $(link).parent().before('<p><input type="text" class="phone_num" size="30" name="event[phone_numbers_attributes]['+num_phones+'][number]" id="event_phone_numbers_attributes_'+num_phones+'_number"></p>');
        }
}
