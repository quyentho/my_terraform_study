sleep 30
sudo amazon-linux-extras install -y nginx1
sudo systemctl enable nginx
sudo systemctl start nginx
sudo mkdir -p /var/www
sudo tee -a /etc/nginx/conf.d/quickapp.conf > /dev/null <<EOT
    server{
        listen 80;
        root /var/www/quickapp;
        index index.html;
    }
EOT
sudo wget http://34.72.187.15:8081/repository/quickapp-quyentho/Production/QuickApp-Frontend/240/QuickApp-Frontend-240.zip
/bin/unzip QuickApp-Frontend-240.zip
sudo cp -r Frontend/. /var/www/quickapp
sudo systemctl reload nginx