BRANCH="master"
wget "https://github.com/gabriele6/docker-jekyll-nginx/archive/$BRANCH.zip"
unzip "$BRANCH.zip"
yes | cp -i -r docker-jekyll-nginx-$BRANCH/* ./
rm -r docker-jekyll-nginx-$BRANCH/ $BRANCH.zip README.md

sudo chmod 777 build_and_serve.sh
sudo chmod 777 get_and_serve.sh
sudo chmod 777 restart_containers.sh
sudo chmod 777 removeAll.sh
sudo chmod 777 closeAll.sh
sudo chmod 777 setup.sh
sudo chmod 777 servers_remove.sh
sudo chmod 777 servers_add.sh

./closeAll.sh
./removeAll.sh

./get_and_build.sh
