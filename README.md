# Webserver sysadmin snippets

Auto generate snippets for sysadmins intented to works on bare metal webserver.

The first tool will be to automatically generate a self signed certificate for a just created virtual machine with nginx installed.

You can find the snippets generators scripts in `entrypoints` folder:

## nginx_ssl.sh

Execute with `-i` to get at once all required parameters.

In a debian-like Linux, creates auto-signed certificate to run ssl in development environment.

After running the script, enters in the server. Then set the `nginx-https.sh` file to a executable, them executes as sudo.
