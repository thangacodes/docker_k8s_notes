const express = require('express');
const path = require('path');
const app = express();

// Set the port for the server
const PORT = process.env.PORT || 5000;

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Define routes for different pages
app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Root page</title>
      </head>
      <body style="background-color: #c8e6c9; color: #388e3c;">
        <h1>Welcome to the RootPage!</h1>
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
        <style>
        img {
        max-width: 30%;
        max-height: 100px
        display: block;
        margin: 0 auto;
        }
        </style>
      </head>
      <body style="background-color: #c8e6c9; color: #388e3c;">
        <h1>Home Page</h1>
        <img src="/images/homepage.jpeg" alt="Team collaborating on DevOps solutions" />
        <p>Welcome to the home page of Try-devOps Corp.</p>
        <section>
        <h1>Who We Are</h1>
        <p>Your trusted partner in DevOps solutions and automation.</p>
        <p>At Try-devOps Corp, we specialize in bringing automation, efficiency, and scalability to your development and IT operations. Our DevOps solutions streamline processes, enhance collaboration, and accelerate your time to market.</p>
        </section>
        <footer>
        <p>&copy; 2024 Try-devOps Corp. All rights reserved.</p>
        </footer>
        </body>
    </html>
  `);
});

app.get('/about', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>About Us</title>
        <style>
        img {
        max-width: 30%;
        max-height: 100px
        display: block;
        margin: 0 auto;
        }
        </style>
      </head>
      <body style="background-color: #fff3e0; color: #f57c00;">
        <h1>About Us</h1>
        <img src="/images/aboutus.jpeg" alt="About US"/>
        <p>This is the About Us page.</p>
        <footer>
        <p>&copy; 2024 Try-devOps Corp. All rights reserved.</p>
        </footer>
      </body>
    </html>
  `);
});

app.get('/contact', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Contact Us</title>
        <style>
        img {
        max-width: 30%;
        max-height: 100px
        display: block;
        margin: 0 auto;
        }
        </style>
      </head>
      <body style="background-color: #ffebee; color: #d32f2f;">
        <h1>Contact Us</h1>
        <img src="/images/contactus.jpeg" alt="Contact"/>
        <p>This is the contact page.</p>
        <footer>
        <p>&copy; 2024 Try-devOps Corp. All rights reserved.</p>
        </footer>
      </body>
    </html>
  `);
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});