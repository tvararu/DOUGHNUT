var textContainer = new Group()
	.attr({
		y: -200
	});;

var txt = new Text('Silly rabbit.').addTo(textContainer)
	.attr({
		fontFamily: '\"Helvetica Neue\", Helvetica, Arial, sans-serif',
		fontSize: '200px',
		textFillColor: '#333'
	});

stage.on('click', function(e) {	
	textContainer.addTo(stage);
	// new KeyframeAnimation('1s', {
	//    '0s' : { x: 0, y: 0 },
	//   '.5s' : { x: 50, y: 50 },
	//    '1s' : { x: 150, y: 100 }
	// });
	textContainer.animate('1s', {
		y: 100
	}, {
		easing: 'elasticOut',
		delay: '200ms'
	});
});
