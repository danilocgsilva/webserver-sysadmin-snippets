echo """You have just sent files to the server to be executed there.
The script will configure a self-signed certificate automatically in an nginx.
Executes nginx-https.sh file in the user home directory.
But the server has pre-requisites:
* The nginx must be already installed.
* The paths
    /etc/ssl/private
    /etc/ssl/certs
    /etc/nginx/snippets
    /etc/nginx/sites-available
  must all be writable by your executing user.
"""