wget "https://github.com/gabriele6/docker-jekyll-nginx/archive/master.zip"
unzip master.zip
cp -r docker-jekyll-nginx-master/* ./
rm -r docker-jekyll-nginx-master/ master.zip README.md

chmod 777 initialize.sh
chmod 777 execute.sh
chmod 777 removeAll.sh
chmod 777 closeAll.sh

./initialize.sh
