Bacula Director Docker Image
----------------------------

This is the bacula director image based on debian official image.

Features and Default Configuration
----------------------------------

The server uses the version 5.2.6, latest available to the debian 8.

All configuration files should be written to /etc/bacula/bacula-dir.conf.d as "*.conf" extension files by default. 


Required Enviroment Variables
-----------------------------

The following enviroment variables are supporte by this image:

 * DB_NAME, DB_USER, DB_PASS, DB_HOST: PostgreSQL information; if not provided all of them will default to 'bacula' and DB_HOST will default to 'bacula-db';
 * SD_HOST: The name of the Storage Daemon and Host - Must be the same for the storage daemon configuration;
 * DIR_HOST: The name of Director that will be used to configure the director and the bacula console;
 * DIR_PASSWORD: The Director password that will be used to configure the director and the Bacula FD Daemon;
 * SD_PASSWORD: The Storage Password that will be used by the Storage Daemon to communicate with Director - must be the same to the Storage Daemon Container;
 * MON_PASSWORD: The Password used by Bacula tray when configured in a host.


