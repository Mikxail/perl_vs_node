#!/usr/bin/env node

var out = "HTTP/1.1 200 Ok\n"
out += "Content-Type: text/html; charset=UTF-8\n";
out += "Connection: close\n";
out += "Content-Length: 1\n\n1";

var net = require('net');
var server = net.createServer(function(c) { //'connection' listener
  //console.log('server connected');
/*   c.on('end', function() {
    console.log('server disconnected');
  });
 */
  c.setNoDelay();
  c.write(out);
  c.end();
  //c.pipe(c);
});
server.listen(8888, function() { //'listening' listener
  console.log('server bound');
});