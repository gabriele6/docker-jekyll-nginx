# docker-jekyll-nginx
building Jekyll websites in docker

#### Setup
* Install Docker (https://docs.docker.com/engine/installation/)
* Download and extract the archive  
`wget "https://github.com/gabriele6/docker-jekyll-nginx/archive/master.zip"`  
`unzip master.zip`  
`cp -r docker-jekyll-nginx-master/* ./`  
`rm -r docker-jekyll-nginx-master/ master.zip README.md`
* Edit file permissions  
 `chmod 777 build_and_serve.sh`  
 `chmod 777 restart_containers.sh` 
* Fork a Jekyll theme and edit the build_and_serve.sh file with the location of the theme on your repositories (example theme: https://github.com/arkadianriver/spectral)
* run `./build_and_serve.sh`
 
Alternatively, after installing Docker you can download the script setup.sh to your home directory, edit file permissions with `chmod 777 setup.sh`, and run it with `./setup.sh`.  
At this point you have a working theme installed. You might want to fork a theme, edit the build_and_serve.sh script with the forked theme location, and run `./build_and_serve.sh` to build everything and serve the site.

Remember setup.sh should be executed only once, since it overrides everything and gets you to the default settings.

#### Running the existing containers automatically at startup
* view the cron list with `crontab -e` (as root)
* add the line `@reboot /root/restart_containers.sh` somewhere

`restart_containers.sh` runs the docker containers listed in the containers.txt file in the main directory.  
Those containers are created in the `build_and_serve.sh` script, therefore you shouldn't edit the containers.txt file.

If you want to place your files away from the `/root/` directory, edit the cron line accordingly (you must update the `build_and_serve.sh` file too with the new path instead of `/root/`)
