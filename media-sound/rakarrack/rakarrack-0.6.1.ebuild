# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit autotools

DESCRIPTION="A richly featured multi-effects processor emulating a uitar effects pedalboard"
HOMEPAGE="http://rakarrack.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="altivec sse sse2"

RDEPEND="!media-sound/rakarrack-plus
	x11-libs/fltk:1
	x11-libs/libXpm
	>=media-libs/alsa-lib-0.9
	media-libs/libsamplerate
	media-libs/libsndfile
	>=media-sound/alsa-utils-0.9
	virtual/jack"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/${P}-assume-fltk.patch" )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# datadir confuse the reverb
	# docdir needed by the help menu
	econf \
		$(use_enable altivec) \
		$(use_enable sse) \
		$(use_enable sse2) \
		--enable-datadir=no \
		--enable-docdir=yes
}
