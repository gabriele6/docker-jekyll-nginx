# docker-jekyll-nginx
building Jekyll websites in docker

#### Running the existing containers automatically at startup
* view the cron list with `crontab -e` (as root)
* add the line `@reboot /root/execute.sh` somewhere

`execute.sh` runs the docker containers listed in the config.txt file in the main directory. Those containers are created in the `initialize.sh` script, therefore you shouldn't edit the config.txt file.

If you want to place your files away from the `/root/` directory, edit the cron line accordingly (you must update the `execute.sh` and `initialize.sh` files too with the new path instead of `/root/`)
