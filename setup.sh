wget "https://github.com/gabriele6/docker-jekyll-nginx/archive/master.zip"
unzip master.zip
yes | cp -i -r docker-jekyll-nginx-master/* ./
rm -r docker-jekyll-nginx-master/ master.zip README.md

sudo chmod 777 initialize.sh
sudo chmod 777 execute.sh
sudo chmod 777 removeAll.sh
sudo chmod 777 closeAll.sh
sudo chmod 777 setup.sh


./closeAll.sh
./removeAll.sh

./initialize.sh
