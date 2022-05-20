sudo docker-compose up --build -d
sudo docker ps -a
curl http://localhost:8000/api/v1
cd /usr/share/html
sudo docker exec -it e1d4acfee376 sh

sudo docker-compose down
git pull
git status
sudo docker images
sudo docker rmi eb14c2d412d8
sudo docker logs qejaniapi

sudo apt install nginx
sudo ufw app list

sudo ufw enable
sudo ufw disable
sudo ufw allow 3000
sudo ufw delete allow 3000
sudo ufw allow 'Nginx Full'


cd /etc/nginx/sites-available
pwd
printenv


server { 
  listen 80; 
  server_name 52.5.50.15;

  location / {
    proxy_pass http://localhost:3000; #whatever port your app runs on
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}

server { 
  listen 80; 
  server_name 3.80.62.231;

  location = /favicon.ico { access_log off; log_not_found off; }
  location /static/ {
      root /home/ubuntu/apps/qejanisystem;
  }

  location / {
      include proxy_params;
      proxy_pass http://localhost:8000;
  }
} 

sudo ln -s /etc/nginx/sites-available/qejaniplatform /etc/nginx/sites-enabled


sudo docker exec -it qejaniapi /bin/bash
source /opt/venv/bin/activate && chmod +x migrate.sh