UPOBSD(1) - General Commands Manual

# NAME

**upobsd** - download, verify and patch bsd.rd image

# SYNOPSIS

**upobsd**
\[**-v**]
\[**-m**&nbsp;*mirror*]
\[**-V**&nbsp;*version*]
\[**-a**&nbsp;*arch*]
\[**-p**&nbsp;*signify-key*]
\[**-i**&nbsp;*install-response-file*]
\[**-u**&nbsp;*upgrade-response-file*]
\[**-o**&nbsp;*output*]

# DESCRIPTION

**upobsd**
is a
ksh(1)
script designed to download, verify and optionally patch bsd.rd image.

**upobsd**
will download bsd.rd image using
ftp(1)
from mirror defined in
installurl(5),
will verify the downloaded file using
signify(1)
and local key inside
*/etc/signify*
to ensure integrity, and optionally patch the image for adding
*auto\_install.conf*
or
*auto\_upgrade.conf*
file to add support of offline
autoinstall(8).

Patching requires super-user privilegies in order to use
vnconfig(8)
and
mount(8)
for modifying the ramdisk image.
doas(1)
will be used for this purpose and should be configured accordingly.

The options are as follows:

**-v**

> Enable verbose mode.
> Forces
> **upobsd**
> to show all steps of the process.
> If the input is a terminal, progress bar for downloading will be always showed.

**-m** *mirror*

> Use the given mirror URL.
> For the format, see
> installurl(5).

**-V** *version*

> Select an operating system version.
> By default,
> **upobsd**
> will download bsd.rd for current running version.

**-a** *arch*

> Select a specific architecture.
> By default,
> **upobsd**
> will use current system architecture as
> uname(1)
> report it.

**-p** *signify-key*

> Specify a particular file as public-key for
> signify(1)
> in order to check
> *SHA256.sig*
> and
> *bsd.rd*
> files.
> By default, a key from
> */etc/signify*
> is selected using the requested operating system version.
> But the right key should be manually selected when requesting a snapshot
> and its version is the next release.

**-i** *install-response-file*

> Adds
> *install-response-file*
> as
> *auto\_install.conf*
> inside the ramdisk of bsd.rd image.

**-u** *upgrade-response-file*

> Adds
> *upgrade-response-file*
> as
> *auto\_upgrade.conf*
> inside the ramdisk of bsd.rd image.
> If both
> **-i**
> and
> **-u**
> are used, only the latest option on command-line is considered.

**-o** *output*

> Selects a different output name from
> *bsd.rd*
> in the current directory.

# SEE ALSO

ftp(1),
signify(1)

# AUTHORS

**upobsd**
was written by
Sebastien Marie &lt;[semarie@online.fr](mailto:semarie@online.fr)&gt;.

# CAVEATS

**upobsd**
could be unable to patch some archs due to stripped binary or because
incompatible endianness.

OpenBSD 6.3 - April 8, 2018
