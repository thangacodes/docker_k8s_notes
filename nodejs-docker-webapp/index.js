const express = require('express');
const app = express();
const port = 5000;

app.get('/', (req, res) => {
  // Serve the HTML with inline CSS for green background
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Simple WebApp </title>
        <style>
          // body {
          //   background-color: #28a745; /* Green background */
          //   color: white; /* White text color */
          //   font-family: Arial, sans-serif;
          //   text-align: center;
          //   padding: 20px;
          // }
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
          .blue-title {
            color: blue; /* Blue color for the text */
            font-weight: bold;
          }
          h2 {
            font-size: 2em;
          }
          .orange-title {
            color: orange; /* Orange color for the text */
            font-weight: bold;
          }
        </style>
      </head>
      <body>
        <h1>This is a simple web app created with JavaScript!!</h1>
        <p><span class="blue-title"> This is version-3 of the Application Build.</span></p>
        <br>
        <p1><span class="orange-title"> This WebApp is created using Docker images.</span></p>
        <p1> This was created by Thangadurai Murugan (Open Source Enthusiast). </p1>
      </body>
    </html>
  `);
});

app.listen(port, () => {
  console.log(`App listening at https://localhost:${port}`);
});
