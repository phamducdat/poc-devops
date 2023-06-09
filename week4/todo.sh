#!/bin/bash

if [ "$1" == "1" ]; then
  #       Build and run the container in 1-container.
  #       Give the image a proper name (or tag) using the -t flag.
  #       Run the container in detached mode using the -d flag and give it a proper name.
  docker build -t task_1 ./1-container
  docker run -d -p 9000:9000 task_1
fi

if [ "$1" == "2" ]; then
  #       Serve static content using a standard nginx container.
  #       Give the image a proper name (or tag) using the -t flag.
  #       Create a volume mapping to serve the static web site located in 1-container.
  docker run -d -p 8081:80 -v "$(pwd)/1-container:/usr/share/nginx/html" nginx
fi

if [ "$1" == "3" ]; then
  #       Configure a standard nginx container to reverse proxy to google.
  #       If needed copy the commands from ./todo.sh 2 to serve the static website (using volume mapping).
  #       Create a volume mapping to the reverse-proxy configuration located in 2-reverse-proxy.
  #       Properly configure the 2-reverse-proxy/reverse_proxy.conf so that request to /search go to google.com.
  docker run -d --name nginx_reverse_proxy -p 8080:8080 -v $(pwd)/2-reverse-proxy/reverse_proxy.conf:/etc/nginx/conf.d/reverse_proxy.conf nginx

fi

if [ "$1" == "4" ]; then
#       Clone and run the simple-todo-app using an nginx container.
#       Clone the simple-todo-app from https://gitlab.com/sealy/simple-todo-app
#       Navigate to the project folder and create a build distribution (using npm run build)
#       Run an nginx container that has a volume mapping to the build distribution (the dist folder)
  git clone https://gitlab.com/sealy/simple-todo-app.git
  cd simple-todo-app && npm install && npm run build
  docker run -d -p 8081:80 -v "$(pwd)/dist:/usr/share/nginx/html" nginx

fi

if [ "$1" == "5" ]; then
  # Stop all your containers (so other containers should not be stopped)
  # Remove your images (please leave the other images alone)
  docker stop $(docker ps -aq)
  docker rmi $(docker images -q)
fi
