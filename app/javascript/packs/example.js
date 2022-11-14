import "jquery-validation"
$(document).ready(function() {
 $("#new_employee").validate({
    rules:{
            'password':{
                max: 10,
                min: 6,
                required: true
              }
            }
 });
});