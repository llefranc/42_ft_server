# Ft_server (@42Paris)

"This is a System Administration subject. You will discover Docker and you will set up your first web server"

![Alt text](https://github.com/lucaslefrancq/42_ft_server/blob/master/ft_server_example.png)

## About

Ft_server is a project of the mandatory part of the cursus.
It's about using docker and setting up some services to run a website.
We had to create our own Dockerfile on Debian, and setup the configuration for
each services running in localhost.

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

        git clone https://github.com/lucaslefrancq/42_ft_server.git

2. `cd` into the root directory, and build the `Dockerfile`. Then run the docker image built.
	You have to map port 80 and 443 from docker container to the localhost using `-p` option.

        cd 42_ft_server
        Docker build -t ft_serv_img .
		Docker run -p 80:80 -p 443:443 ft_serv_img

3.  Access the different services with http:localhost/service with your browser, or use docker exec -ti
	command to enter inside the docker container and see the different config files.

        docker exec -it "container id" /bin/sh

## Sources

- [Full tutorial for Docker][3]
- [Tutoriel Docker (FR)][4]
- [Un autre tutoriel Docker (FR)][8]
- [Understanding how Wordpress works with Mysql][5]
- [Dockerfile syntax][6]
- [Comprendre le fonctionnement d'un serveur web (FR)][7]

[1]: https://github.com/lucaslefrancq/42_ft_server/blob/master/ft_server.en.subject.pdf
[2]: https://docs.docker.com/get-docker/
[3]: https://www.youtube.com/watch?v=jPdIRX6q4jA&list=PLy7NrYWoggjzfAHlUusx2wuDwfCrmJYcs&ab_channel=TechWorldwithNana
[4]: https://www.wanadev.fr/23-tuto-docker-comprendre-docker-partie1/
[5]: https://premium.wpmudev.org/blog/mysql-databases/
[6]: https://docs.docker.com/engine/reference/builder/
[7]: https://www.youtube.com/watch?v=msB9AvJ4bTM&ab_channel=Cookieconnect%C3%A9
[8]: https://devopssec.fr/article/differences-virtualisation-et-conteneurisation