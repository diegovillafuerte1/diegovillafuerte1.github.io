# Use nginx to serve static content
FROM nginx:alpine
COPY . /usr/share/nginx/html

