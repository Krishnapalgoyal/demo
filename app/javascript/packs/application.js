
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require('sweetalert2')
import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'
import "jquery-validation"
import "sweetalert2"
import Swal from 'sweetalert2';
window.Swal = Swal;
//= require_self
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require sweetalert2
//= require sweet-alert2-rails
//=require jquery.validate
//=require jquery.validate.additional-methods
//= require_tree jquery.validate.localization


$(document).ready(function(){ 
 $('#search').select2({
   
    placeholder: "plese select name",
     multiple: true,
     scrollAfterSelect: true

  });
})


