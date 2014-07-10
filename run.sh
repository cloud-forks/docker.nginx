#!/bin/sh

exec nginx >> /var/log/nginx.log 2>&1
