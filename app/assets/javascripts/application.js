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
//= require_tree .

$(function () {  
  var companyList = $("#user_college_college").autocomplete({ 
      change: function() {
          alert('changed');
      }
   });
});


$(document).ready(function() {
 $('#ui-id-1').click(function() {
	//Add ajax call - to fetch the depts
	if($('#user_college_college').val() != null && $('#user_college_college').val() != "")
	$.get("/colleges/auto_fetch_departments", { college_name: $('#user_college_college').val()},
   function(data){
     alert("Data Loaded: " + data);
   }, "script");
   
 	$('#dept_field').show();
 });
});

$(document).ready(function() {
$('#dept_field').change(function() {
	$.get("/departments/auto_fetch_groups", { dept_id: $('#user_college_department').val()},
   function(data){
     alert("Data Loaded: " + data);
   }, "script");
   
   $('#group_field').show();
});
});

