var youWon = new Text('CONGRATULATIONS!')
	.attr({
		
	});

var silly = new Text('Don\'t be silly.')
	.attr({
		y: -200,
		fontFamily: '\"Helvetica Neue\", Helvetica, Arial, sans-serif',
		fontSize: '150px',
		textFillColor: '#333'
	});
	
var free = new Text("DOUGHNUT is free.")
	.attr({
		x: 1170,
		y: 150,
		width: 1170,
		fontFamily: '\"Helvetica Neue\", Helvetica, Arial, sans-serif',
		fontSize: '100px',
		textFillColor: '#333'
	});

stage.on('click', function(e) {	
	silly.addTo(stage);
	silly.animate('1s', {
		y: 150
	}, {
		easing: 'elasticOut',
		delay: '200ms',
onEnd: function() {
	free.addTo(stage);
	silly.animate('300ms', {
		x: -1170
	}, {
		easing: 'backIn',
		delay: '500ms'
	});
	free.animate('500ms', {
		x: 100
	}, {
		easing: 'backOut',
		delay: '800ms',
	});
}
	}
	);
	// textContainer.animate('1s', {
	// 	y: 100
	// }, {
	// 	easing: 'elasticOut',
	// 	delay: '200ms'
	// }, {
	// onEnd: function() {
	// textContainer.animate('2s', { y: 300 })
	// }
	// });
});
