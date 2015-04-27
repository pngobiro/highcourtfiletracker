# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#batch_casefile_ids').chosen()
jQuery ->
  $('#batches').dataTable
    sPaginationType: "full_numbers"
    bjQueryUI:true
    "aaSorting": [ ] // Prevents initial sorting
