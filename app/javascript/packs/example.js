import "jquery-validation"
$(document).ready(function() {
 $("#new_employee").validate({
    rules:{
            'employee[password]':{
                maxlength: 10,
                minlength: 6,
              }
            }
 });
});