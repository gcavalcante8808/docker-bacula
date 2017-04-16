Docker Bacula
-------------

This repository contain all information about gcavalcante8808 bacula docker images.

You can check details of each image at the respective folder.

All images are founded on a Debian image with all modules support (except for mysql on server at this time) and support version 5.2.6.

Simple Usage
------------

**Warning: Before use the docker-compose to create all bacula related services, change the passwords for director, mon and SD inside the docker-compose file.**

Clone this repository (or copy the docker-compose.yml file) to your computer, and use the ** docker-compose ** to start the services:

``` docker-compose up -d ```

After 15 seconds, you can check your bacula infraestructure using the bconsole:

``
    docker exec -it dockerbacula_bacula-dir_1 bconsole
``

The docker-compose file uses the version of 5.2.6 of the images by default.
