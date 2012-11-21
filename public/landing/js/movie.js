/* globals */
var ff = '\"Helvetica Neue\", Helvetica, Arial, sans-serif';
var tfc = '#333';

var bullshit = new Group()
	.attr({
		x: 98
	});

var idietBackground = new Star(585, 250, 250, 5)
	.attr({
		fillColor: 'orange'
	})
	.animate('5s', { rotation: Math.PI*2 }, { repeat: 9001 })
	.addTo(bullshit);

var grats = new Text('CONGRATULATIONS!')
	.attr({
		x: 80,
		y: 80,
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	})
	.addTo(bullshit);
var visitor = new Text('You are our 999.999th visitor!!1')
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
		x: 40,
		y: 300,
		fontFamily: ff,
		fontSize: '80px',
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

var silly = new Text('Just kidding.')
	.attr({
		x: 100,
		y: -200,
		fontFamily: ff,
		fontSize: '100px',
		textFillColor: tfc
	});

var free = new Group()
	.attr({
		x: 1366,
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

var row = new Group()
	.attr({
		x: 1366
	});

var image = new Bitmap('wegithubnow.png').on('load', function() {
	this.attr({
		x: 98,
		y: -25
	})
	this.addTo(row);
});

var span = 700;
var header = new Text("Free forever, open-source.")
	.attr({
		x: span,
		y: 90,
		fontFamily: ff,
		fontSize: '39px',
		textFillColor: tfc,
		selectable: true,
		textStrokeWidth: 2
	})
	.addTo(row);

var p = 159, fs2 = 40, fs2px = '25px';
new Text('DOUGHNUT doesn\'t annoy you with banners or')
	.attr({
		x: span,
		y: p,
		fontFamily: ff,
		fontSize: fs2px,
		textFillColor: tfc,
		selectable: true
	})
	.addTo(row);
new Text('popups. It\'s completely free, always will be, and')
	.attr({
		x: span,
		y: p + fs2,
		fontFamily: ff,
		fontSize: fs2px,
		textFillColor: tfc,
		selectable: true
	})
	.addTo(row);
new Text('the entire application source code is publicly')
	.attr({
		x: span,
		y: p + fs2 * 2,
		fontFamily: ff,
		fontSize: fs2px,
		textFillColor: tfc,
		selectable: true
	})
	.addTo(row);
new Text('available on Github.')
	.attr({
		x: span,
		y: p + fs2 * 3,
		fontFamily: ff,
		fontSize: fs2px,
		textFillColor: tfc,
		selectable: true
	})
	.addTo(row);

row.addTo(stage);

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
		y: 200
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
		easing: 'backOut',
onEnd: function() {
	ad.animate('500ms', {
		x: -1170
	}, {
		easing: 'backIn',
		delay: '1s'
	});
	frei.animate('500ms', {
		x: -1170
	}, {
		easing: 'backIn',
		delay: '1s'
	});
	row.animate('1s', {
		x: 0
	}, {
		easing: 'backOut',
		delay: '1400ms'
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
	});
}
	});
}
	}
	);
});
