function modalClose() {
	$('#expense-modal').modal('hide');
	$('div#expense-modal').remove();
	$('body').removeClass('modal-open');
	$('div.modal-backdrop').remove();
}