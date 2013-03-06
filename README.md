# HTML5 Hacks and Highlights - presentation at opensourcedays 2013

http://opensourcedays.org/2013/content/html5-hacks-and-highlights


Slide composition as markdown in progress below.

# Intro
.


## Objectives of this talk

- HTML5 as a platform
- Tour of the API
- Tools
- The underlying machine

# The platform

- Browsers, Mobile, Desktop, Server
- JavaScript as "machinecode"

## The Engines

- Webkit - 50% - v8/JavaScriptCore - Chrome, future Opera, node.js, CouchBase, ... / Safari, Qt, ...
- Gecko - 20% - SpiderMonkey - Mozilla Firefox, Adobe Acrobat, CouchDB, MongoDB, Riak, ...
- Trident - 25% - Chakra - Internet Explorer

https://en.wikipedia.org/wiki/File:Web_browser_by_country.svg

### Performance - under the hood

## Web

- Web apps
- HTML5 offline apps
- Browser apps
- Browser add-ons

### HTML5 app marketplaces

- The Web :)
- Chrome Web Store
- Facebook App Center
- Mozilla Apps Marketplace

### Browser addons

- Chrome Extensions
    - zipped 
    - html-pages
- Firefox Add-ons 
    - pure JavaScript add-ons via JetPack
    - github:mozilla/addon-sdk
    - commonjs-modules
    - mobile-firefox support
- structure
    - add-on scripts / "background page", "UI page"
    - content-scripts 

## Mobile

- Web apps
    - mobile-meta-tags: viewport, icon, apple-touch-start-up-image apple-mobile-web-app-capable...
- Apache Cordova / PhoneGap

## Desktop

## Server

- phantomjs - headless webkit
- node.js - modules: jsdom, canvas, localstorage, XMLHttpRequest, webgl, ...
- javascript sans html5-apis
    - mongodb, riak, couchdb, couchbase, ...
    - node.js, ringojs, Qt, ...
    - v8, spidermonkey, rhino, nashorn, ...

# HTML5 APIs
- 5.0 currently candidate recommendation, to be recommendation in 2014
- 5.1 candidate recommendation in 2015

https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/HTML5-APIs-and-related-technologies-by-Sergey-Mavrody.png/1280px-HTML5-APIs-and-related-technologies-by-Sergey-Mavrody.png

## Network (websockets)

- websockets
- webrtc
- protocol handle
- XHR improvements
    - cross-origin resource sharing
    - binary data

## Media (audio/video)

- audio playback 
- webaudio
- video playback
- subtitles
- media-capture -getUserMedia/Stream API - firefox/chrome/opera

## 2d/3d-graphics (canvas/webgl)

- canvas 2d
- webgl (Khronos, not w3c), based on OpenGL ES 2.0, Firefox, Chrome, disabled in Safari by default
- svg (not android 2)

## Process/IPC (webworkers, web messaging)

- webworkers
- cross-document messaging
- ¿is it same communication?

## Storage/file/database (fileapi/indexeddb/localstorage)

- localstorage
- websql/indexeddb
- fileapi

## Microdata

- semantic web
- linked data
- html support for inline linked data 

## Deployment (cache.manifest, async script loading, history)

- offline apps
- asynchronous script loading
- history api

## User Interface (css3/...)

- media queries
- drag'n'drop
- contenteditable
- mathml
- CSS3: border-radius, drop-shadow, animation, ...
- fonts
- touch-events, device orientation (angle of device in space)
- fullscreen-api

## Other

- geolocation
- typed arrays


# Packaging
JavaScript-engines, mobile-webkit, PhoneGap, mobile/desktop/server-common-target, node.js, package

## Web
offline, web-store/distribution-channels

## Mobile Apps

## Desktop Apps

## Browser Addons

## Serverside

# _Languages_

## JavaScript

- the machine-code of the web

## Java(gwt) 


* eclipse-plugin - should be easy for eclipse users

1) get/extract http://google-web-toolkit.googlecode.com/files/gwt-2.5.0.zip
2) ./gwt-2.5.0/webAppCreator -out OpenSourceDays com.solsort.OpenSourceDays
3) cd OpenSourceDays; ant devmode


HTML contains `<canvas id="canvas"></canvas>` and code consist of a single java-file `OpenSourceDays/src/com/solsort/client/OpenSourceDays.java`: 

    package com.solsort.client;

    import com.google.gwt.core.client.EntryPoint;
    import com.google.gwt.user.client.DOM;
    import com.google.gwt.dom.client.CanvasElement;
    import com.google.gwt.dom.client.Element;
    import com.google.gwt.canvas.dom.client.Context2d;

    public class OpenSourceDays implements EntryPoint {
      public void onModuleLoad() {
        CanvasElement canvas = (CanvasElement)
                (Element)DOM.getElementById("canvas");
        Context2d ctx = canvas.getContext2d();
        ctx.fillText("Hello HTML5 GWT", 0, 20);
      }
    }


## C(llvm) 

- Libraries such as libSDL implemented on top of HTML5 (canvas, etc.)
- LaTeX, zlib, OpenTTD, Python, Lua, Poppler, SuperTux, FreeType, SQLite, gnuplot, Cube 2: Sauerbraten, opendune, Qt, ...

1) Install llvm/clang-3.2 from http://llvm.org/releases/download.html#3.2
2) `git clone git@github.com:kripken/emscripten.git`
3) `emscripten/emcc opensourcedays.cc -o opensourcedays.html`

where `opensourcedays.cc` contains:

    #include <SDL/SDL.h>

    int main() {
      SDL_Init(SDL_INIT_VIDEO);
      SDL_Surface *screen =
          SDL_SetVideoMode(256, 256, 32, SDL_SWSURFACE);
      SDL_LockSurface(screen);
      for (int i = 0; i < 256 * 256; ++i) {
        ((Uint32*)screen->pixels)[i] = i << 8;
      }
      SDL_UnlockSurface(screen);
      SDL_Flip(screen);
    }


## CoffeeScript 

- layer of sugar on top of JavaScript
- python/ruby-like


    <!DOCTYPE HTML><html><head><title></title></head>
    <body><script type="text/coffeescript">

    document.write '<canvas id="canvas" width="1000" height="600"></canvas>'

    canvas = document.getElementById "canvas"
    ctx = canvas.getContext "2d"
    ctx.fillStyle = "#ccc"
    ctx.strokeStyle = "#000"

    drawSquare = (x,y, size) ->
        ctx.fillRect x, y, size, size
        ctx.strokeRect x, y, size, size

    for i in [0..200]
        drawSquare Math.random()*900, Math.random()*500, Math.random()*100

    </script><script src="coffee-script.js"></script></body></html>


## JavaScripts with optional typing


- tooling
- large-scale development

- TypeScript 
- superset of JavaScript
- open source, apache license
- classical oop
- optional typing
- Microsoft

- Closure Compiler
- Annotate JavaScript with special comments, still pure JavaScript
- Optimizing compiler
- Google

## Other languages

- ClojureScript
- Dart
- HaXe
- altjs.org

# _Infrastructure_
## GitHub

    https://github.com/languages (feb 2013): JavaScript 21%
    Popular starred (feb 2013): bootstrap, node, jquery, html5-boilerplate, rails, impress.js, d3, backbone, font-awesome, homebrew

## Travis

## Testling

## Meteor

