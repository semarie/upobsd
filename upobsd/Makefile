SCRIPT=	upobsd.sh
MAN=	upobsd.1

realinstall:
	${INSTALL} ${INSTALL_COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
		${.CURDIR}/${SCRIPT} ${DESTDIR}${BINDIR}/upobsd

.include <bsd.prog.mk>
