echo """Several parameters ar required. They all will be interactively asked,
or for scripting sake, you can provide everything direct in the command line
as options:
-u <server_user>: provides the user name to server access.
-h <server_host>: provides the server address to access
-c <country_name>: the two letter country name required for certificate and key generation.
-s <state_name>: the two letter state name required for certificate and key generation.
-l <local_name>: full local name, like city
-o <organization_name>: provides the organization name
-v <unit_name>: the organization unit name
-f <full_qualified_name>: the full qualified name for your server
-e <email_address>: the e-mail address
-g <local_path>: if setted, saves the files locally instead of sending to server 
-i: print this help.
"""