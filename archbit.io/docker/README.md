# NGINX SINGLE HTML - DevOps Jr Challenge

This Docker image is based on Alpine Linux and serves a single static HTML page (index.html) using the Nginx web server. 
It's a lightweight, signed, CVES-free minimalistic container, perfect for serving static web content.

[Dockerhub Image Repository](https://hub.docker.com/repository/docker/shrtkv/nginx-single-html/)


Feel free to explore and use the Dockerfile for your Docker image customization. The repository contains additional resources and configurations for your convenience. It was created as part of a DevOps Junior challenge.

[Jump to "Building a Personal Image"](#building-a-personal-image)

## Verification Key 

 ```https://github.com/shrtkv/devops-SRE-studies/blob/master/archbit.io/docker/verification-key.pub```


## Running the Image from Docker Hub

1. Pull the Image
   
    You can pull the NGINX SINGLE HTML - DevOps Jr Challenge image with the following command:
  
    ```docker pull shrtkv/nginx-single-html:devops-jr-challenge```
  
2. Run the Container
   
    You can run the container with the following command:
  
     ```docker run -d -p 8080:80 shrtkv/nginx-single-html:devops-jr-challenge```
   
     By default, the container will serve the index.html page on port 80.
   

### Health Check (Optional)

You can set a custom health check URL for your container using the URLCHECK environment variable. This URL will be used for health checking purposes. To declare the URL, include the -e option when running the container:

     ```docker run -d -p 8080:80 -e URLCHECK="https://example.com/health" shrtkv/nginx-single-html:devops-jr-challenge```

   
   By default, it checks http://localhost:80.




## Building a Personal Image

1. Clone the GitHub Repository
   
    Before building a personal image, clone the GitHub repository containing the Dockerfile:

     ```docker build -t my-custom-html-container --build-arg HTML="mycustom.html" .```
   
    Then

     ```docker run -d -p 8080:80 -e URLCHECK="https://example.com/health" my-custom-html-container```

This will build the container using a HTML file named "mycustom.html" as the index.html. 

Feel free to use this personal image for serving your static web content with Nginx in an Alpine-based environment. It was created as part of a DevOps Junior challenge.
   

