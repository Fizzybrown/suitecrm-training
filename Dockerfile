FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# install apache
RUN apt-get update && \
    apt install -y apache2 apache2-utils 

# install php 7.4
RUN apt-get update && \
    apt -y install software-properties-common && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get update && \
    apt -y install php7.4 && \
    php -v

WORKDIR /var/www/html

COPY ./suitecrm ./mysuitecrm


EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
