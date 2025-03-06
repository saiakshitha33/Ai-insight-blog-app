# AI Insight Blog Platform

## Introduction
The **AI Insight Blog** is a dynamic platform built with **Ruby on Rails**, designed to share articles and insights in the field of artificial intelligence. This web application leverages modern web technologies such as HTML, CSS, JavaScript (with libraries like Dojo and jQuery), and is containerized using Docker for easy deployment and scalability. Nginx is used as the web server.

## Features
- **Dynamic Article Feed:** Leveraging Rails’ Active Record to manage database interactions, articles are dynamically loaded based on user preferences.
- **Interactive Comment System:** Utilizes Rails’ Action Cable for real-time web socket communication.
- **Personalized Dashboards:** Rails views provide customizable user and author dashboards with profile management and article submission features.
- **Responsive Design:** Front-end layout and styling with CSS, enhanced for interactivity with JavaScript libraries like Dojo and jQuery.

## Technologies Used
- **Frontend:** HTML, CSS (Sass), JavaScript (Dojo, jQuery)
- **Backend:** Ruby on Rails
- **Database:** PostgreSQL
- **Web Server:** Nginx
- **Containerization:** Docker

## Prerequisites
Before you begin, ensure you have installed:
- Docker
- Docker Compose
- Ruby 2.7+
- Rails 6.0+
- Node.js 12.0+

## Local Development Setup
1. **Clone the repository:**
git clone https://github.com/yourusername/ai-insight-blog.git cd ai-insight-blog

markdown
Copy
2. **Build the Docker environment:**
docker-compose build

markdown
Copy
3. **Start the services:**
docker-compose up

markdown
Copy
4. **Create and migrate the database:**
docker-compose run web rake db:create db:migrate

markdown
Copy
5. **Visit the application in your browser:**
http://localhost:3000

nginx
Copy

## Deployment
This application is configured for deployment using Nginx and Docker. Below is a brief overview of the necessary Nginx configuration for production:

```nginx
server {
 listen 80;
 server_name yourdomain.com;

 location / {
     proxy_pass http://your_docker_container;
     proxy_set_header Host $host;
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_set_header X-Forwarded-Proto $scheme;
 }
}
