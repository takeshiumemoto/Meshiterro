#!/bin/sh

# Railsをインストール
gem install rails -v 6.1.4

# Node.js, Yarnをインストール
npm install -g yarn

# ImageMagickをインストール
cd
sudo yum -y install libpng-devel libjpeg-devel libtiff-devel libxml2-devel gcc
wget https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.3.0.tar.gz
tar xvfz libwebp-1.3.0.tar.gz
cd libwebp-1.3.0/
./configure
make
sudo make install
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
cd
git clone -b 7.1.1-5 --depth 1 https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.1.1-5
cd ImageMagick-7.1.1-5
./configure
make
sudo make install
cd

# # SQLiteをインストール
wget https://www.sqlite.org/2021/sqlite-autoconf-3360000.tar.gz
tar xzvf sqlite-autoconf-3360000.tar.gz
cd sqlite-autoconf-3360000/
./configure --prefix=/opt/sqlite/sqlite3
make
sudo make install
/opt/sqlite/sqlite3/bin/sqlite3 --version
gem pristine --all
gem install sqlite3 -- --with-sqlite3-include=/opt/sqlite/sqlite3/include --with-sqlite3-lib=/opt/sqlite/sqlite3/lib
echo 'export LD_LIBRARY_PATH="/opt/sqlite/sqlite3/lib"' >> ~/.bash_profile
sudo mv /bin/sqlite3 /bin/sqlite3.7.17
sudo ln -s /opt/sqlite/sqlite3/bin/sqlite3 /usr/bin/sqlite3