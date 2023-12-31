# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
IUSE=""

inherit desktop xdg

RESTRICT=mirror
DESCRIPTION="A Tcl/Tk front end for Ecasound, with almost all of Ecasound features."
HOMEPAGE="http://tkeca.sourceforge.net"
SRC_URI="mirror://sourceforge/tkeca/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="media-sound/ecasound
   dev-lang/tcl
   dev-lang/tk"

src_prepare() {
	default
	sed -i -e "s:tkeca.png:tkeca:" -e "s:4.4.0:1.0:" tkeca.desktop || die "sed failed"
}

src_install() {
	dobin tkeca.tcl
	dodoc README.tkeca license.txt tkeca.html
	doicon tkeca.png
	insinto /usr/share/applications
	doins tkeca.desktop
}
