#!/bin/bash

FPW_DIR=wikipedia-fpw
XML_FILE=$FPW_DIR/wikipedia.xml
DIC_ZIP_FILE=$FPW_DIR/wikipedia-fpw.zip
DIC_DIR=WIKTION

case $1 in
'clean')
    cd $FPW_DIR
    fpwmake clean
    cd ..
    ;;
'archive')
    cd $FPW_DIR
    fpwmake archive
    cd ..
    ;;
*)
    if [[ ! -e $XML_FILE ]]; then
        wget https://dumps.wikimedia.org/jawiktionary/latest/jawiktionary-latest-pages-articles.xml.bz2
        bzip2 -d jawiktionary-latest-pages-articles.xml.bz2
        mv jawiktionary-latest-pages-articles.xml $XML_FILE
        rm -f $DIC_ZIP_FILE
    fi
    if [[ -e $XML_FILE && ! -e $DIC_ZIP_FILE ]]; then
        cd $FPW_DIR
        ERROR_LOG=../error.txt
        TRACE_LOG=../log.txt
        (time PERL5LIB=. fpwmake package) 2>$ERROR_LOG | tee $TRACE_LOG
        cd ..
        rm -rf $DIC_DIR
    fi
    if [[ -e $DIC_ZIP_FILE && ! -e $DIC_DIR ]]; then
        unzip $DIC_ZIP_FILE
        cp -p $FPW_DIR/work/gaiji.map $DIC_DIR/$DIC_DIR.map
        cd $DIC_DIR
        LD_LIBRARY_PATH=/usr/local/lib ebzip -z -l 5 -n
        cd ..
    fi
    ;;
esac
