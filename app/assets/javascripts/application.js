// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.purr
//= require 'best_in_place'
//= require_tree .

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

jQuery(function($){
  $.datepicker.regional['ca'] = {
    closeText: 'Tancar',
    prevText: '&#x3c;Ant',
    nextText: 'Seg&#x3e;',
    currentText: 'Avui',
    monthNames: ['Gener','Febrer','Mar&ccedil;','Abril','Maig','Juny',
    'Juliol','Agost','Setembre','Octubre','Novembre','Desembre'],
    monthNamesShort: ['Gen','Feb','Mar','Abr','Mai','Jun',
    'Jul','Ago','Set','Oct','Nov','Des'],
    dayNames: ['Diumenge','Dilluns','Dimarts','Dimecres','Dijous','Divendres','Dissabte'],
    dayNamesShort: ['Dug','Dln','Dmt','Dmc','Djs','Dvn','Dsb'],
    dayNamesMin: ['Dg','Dl','Dt','Dc','Dj','Dv','Ds'],
    weekHeader: 'Sm',
    dateFormat: 'dd-mm-yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''};
  $.datepicker.setDefaults($.datepicker.regional['ca']);
});