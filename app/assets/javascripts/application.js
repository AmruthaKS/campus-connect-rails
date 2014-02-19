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

$(function() {
	var collegeList = $("#user_college_college").autocomplete({
		change : function() {
			alert('changed');
		}
	});
});

$(document).ready(function() {

    $('#post_user_name').autocomplete({source: "/ajax/users"}).data("autocomplete")._renderItem = function( ul, item ) {
        var inner_html = '<a href = ' + item.link +'><div class="list_item_container"><div class="image"><img src="' + item.image + '" height="20", width="20"></div><div class="label">' + item.label + '</div></div></a>';
        return $( "<li></li>" )
            .data( "item.autocomplete", item )
            .append(inner_html)
            .appendTo( ul );
    };

	$('#ui-id-1').click(function() {
		auto_fetch_depts();
	});

	$('#dept_field').change(function() {
		remove_all_options('#user_college_group_id');
		
		$.get("/departments/auto_fetch_groups", {
			dept_id : $('#user_college_department_id').val()
		}, function(data) {
		}, "script");

		$('#group_field').show();
	});
	
	$('#user_college_college').onEnter(function() {
		auto_fetch_depts();
	});
	
	$('#user_college_college').bind('input', function() {
		$('#user_college_submit').attr('disabled','disabled');
   		remove_all_options('#user_college_department_id');
   		remove_all_options('#user_college_group_id');
	} );

    $('textarea.comment_text').pressEnter(function(){
       // $(this).closest("form").trigger('submit.rails')
        $.post("/comments.js", $(this).closest("form").serialize());
    });

    $('#notifications-section').click(function(){
        $.ajax({
            type: 'POST',
            url: "/notifications_check.js",
            context: document.body,
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
        }).done(function() {
            });
    });
});

jQuery.fn.onEnter = function(callback) {
	this.keyup(function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			if ( typeof callback == 'function')
				callback.apply(this);
		}
	});
	return this;
}
function auto_fetch_depts() {
	remove_all_options('#user_college_department_id');
	if ($('#user_college_college').val() != null && $('#user_college_college').val() != "no existing match"){
		$.get("/colleges/auto_fetch_departments", {
			college_name : $('#user_college_college').val()
		}, function(data) {
		}, "script");
	}
	$('#dept_field').show();
}

function remove_all_options(element){
	$(element)
    	.empty();
}

jQuery.fn.pressEnter = function(fn) {
    return this.each(function() {
        $(this).bind('enterPress', fn);
        $(this).keyup(function(e){
            if(e.keyCode == 13)
            {
                $(this).trigger("enterPress");
            }
        })
    });
};