I was traveling on my old laptop and it couldn't handle the infinite scroll of web twitter so i decided to use elinks with lua scripting to strip the feed so its just the favs. I'm all about the favs.

First you have to install lua5.0:


sudo apt-get install update
curl -R -O http://www.lua.org/ftp/lua-5.0.tar.gz
tar zxf lua-5.0.tar.gz
cd lua-5.0
make
sudo make install

Then get the dependencies for elinks:

sudo apt-get install libncurses5-dev

sudo apt-get install libevent-openssl-2.0-5

sudo apt-get install libssl-dev


Get elinks:


curl -R -O http://elinks.or.cz/download/elinks-current-0.12.tar.gz
tar zxf elinks-current-0.12.tar.gz
cd elinks-current-0.12

Configure it so it can handle twitter (bare minimum SSL and Lua):


nano config.h.in

#define CONFIG_OPENSSL
#define CONFIG_SCRIPTING_LUA
#define CONFIG_SSL

./configure
make
sudo make install

Finally copy the .lua files to ~/.elinks and you should be good to go!

If it doesn't run the first time you can run elinks with:

elinks -no-connect 1 -touch-files 0

