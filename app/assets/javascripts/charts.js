function capString(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function charts() {

	a = $('div#expenses-chart').attr('data-expenses').slice(0, -1).substring(1).split("\},\{");
	b = a[0].split(",\"");
	r = [];
	p = [];
	c = b[2].split("\":",1);
	for(var i=1; i <= b.length-1; i++) {
		c = b[i].split("\":",1);
		
		r.push(c[0]);
	}
	for(var i=0; i <= r.length-1; i++) {
		p[i] = capString(r[i]);
	}


	new Morris.Bar({
		// ID of the element in which to draw the chart.
		element: 'expenses-chart',
		// Chart data records -- each entry in this array corresponds to a point on
		// the chart.
		data: $('#expenses-chart').data('expenses'),
		// The name of the data record attribute that contains x-values.
		xkey: 'x',
		// A list of names of data record attributes that contain y-values.
		ykeys: r,

		// ykeys: [ 'purchase', 'withdrawal', 'transfer', 'payment', 'check', 'credit_card1', 'credit_card2', 'credit_card3' ],
		// Labels for the ykeys -- will be displayed when you hover over the
		// chart.
		labels: p,
		// labels: [ 'Purchase', 'Withdrawal', 'Transfer', 'Payment', 'Check', 'Credit card 1', 'Credit card 2', 'Credit card 3' ],

		hideHover: true,

		stacked: true
	});
	

	new Morris.Bar({
		// ID of the element in which to draw the chart.
		element: 'daily-expenses-chart',
		// Chart data records -- each entry in this array corresponds to a point on
		// the chart.
		data: $('#daily-expenses-chart').data('expenses'),
		// The name of the data record attribute that contains x-values.
		xkey: 'x',
		// A list of names of data record attributes that contain y-values.
		ykeys: r,
		// Labels for the ykeys -- will be displayed when you hover over the
		// chart.
		labels: p,
		stacked: true
	});

	new Morris.Donut({
		// ID of the element in which to draw the chart.
		element: 'category-chart',
		// Chart data records -- each entry in this array corresponds to a point on
		// the chart.
		data: $('#category-chart').data('expenses')
	});

	new Morris.Area({
		// ID of the element in which to draw the chart.
		element: 'month-acc',
		// Chart data records -- each entry in this array corresponds to a point on
		// the chart.
		data: $('#month-acc').data('expenses'),
		// The name of the data record attribute that contains x-values.
		xkey: 'x',
		// A list of names of data record attributes that contain y-values.
		ykeys: ['actual', 'last'],
		// Labels for the ykeys -- will be displayed when you hover over the
		// chart.
		labels: ['Actual', 'Last'],

		fillOpacity: 0.6,

		behaveLikeLine: true,
		
		parseTime: false
	});

}
