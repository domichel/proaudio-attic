# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="${PN/-/}"
MY_P="${MY_PN}_${PV}_2019-06-14"
At="${MY_P}.zip"

DESCRIPTION="Steinberg ASIO SDK 2.2 - win32"
HOMEPAGE="https://www.steinberg.net"
SRC_URI="https://download.steinberg.net/sdk_downloads/${MY_P}.zip -> ${P}.zip"

RESTRICT="mirror strip"

LICENSE="STEINBERG_SOFT-UND_HARDWARE_GMBH"
SLOT="0"
KEYWORDS="x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
S="${WORKDIR}/${MY_P}"

pkg_nofetch() {
	einfo "1. go to ${HOMEPAGE}"
	einfo "2. read the license agreement"
	einfo "3. if you accept it, then download ${At}"
	einfo "4. move ${At} to ${DISTDIR}"
	einfo
}

src_install() {
	dodir "/opt/${MY_P}"
	mv ./* "${D}/opt/${MY_P}"
}

pkg_postinst() {
	echo
	elog "${P} has been installed to /opt/${MY_P}"
	elog "To re-read the license please refer to"
	elog "/opt/${MY_P}/Steinberg ASIO Licensing Agreement.pdf"
	echo
}
