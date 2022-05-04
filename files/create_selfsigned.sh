cat > /etc/nginx/certs/nginx-selfsigned.crt <<EOF
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;    
EOF