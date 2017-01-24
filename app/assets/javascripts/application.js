// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require vendor/iCheck/icheck
//= require select2
// require_tree .

$(function() {
    var todoFormSelect = $(".todo-form select").select2({
        minimumResultsForSearch: Infinity,
        placeholder: "Select a project"
    });
    var modalOverlay = $("#modal-overlay");
    var projectListForm = $('.project__todos .project__todos__item form');
    var projectList = $('.project__todos .project__todos__item input[type="checkbox"]');
    var todoForm = $('.todo-form');
    var todoSubmitLink = $('.todo-form a.todo-form__submit');
    var todoCancelLink = $('.todo-form a.todo-form__cancel');
    var todoToggleLink = $('.navbar-header a.todo-add');

    todoSubmitLink.click(submitTodoForm);
    todoToggleLink.click(toggleTodoForm);
    todoCancelLink.click(toggleTodoForm);

    projectList.iCheck({
        handle: 'checkbox',
        checkboxClass: 'icheckbox_square-blue',
    });

    projectList.on('ifClicked', updateTodoItem);

    function toggleTodoForm(e) {
        e.preventDefault();
        todoForm.toggleClass('invisible');
        modalOverlay.toggleClass('invisible');
        todoForm.find('.invisible').removeClass();
    }

    function submitTodoForm(e) {
        e.preventDefault();
        $(e.target).closest('form').submit();
    }

    function updateTodoItem(e) {
        $(this).iCheck('toggle');

        var checked = $(this).prop('checked');
        var label = $(this).parent().next();
        var strikeClass = 'line-through';

        checked ? label.addClass(strikeClass) : label.removeClass(strikeClass);
        submitTodoForm(e);
    }

});
