# docker-jekyll-nginx
building Jekyll websites in docker

#### Setup
* Download and extract the archive  
`wget "https://github.com/gabriele6/docker-jekyll-nginx/archive/master.zip"`  
`unzip master.zip`  
`cp -r docker-jekyll-nginx-master/* ./`  
`rm -r docker-jekyll-nginx-master/ master.zip README.md`
* Edit file permissions  
 `chmod 777 initialize.sh`  
 `chmod 777 execute.sh` 
* Fork a Jekyll theme repository and edit the initialize.sh file with the location and repository name of the theme on your repositories (example theme: https://github.com/arkadianriver/spectral)
* run `./initialize.sh`

#### Running the existing containers automatically at startup
* view the cron list with `crontab -e` (as root)
* add the line `@reboot /root/execute.sh` somewhere

`execute.sh` runs the docker containers listed in the config.txt file in the main directory.  
Those containers are created in the `initialize.sh` script, therefore you shouldn't edit the config.txt file.

If you want to place your files away from the `/root/` directory, edit the cron line accordingly (you must update the `execute.sh` and `initialize.sh` files too with the new path instead of `/root/`)
