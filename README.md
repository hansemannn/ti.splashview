# Ti.SplashView

[![Contact](http://hans-knoechel.de/shields/shield-twitter.svg)](http://twitter.com/hansemannnn)

Support for the Twitter-like splash-screen library [`CBZSplashView`](https://github.com/callumboddy/CBZSplashView) in Titanium. Thanks to @callumboddy for that awesome library!

<img src="./twitter-gif.gif" height="500" alt="Twitter Example" />

### Example
```js
var Splash = require('ti.splashview');

var win = Ti.UI.createWindow({
    backgroundColor: 'yellow'
});

var splashView = Splash.createSplashView({
    image: "appc-logo.png",
    fillColor: "blue"
});

win.addEventListener('focus', function() {
    setTimeout(function() {
        splashView.startAnimation();
    },1000);
});

win.add(splashView);
win.open();
```

### Author
Hans Knoechel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

### License
Apache 2.0

### Contributing
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/hansemannn/ti.splashview/pull/new/master)!
