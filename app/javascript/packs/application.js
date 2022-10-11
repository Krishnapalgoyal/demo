
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'
// $(document).ready(function(){
//   // Turn on js-selectable class so that it becomes SELCT 2 tag
//   $('#search').select2({
//     allowClear: true,
//     width: 200
//     // If you are using Bootstrap, please add　`theme: "bootstrap"` too.
//   });
// });

$(document).ready(function(){ 
 $('#search').select2({
   
    placeholder: "plese select name",
     multiple: true,
     scrollAfterSelect: true
  });
})
