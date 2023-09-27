# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
RESTRICT="mirror"
inherit desktop eutils xdg

MY_P="${P}-2016-11-21"
DESCRIPTION="Frinika is a free, complete music workstation software"
HOMEPAGE="http://www.frinika.com"
SRC_URI="mirror://sourceforge/frinika/${MY_P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}"/"${MY_P}"

IUSE=""
DEPEND="${RDEPEND}
	app-arch/unzip
	dev-java/ant-core"
RDEPEND=">=virtual/jre-1.5"

src_install() {
	insinto /usr/lib/"${PN}"
	doins "${PN}".jar
	dobin "${FILESDIR}"/frinika
	insinto /usr/lib/"${PN}"/lib
	doins lib/*
	make_desktop_entry ${PN} "Frinika" ${PN} "AudioVideo;Audio;Sequencer;"
	insinto /usr/share/pixmaps
	doicon -s 128 "${FILESDIR}/${PN}.png"
}
