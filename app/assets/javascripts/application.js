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
//= require jquery_ujs
//= require rails-ujs
//= require toastr
//= require_tree . 
//= require sweetalert2



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
        title: 'Terminaste el proceso',
        text: "¿deseas continuar?",
        type: 'warning',
        showCancelButton: true,
        showConfirmButton: false,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#7D8',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'ok'
    })
}

function finalizado() {
    swal({
        title: 'Terminaste el proceso',
        text: "Bienvenido a Carvajal",
        type: 'info',
        showCancelButton: true,
        showConfirmButton: false,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#7D8',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'cerrar'
    })
}

$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);

     $.post({
       type: link.data('method'),
        url: link.attr('href')
    }).done(function (data) {
         location.href= ("/");
    });

}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  swal({
    title: message,
    type: 'warning',
    confirmButtonText: 'Sí',
    confirmButtonColor: '#85FD7F',
    cancelButtonText: 'No',
    showCancelButton: true
  }).then(function(e){
  	if(e.value){
    $.rails.confirmed(link);
	}
  });
};

