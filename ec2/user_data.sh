#!/bin/bash

apt update -y
apt upgrade -y
apt install nginx
systemctl enable nginx
systemctl start nginx
