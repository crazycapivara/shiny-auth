#!/bin/bash
apt-get install -y apache2-utils 
htpasswd -c ./config/nginx_pwd $1

