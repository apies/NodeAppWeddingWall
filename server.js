// Generated by CoffeeScript 1.4.0
var app, port, io, server;

var CoffeeScript = require('coffee-script'); // make sure that coffee-script version is >= 1.5.0

var assets = require('connect-assets')({
  jsCompilers: {
    litcoffee: {
      match: /\.js$/,
      compileSync: function (sourcePath, source) {
        return CoffeeScript.compile(source, { filename: sourcePath, literate: true });
      }
    }
  }
});

app = require('./.app');

port = app.port;


//In the long run putting the socket part of the application in this file
//is not a good idea

server = app.listen(port, function() {
  // console.log("now starting in environment: " + process.env);
  return console.log("Listening on " + port + "\nPress CTRL-C to stop server.");
});

io = require('socket.io').listen(server);

io.sockets.on('connection', function  (socket) {
  socket.emit('message', {message: 'welcome to chat'});
  socket.on('send', function (data) {
    io.sockets.emit('message', data);
    // body...
  });
});
