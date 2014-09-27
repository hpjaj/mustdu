// $(document).ready(function() {
//   $('body').on('change', '.submittable', function() { 
//     $(this).parents('form:first').submit();
//   });  
// });


$(document).on('change', '.submittable', function() { 
  $(this).parents('form:first').submit();
});  

