SUBDIR = 
SUBDIR += rdsetroot
SUBDIR += upobsd

.include <bsd.subdir.mk>

README.md: upobsd/upobsd.1
	mandoc -T markdown upobsd/upobsd.1 >$@
