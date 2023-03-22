# We are using a different base image compared to the primer.
# In the primer, we used a lightweight version of Linux called Alpine Linux.
# In this container, we will use the python base container which means that
# python is already installed in the container.
FROM python:3.10-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the required files to the working directory
COPY . /app

# Expose the port for the web server
EXPOSE 9000

# Run the start.sh script to serve the website
CMD ["./start.sh"]
