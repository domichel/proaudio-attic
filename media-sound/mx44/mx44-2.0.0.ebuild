# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit autotools
RESTRICT="mirror"
MY_P="Mx44-${PV}"

DESCRIPTION="Mx44 is a polyphonic midi realtime software synthesizer"
HOMEPAGE="https://github.com/linuxmao-org/Mx44"
SRC_URI="https://github.com/linuxmao-org/Mx44/archive/refs/tags/v2.0.0.tar.gz"

AUTOTOOLS_AUTORECONF="1"
AUTOTOOLS_IN_SOURCE_BUILD="1"
#PATCHES=( "${FILESDIR}/${PN}-autotoolize.patch" )

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DOCS=( "${WORKDIR}/${MY_P}/README.md" "${FILESDIR}/README.Gentoo" )

IUSE=""
DEPEND="media-libs/alsa-lib
	virtual/jack
	x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}/src"
PATCHES="${FILESDIR}/${P}_makefile.patch"

#src_prepare() {
#	default
#	sed -i -e "s:/usr/local/:/usr/:" \
#		-e 's:$(PREFIX)share/Mx44:$(DESTDIR)$(PREFIX)share/Mx44:' \
#		-e 's:$(PREFIX)bin:$(DESTDIR)$(PREFIX)bin:' Makefile || die "sed Makefile failed"
#}
