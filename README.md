# Ft_server (@42Paris)

"This is a System Administration subject. You will discover Docker and you will set up your first web server"

![Alt text](https://github.com/lucaslefrancq/42-03_ft_server/blob/master/ft_server_example.png)

## About

Ft_server is a project of the mandatory part of the cursus.
It's about using docker and setting up some services to run a website.
We had to create our own Dockerfile on Debian, and setup the configuration for
each services in localhost.

- The different services are :
    - A web server (Nginx) that can be access in http / https
	- Phpmyadmin
    - Wordpress
    - Mysql

- Here is the [subject][1]

`Requirement for running this project : Docker`

### Building and running the project

1. Install [Docker][2]

2. Download/Clone this repo

        git clone https://github.com/lucaslefrancq/42-03_ft_server

2. `cd` into the root directory, and build the `Dockerfile`. Then run the docker image built.
	You have to map port 80 and 443 from docker container to the localhost using `-p` option.

        cd 42-03_ft_server
        Docker build -t ft_serv_img .
		Docker run -p 80:80 -p 443:443 ft_serv_img

3.  Access the different services with http:localhost/service with your browser, or use docker exec -ti
	command to enter inside the docker container and see the different config files.

        docker exec -it "container id" /bin/sh

## Sources

- [Full tutorial for Docker and Kubernetes][4]

[1]: https://github.com/lucaslefrancq/42-03_ft_server/blob/master/ft_server.en.subject.pdf