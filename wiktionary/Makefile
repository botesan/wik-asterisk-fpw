MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

FPW_DIR := wikipedia-fpw
DOWNLOAD_FILE := jawiktionary-latest-pages-articles.xml.bz2
XML_FILE := ${FPW_DIR}/wikipedia.xml
DIC_ZIP_FILE := ${FPW_DIR}/wikipedia-fpw.zip
DIC_DIR := WIKTION
PARSE_DEP = ${FPW_DIR}/work/parse.dep

ERROR_LOG := ${MAKEFILE_DIR}/error.txt
TRACE_LOG := ${MAKEFILE_DIR}/log.txt

${DIC_DIR}: ${DIC_ZIP_FILE}
	rm -rf ${DIC_DIR}
	unzip ${DIC_ZIP_FILE}
	cp -p ${FPW_DIR}/work/gaiji.map ${DIC_DIR}/${DIC_DIR}.map
	(cd ${DIC_DIR}; LD_LIBRARY_PATH=/usr/local/lib ebzip -z -l 5 -n; cd ..)

${DIC_ZIP_FILE}: ${XML_FILE}
	(cd ${FPW_DIR}; PERL5LIB=. time fpwmake package 2>${ERROR_LOG} | tee ${TRACE_LOG}; cd ..)
	rm -rf ${DIC_DIR}

${XML_FILE}:
	wget https://dumps.wikimedia.org/jawiktionary/latest/${DOWNLOAD_FILE}
	bzip2 -d ${DOWNLOAD_FILE}
	mv jawiktionary-latest-pages-articles.xml ${XML_FILE}
	rm -f ${DIC_ZIP_FILE}

archive:
	(cd ${FPW_DIR}; PERL5LIB=. fpwmake archive; cd ..)

clean:
	(cd ${FPW_DIR}; PERL5LIB=. fpwmake clean; cd ..)

clean-xml:
	rm -f ${DOWNLOAD_FILE}
	rm -f ${XML_FILE}

clean-parse:
	rm -rf ${DIC_DIR}
	rm -f  ${DIC_ZIP_FILE}
	rm -f  ${PARSE_DEP}

download: clean-xml clean ${XML_FILE}
