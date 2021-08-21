#!/data/data/com.termux/files/usr/bin/bash

echo "[*] Starting Installer..."
sleep 0.8
echo "[*] Installing requirements..."
pkg install wget tar gzip -y

echo "[*] Starting download..."
wget http://cli-assets.heroku.com/heroku-linux-arm.tar.gz -O heroku.tar.gz
sleep 0.9
echo "[*] Unzipping..."
sleep 1
tar -xvzf heroku.tar.gz
echo "[*] Setting up..."
sleep 2
mkdir -p /data/data/com.termux/files/usr/lib/heroku
mv heroku/* /data/data/com.termux/files/usr/lib/heroku
rm -rf heroku heroku.tar.gz
ln -s /data/data/com.termux/files/usr/lib/heroku/bin/heroku /data/data/com.termux/files/usr/bin/heroku
cd /data/data/com.termux/files/usr/lib/heroku/bin/
sed -i 's/#!/#!\/data\/data\/com.termux\/files/g' heroku
pkg install nodejs -y
mv node node.old
ln -s ../../../bin/node node
echo 'export PATH="/data/data/com.termux/files/usr/lib/heroku/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
echo "[*] Printing Heroku version installed..."
sleep 0.9
heroku --version
echo "[*] Install has been done!..."
sleep 0.7
echo "[*] Stoping Installer..."
sleep 1
exit 1
