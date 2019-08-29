var url;
$(document).on("click", 'a[data-remote=true]', function(e) {
  url = $(this).attr('href');
  history.pushState(null, '', url);
});

