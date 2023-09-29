# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools desktop xdg

DESCRIPTION="Console program that listen to MIDI MMC to drive JACK transport"
HOMEPAGE="http://jackctlmmc.sourceforge.net/"
SRC_URI="mirror://sourceforge/jackctlmmc/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="lash +jackmidi"

RDEPEND="media-libs/alsa-lib
	virtual/jack
	lash? ( media-sound/lash )"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES="${FILESDIR}/${P}-makefile.patch"
DOCS=( NEWS README VERSION )

S=${WORKDIR}/${PN}

src_prepare() {
	eapply "${FILESDIR}/${P}-makefile.patch" || die "patching failed"
	eapply_user
	eautomake
}

src_configure() {
	tc-export CC
	econf \
	--enable-gui=no \
	$(use_enable lash) \
	$(use_enable jackmidi) || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	einstalldocs
}
