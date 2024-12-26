const express = require('express');
const app = express();

// Set the port for the server
const PORT = process.env.PORT || 5000;

// Define routes for different pages
app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Homepage</title>
      </head>
      <body style="background-color: #e0f7fa; color: #00796b;">
        <h1>Welcome to the Homepage!</h1>
        <p>This is the main page of the website.</p>
      </body>
    </html>
  `);
});

app.get('/home', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Home Page</title>
      </head>
      <body style="background-color: #c8e6c9; color: #388e3c;">
        <h1>Home Page</h1>
        <p>Welcome to the home page.</p>
      </body>
    </html>
  `);
});

app.get('/about', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>About Us</title>
      </head>
      <body style="background-color: #fff3e0; color: #f57c00;">
        <h1>About Us</h1>
        <p>This is the About Us page.</p>
      </body>
    </html>
  `);
});

app.get('/contact', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Contact Us</title>
      </head>
      <body style="background-color: #ffebee; color: #d32f2f;">
        <h1>Contact Us</h1>
        <p>This is the contact page.</p>
      </body>
    </html>
  `);
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
