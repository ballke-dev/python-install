#!/bin/sh
cp _ssl.so $HOME &&
cp ssl.py $HOME &&
cd $HOME &&
mkdir -p virtualenvs &&
wget https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz &&
tar -xvf Python-2.7.6.tgz &&
cd Python-2.7.6/ &&
./configure --prefix=$HOME/packages/Python-2.7.6 --enable-unicode=ucs4 --with-pth &&
make -j &&
make install &&
cd $HOME/virtualenvs/ &&
virtualenv -p $HOME/packages/Python-2.7.6/bin/python store &&
cp $HOME/_ssl.so $HOME/packages/Python-2.7.6/lib/python2.7/lib-dynload &&
cp $HOME/ssl.py $HOME/packages/Python-2.7.6/lib/python2.7 &&
rm -rf $HOME/_ssl.so &&
rm -rf $HOME/ssl.py &&
rm -rf $HOME/Python-2.7.6.tgz &&
rm -rf $HOME/Python-2.7.6/
