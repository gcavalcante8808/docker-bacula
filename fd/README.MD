Bacula FD Docker Image
----------------------

This is the bacula fd image based on debian official image.

Features and Default Configuration
----------------------------------

The server uses the version 5.2.6, latest available to the debian 8.

Required Enviroment Variables
-----------------------------

The following enviroment variables are supporte by this image:

 * MON_PASSWORD: The Mon Password that will be used by the FD Daemon to communicate with Director - must be the one defined in the Director Daemon Environment Variable;
 * DIR_PASSWORD: The Director Password that will be used by the FD communicate with Director - must be the one defined in the Director Daemon Environment Variable;
 * DIR_HOST: The Director host and hostname that will be used by the FD - should be the one defined in the Director Daemon Environment Variable;
