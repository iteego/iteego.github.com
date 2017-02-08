# iteego.github.com
This repository contains the source code to the main Iteego web site.

# Local Bootstrap

## Software Requirements
To work with this repository locally, you need to have git, jekyll, gitit and nginx installed. On Ubuntu GNU/Linux you can install these by running the command:

```
sudo apt update
sudo apt install git jekyll gitit nginx
```

It also helps if you have a good text editor to edit HTML, CSS, JavaScript with. Your content edits will mostly be done using the gitit system though - which is based on the markdown format.

## Local Web Server
The web site is generated from source files using the Jenkins framework. It is assumed that some sort of web server sits in front of the generated web site (apache, nginx, amazon s3) and so in order to test the site locally you also need to set up a local web server. This is done using the NGINX web server - one-time bootstrapping steps below:

### NGINX local site definition
In your wikidata directory, copy the example nginx config file:

```
cd wikidata
cp .example_nginx_local_site.conf .nginx_local_site.conf
```

Edit the contents of .nginx_local_site.conf and make sure the root parameter points to the correct path where you have cloned repository.

Create two symlinks:

```
ln -s /path-to-this-repository/.nginx_local_site.conf /etc/nginx/sites-available/iteego.local
ln -s /etc/nginx/sites-available/iteego.local /etc/nginx/sites-enabled/iteego.local
```

Restart NGINX:
```
sudo service nginx restart
```

### IP Name mapping in /etc/hosts
Edit your local /etc/hosts file:

```
sudo edit /etc/hosts
```

Ensure that 127.0.0.1 also maps to iteego.local:

```
127.0.0.1       localhost iteego.local
```

Start your local services

./start_local.sh

You should now be able to browse to http://iteego.local and see the web site.


# Pushing
When you push commits in this repository, they will automatically become available at http://preview.iteego.com. Use this to review your changes with the rest of the team before making them live.

# Publishing
When it's time to publish, we run a Jenkins job (called iteego.com) to push the master branch live.
