const http = require('http');
const server = require('./index'); // Your server implementation

const port = process.env.PORT || 3000;
const url = `http://localhost:${port}`;

const expectedMessage = 'Hello Node!\n';

const app = server.listen(port);

http.get(url, (res) => {
  let data = '';

  res.on('data', (chunk) => {
    data += chunk;
  });

  res.on('end', () => {
    if (data === expectedMessage) {
      console.log('Test passed: Server responded with the expected message.');
      app.close();
      process.exit(0); // Exit with a success status code (0)
    } else {
      console.error('Test failed: Server response did not match expected message.');
      app.close();
      process.exit(1); // Exit with a failure status code (non-zero)
    }
  });
}).on('error', (err) => {
  console.error('Test failed: Error making request to server:', err);
  app.close();
  process.exit(1); // Exit with a failure status code (non-zero)
});