#!/bin/sh
sudo chmod 777 -R pgdata
docker build -t phx_app .