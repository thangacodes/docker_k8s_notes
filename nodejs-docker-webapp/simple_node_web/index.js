const express = require('express');
const path = require('path');
const app = express();
const port = 5000;

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Home route
app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Try DevOps</title>
        <style>
          body {
            background-color: #87CEEB; /* Sky blue background */
            color: white; /* White text color */
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
          }
          h1 {
            font-size: 2em;
          }
          .green-title {
            color: green; /* Green color for the text */
            font-weight: bold;
          }
          h2 {
            font-size: 2em;
          }
          .black-title {
            color: black; /* Black color for the text */
            font-weight: bold;
          }
        </style>
      </head>
      <body>
        <h1 style="color: black;">This is a simple WebApp created with JavaScript!!</h1>
        <img src="/images/try-devops.jpeg" alt="Try DevOps" />
        <p><span class="green-title">This is version-3 of the Application Build.</span></p>
        <br>
        <p><span class="black-title">This WebApp is running on a Docker Container (Dockerized).</span></p>
        <p><span class="black-title">This was created by Thangadurai Murugan (Open Source Enthusiast)</span></p>
      </body>
    </html>
  `);
});

// Start the server
app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});