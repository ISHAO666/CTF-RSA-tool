#!/bin/bash

apt install cmake gcc -y

tar -xvf m4-1.4.18.tar.gz && cd m4-1.4.18 && ./configure && make && make install  && cd ../ &&  rm -rf m4-1.4.18

tar -xvf gmp-6.1.2.tar.xz && mkdir temp && cd temp && ../gmp-6.1.2/configure --prefix=/usr/local/gmp-6.1.2 && make  && make install && cd ../ && rm -rf temp/* && rm -rf gmp-6.1.2 

tar -xvf mpfr-3.1.3.tar.xz && cd temp && ../mpfr-3.1.3/configure --prefix=/usr/local/mpfr-3.1.3 --with-gmp=/usr/local/gmp-6.1.2 && make && make install && cd .. && rm -rf temp/* && rm -rf mpfr-3.1.3

tar -xvf mpc-1.0.3.tar.gz && cd temp && ../mpc-1.0.3/configure --prefix=/usr/local/mpc-1.0.3 --with-gmp=/usr/local/gmp-6.1.2 --with-mpfr=/usr/local/mpfr-3.1.3 && make && make install && cd .. && rm -rf temp/* && rm -rf gmp-6.1.2


C_INCLUDE_PATH=/usr/local/mpfr-3.1.3/include/:/usr/local/mpc-1.0.3/include/
export C_INCLUDE_PATH

ln -s /usr/local/mpc-1.0.3/lib/libmpc.so.3.0.0 /usr/lib/libmpc.so && ln -s /usr/local/mpfr-3.1.3/lib/libmpfr.so.4.1.3 /usr/lib/libmpfr.so

pip install gmpy2 