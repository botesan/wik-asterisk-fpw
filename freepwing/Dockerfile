FROM debian:bullseye-slim

RUN apt-get update
RUN apt-get install -y bash zip zlib1g-dev bzip2 wget
RUN apt-get install -y make gcc
RUN apt-get install -y perlmagick

WORKDIR /usr/src/app
RUN wget ftp://ftp.sra.co.jp/pub/misc/freepwing/freepwing-1.6.1.tar.bz2
RUN tar xvf freepwing-1.6.1.tar.bz2
WORKDIR /usr/src/app/freepwing-1.6.1
RUN ./configure
RUN make
RUN make check
RUN make install

WORKDIR /usr/src/app
RUN wget ftp://ftp.sra.co.jp/pub/misc/eb/eb-4.4.3.tar.bz2
RUN tar xvf eb-4.4.3.tar.bz2
WORKDIR /usr/src/app/eb-4.4.3
RUN ./configure
RUN make
RUN make install

WORKDIR /usr/src/app
RUN wget https://mirrors.ctan.org/support/mimetex.zip
RUN unzip mimetex.zip
WORKDIR /usr/src/app/mimetex
RUN gcc -DAA -DAA mimetex.c gifsave.c -lm -o mimetex
RUN cp -p mimetex /usr/local/bin/

WORKDIR /mnt/work

ENTRYPOINT [ "bash" ]
