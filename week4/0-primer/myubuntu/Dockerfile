FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx && apt install node npm -y && apt install git

CMD ["nginx", "-g", "daemon off;"]
