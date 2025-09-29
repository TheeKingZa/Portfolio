#!/bin/bash
# Script to create a starter portfolio project structure

# Project folder name
PROJECT_NAME="my-portfolio"

# Create project directory
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME || exit

# Create folders for assets
mkdir -p assets/css assets/js assets/images

# Create HTML file
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Portfolio of Pule Mathikha">
    <meta name="keywords" content="Portfolio, Web Developer, HTML, CSS, JavaScript">
    <meta name="author" content="Pule Mathikha">
    <title>Pule Mathikha | Portfolio</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/script.js" defer></script>
</head>
<body>
    <header>
        <h1>Pule Mathikha</h1>
        <nav>
            <a href="#about">About</a>
            <a href="#projects">Projects</a>
            <a href="#contact">Contact</a>
        </nav>
    </header>

    <section id="about">
        <h2>About Me</h2>
        <p>Short bio about yourself...</p>
    </section>

    <section id="projects">
        <h2>Projects</h2>
        <div class="project-grid">
            <!-- Project cards go here -->
        </div>
    </section>

    <section id="contact">
        <h2>Contact</h2>
        <p>Email: youremail@example.com</p>
    </section>

    <footer>
        <p>&copy; $(date +%Y) Pule Mathikha. All rights reserved.</p>
    </footer>
</body>
</html>
EOL

# Create CSS file
cat <<EOL > assets/css/style.css
:root {
    --primary: #ff9800;
    --bg: #121212;
    --text: #ffffff;
}

body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
}

header, footer {
    padding: 1em;
    text-align: center;
}

nav a {
    margin: 0 10px;
    color: var(--primary);
    text-decoration: none;
}
EOL

# Create JS file
cat <<EOL > assets/js/script.js
// Lazy load images
const imgs = document.querySelectorAll("img[data-src]");
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.src = entry.target.dataset.src;
      observer.unobserve(entry.target);
    }
  });
});
imgs.forEach(img => observer.observe(img));

console.log("Portfolio loaded successfully!");
EOL

# Create README file
cat <<EOL > README.md
# My Portfolio

This is my personal portfolio website built with HTML, CSS, and JavaScript.
It is optimized for performance and hosted on GitHub Pages.

## Structure
- \`index.html\` — main HTML file
- \`assets/css/style.css\` — styles
- \`assets/js/script.js\` — JavaScript functionality
- \`assets/images/\` — images folder
EOL

# Make script executable message
echo "✅ Portfolio starter files created in '$PROJECT_NAME' folder!"
