SUBDIR = 
SUBDIR += elfrdsetroot
SUBDIR += upobsd

.include <bsd.subdir.mk>

README.md: upobsd/upobsd.1
	mandoc -T markdown upobsd/upobsd.1 \
		| sed -e 's/&nbsp;/ /g' -e 's/&lt;/</g' -e 's/&gt;/>/g' -e 's/&amp;/\&/g' \
		>$@
