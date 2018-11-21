// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require toastr
//= require_tree .

    toastr.options = {
  "debug": false,
  "positionClass": "toast-bottom-left",
  "onclick": null,
  "fadeIn": 300,
  "fadeOut": 1000,
  "timeOut": 1000,
  "extendedTimeOut": 300
}

function mostrar() {
    swal({
        title: 'Todos en la escuela saben que',
        text: "javi se la traga",
        type: 'warning',
        showCancelButton: true,
        showConfirmButton: false,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'holi'
    })
}