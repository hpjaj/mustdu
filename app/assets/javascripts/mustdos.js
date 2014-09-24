$(document).ready(function() {
  $('body').on('change', '.submittable', function() { 
    $(this).parents('form:first').submit();
  });  
});


//.live('change', function() {
  // $(this).parents('form:first').submit();
//});
