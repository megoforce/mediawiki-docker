# mediawiki-docker
Yet another Dockerfile for Mediawiki.

## how to use this container

### 1. Link a database container
This container should be linked to a "mysql" instance.

### 2. Run the container with the following environment variables
* WIKI_URL: The url where this wiki lives.
* WIKI_NAME: The name of the wiki
* LOGO_URL: A URL for the logo image
* CONTACT_EMAIL: The e-mail of the systems administrator.

### 3. Run setup.sh
You can do it by running the following command
		docker exec <container name> /setup.sh
This will create the database and an administrator account

### 4. Change the default password
The previous step created an administrator account with username "admin" and password "hackme". Once you get the container running and set up, the first thing to do is login with the said credentials and a "change password" dialog will apear, leaving your administrator account secure.

