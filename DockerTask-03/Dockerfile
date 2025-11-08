# Use the official NGINX base image 
FROM nginx:latest 

# Set working directory 
WORKDIR /usr/share/nginx/html 

# Copy the web application files to the container 
COPY index.html .

# Expose port 80 for web access 
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
