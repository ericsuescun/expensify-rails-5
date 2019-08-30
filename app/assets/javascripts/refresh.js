var url;
$(document).on("click", 'a[data-remote=true]', function(e) {
	e.preventDefault();
  	url = $(this).attr('href');
  	history.pushState(null, '', url); //La variable url esta en el contexto de los data-remote=true, NO funcionara en los de abajo porque no tiene ese contexto.
});

