Bacula Storage Docker Image
---------------------------

This is the bacula storage image based on debian official image.

Features and Default Configuration
----------------------------------

The server uses the version 5.2.6, latest available to the debian 8.

All configuration files should be written to /etc/bacula/bacula-sd.conf.d as "*.conf" extension files by default. 

Required Enviroment Variables
-----------------------------

The following enviroment variables are supporte by this image:

 * SD_HOST: The name of the Storage Daemon and Host - Must be the same for the **director** daemon configuration;
 * SD_PASSWORD: The Storage Password that will be used by the Storage Daemon to communicate with Director - must be the one defined in the Director Daemon Environment Variable;
 * DIR_HOST: The Director host and hostname that will be used by the Storage - should be the one defined in the Director Daemon Environment Variable;


