//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require cocoon
//= require social-share-button
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .
//= require fullcalendar

$('#calendar').fullCalendar({
   events: /events.json
});

