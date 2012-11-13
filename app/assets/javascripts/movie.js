/* globals */
var ff = '\"Helvetica Neue\", Helvetica, Arial, sans-serif';
var tfc = '#333';

var bullshit = new Group();
var grats = new Text('CONGRATULATIONS!')
	.attr({
		x: 80,
		y: 80,
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	})
	.addTo(bullshit);
var visitor = new Text('You are our 999.999 visitor!!1')
	.attr({
		x: 240,
		y: 200,
		fontFamily: ff,
		fontSize: '50px',
		textFillColor: tfc
	})
	.addTo(bullshit);
var clickHere = new Text('CLICK HERE TO CLAIM YOUR')
	.attr({
		x: 240,
		y: 300,
		fontFamily: ff,
		fontSize: '50px',
		textFillColor: tfc
	})
	.addTo(bullshit);
var claim = new Text ('FREE 12 MONTH DOUGHNUT™®© PREMIUM ACCOUNT!')
	.attr({
		x: 60,
		y: 400,
		fontFamily: ff,
		fontSize: '40px',
		textFillColor: tfc
	})
	.addTo(bullshit);
bullshit.addTo(stage);

var silly = new Text('Don\'t be silly.')
	.attr({
		x: 100,
		y: -200,
		fontFamily: ff,
		fontSize: '150px',
		textFillColor: tfc
	});

var free = new Group()
	.attr({
		x: 1170,
		y: 200
	});
	
var DNis = new Text('DOUGHNUT is')
	.attr({
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	})
	.addTo(free);

var frei = new Text('free')
	.attr({
		x: 700,
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	})
	.addTo(free);

var beerNuts = new Group()
	.attr({
		x: 300,
		y: 500
	});

var beer = new Text('as in free beer')
	.attr({
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	})
	.addTo(beerNuts);

var beer = new Text('(or free doughnuts!)')
	.attr({
		x: 100,
		y: 100,
		fontFamily: ff,
		fontSize: '50px',
		textFillColor: '#AAA'
	})
	.addTo(beerNuts);

beerNuts.addTo(stage);

var speech = new Text('as in free speech')
	.attr({
		x: 300,
		y: 500,
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	})
	.addTo(stage);

var ad = new Text('and ad-')
	.attr({
		x: 300,
		y: 500,
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	})
	.addTo(stage);

var played = false;
stage.on('click', function(e) {	
	if (played)
		return;
	
	played = true; // prevent playing the same animation multiple times
	
	bullshit.animate('300ms', {
		y: 500
	}, {
		easing: 'backIn'
	});
	silly.addTo(stage);
	silly.animate('1s', {
		y: 150
	}, {
		easing: 'elasticOut',
		delay: '500ms',
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
onEnd: function() {
	DNis.animate('700ms', {
		x: -500
	}, {
		easing: 'backIn',
		delay: '1s'
	});
	free.animate('1s', {
		x: -600
	}, {
		easing: 'backInOut',
		delay: '1s',
onEnd: function() {
	beerNuts.animate('500ms', {
		x: 300,
		y: 200
	}, {
		easing: 'backOut',
		delay: '350ms',
onEnd: function() {
	beerNuts.animate('500ms', {
		y: -500
	}, {
		easing: 'backIn',
		delay: '1s',
onEnd: function() {
	speech.animate('500ms', {
		x: 300,
		y: 200
	}, {
		easing: 'backOut',
onEnd: function() {
	speech.animate('500ms', {
		y: -500
	}, {
		easing: 'backIn',
		delay: '1s',
onEnd: function() {
	frei.animate('1s', {
		x: 1250
	}, {
		easing: 'backInOut',
onEnd: function() {
	ad.animate('500ms', {
		y: 200
	}, {
		easing: 'backOut'
	})
}
	});
}
	});
}
	});
}
	});
}
	});
}
	});
}
	});
}
	}
	);
});
