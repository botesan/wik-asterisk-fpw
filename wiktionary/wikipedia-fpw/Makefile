#
# Copyright (C) 2007-2009  Kazuhiro Ito
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

PACKAGE = wikipedia-fpw
DIR = WIKTION
SRCDIR = .
COPYRIGHT_FILE = GFDL
COMMON_SOURCES = ${SRCDIR}/wikipedia.xml wikipedia-fpw.conf
SOURCES = ${COMMON_SOURCES} tables
PACKAGEEXTRA = ${COPYRIGHT_FILE} README.PKG
PREPARSER = preparser

HALFCHARS = halfchar.txt
FULLCHARS = fullchar.txt

ifndef HASH_MOD
HASH_MOD = Hash
endif

ARCHIVEEXTRA = ChangeLog COPYING entities.pl fpwwikipedia_cgraph \
	fpwwikipedia_common wikipedia-fpw.conf tables ${PREPARSER} \
	${PACKAGEEXTRA} WikipediaFpw/Hash/Hash.pm \
	WikipediaFpw/Hash/BDB.pm WikipediaFpw/Hash/GDBM.pm \
	gaiji/q16F.xbm gaiji/q16H.xbm
FPWPARSER = fpwwikipedia
FPWPARSERFLAGS = -hash_module ${HASH_MOD} ${SOURCES} ${COPYRIGHT_FILE}
PREPARSE_DEP = ${SRCDIR}/preparse.dep
ALLDEPS = ${PREPARSE_DEP}
CLEANEXTRA = ${SRCDIR}/${PREPARSE_DEP} ${SRCDIR}/entries

.SUFFIXES:

include fpwutils.mk

${PREPARSE_DEP}: ${COMMON_SOURCES} ${PREPARSER}
	@rm -f ${PARSE_DEP}
	${PERL} ${PERLINCFLAGS} ${PERLFLAGS} ${PREPARSER} \
	    -hash_module ${HASH_MOD} \
	    ${SRCDIR}/wikipedia.xml ${SRCDIR}/entries
	@echo timestamp > ${SRCDIR}/preparse.dep

${CGRAPH_DEP}: ${COMMON_SOURCES} ${PREPARSE_DEP}
	@rm -f ${CGRAPH_DEP}
	test -d ${WORKDIR} || ${MKDIRHIER} ${WORKDIR}
	${PERL} ${PERLINCFLAGS} ${PERLFLAGS} ./fpwwikipedia_cgraph \
	    -hash_module ${HASH_MOD} \
	    -workdir ${WORKDIR} -srcfile ${SRCDIR}/wikipedia.xml
	@echo timestamp > ${CGRAPH_DEP}
