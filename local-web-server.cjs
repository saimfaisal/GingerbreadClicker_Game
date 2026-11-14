const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, 'WebGL_Build');
const types = new Map([
  ['.html', 'text/html; charset=utf-8'], ['.css', 'text/css; charset=utf-8'],
  ['.js', 'application/javascript'], ['.ico', 'image/x-icon'],
  ['.png', 'image/png'], ['.wasm', 'application/wasm']
]);
const server = http.createServer((req, res) => {
  let pathname = decodeURIComponent(new URL(req.url, 'http://localhost').pathname);
  if (pathname.endsWith('/')) pathname += 'index.html';
  const file = path.resolve(root, `.${pathname}`);
  if (file !== root && !file.startsWith(root + path.sep)) {
    res.writeHead(403).end('Forbidden'); return;
  }
  fs.stat(file, (error, stat) => {
    if (error || !stat.isFile()) { res.writeHead(404).end('Not found'); return; }
    let extension = path.extname(file);
    if (file.endsWith('.wasm.unityweb')) extension = '.wasm';
    if (file.endsWith('.framework.js.unityweb')) extension = '.js';
    res.writeHead(200, { 'Content-Type': types.get(extension) || 'application/octet-stream' });
    if (req.method === 'HEAD') res.end(); else fs.createReadStream(file).pipe(res);
  });
});
server.listen(8000, '127.0.0.1', () => console.log('WebGL test server: http://localhost:8000'));
