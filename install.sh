sudo apt-get update
curl -R -O http://www.lua.org/ftp/lua-5.0.tar.gz
tar zxf lua-5.0.tar.gz
cd lua-5.0
make
sudo make install
sudo apt-get install libncurses5-dev libevent-openssl-2.0-5 libssl-dev
cd ..
curl -R -O http://elinks.or.cz/download/elinks-current-0.12.tar.gz
tar zxf elinks-current-0.12.tar.gz
cd elinks-0.12*
_ssl='#define CONFIG_OPENSSL'
_lua='#define CONFIG_SCRIPTING_LUA'
_cssl='#define CONFIG_SSL'
_rssl='#undef CONFIG_OPENSSL'
_rlua='#undef CONFIG_SCRIPTING_LUA'
_rcssl='#undef CONFIG_SSL'
cp config.h.in orig.config.h.in
cat orig.config.h.in | sed "s/$_rssl/$_ssl/g" | sed "s/$_rlua/$_lua/g" | sed "s/$_rcssl/$_cssl/g" > config.h.in
./configure
make
sudo make install
cd ..
if [ ! -d ~/.elinks ]; then
    mkdir ~/.elinks
fi
cp config.lua orig.config.lua
cat orig.config.lua | sed "s/raul/$USER/g" > config.lua #oh raul yah silly goose
cp *.lua ~/.elinks/.

