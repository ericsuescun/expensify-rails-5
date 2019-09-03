function charts() {
	console.log('Printing charts!');
	new Morris.Bar({
	  // ID of the element in which to draw the chart.
	  element: 'expenses-chart',
	  // Chart data records -- each entry in this array corresponds to a point on
	  // the chart.
	  data: $('#expenses-chart').data('expenses'),
	  // The name of the data record attribute that contains x-values.
	  xkey: 'x',
	  // A list of names of data record attributes that contain y-values.
	  ykeys: ['purchase', 'withdrawal'],
	  // Labels for the ykeys -- will be displayed when you hover over the
	  // chart.
	  labels: ['Expense'],

	  stacked: true
	});
}
