SCRIPT =	upobsd.sh
MAN =		upobsd.1

BINDIR ?=	/usr/local/bin
MANDIR ?=	/usr/local/man/man

README.md: upobsd.1
	mandoc -T markdown upobsd.1 \
		| sed -e 's/&nbsp;/ /g' -e 's/&lt;/</g' -e 's/&gt;/>/g' -e 's/&amp;/\&/g' \
		>$@

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} ${DESTDIR}${BINDIR}/upobsd

.include <bsd.prog.mk>
