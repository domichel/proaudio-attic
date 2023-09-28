# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit desktop toolchain-funcs xdg

MY_P=GoatTracker_${PV}_Stereo

DESCRIPTION="A tracker-like editor for creating C64 MOS 6581/8580 SID music"
HOMEPAGE="http://covertbitops.c64.org/"
SRC_URI="mirror://sourceforge/goattracker2/GoatTracker%202%20Stereo/${PV}/${MY_P}.zip"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND=">=media-libs/libsdl-1.2.14[sound,video]"
DEPEND="${RDEPEND}
	app-arch/unzip
	virtual/pkgconfig"

S=${WORKDIR}

#PATCHES=(
#	"${FILESDIR}/${PN}-2.74_makefile.patch"
#	"${FILESDIR}/${PN}-2.74_makefile.common.patch"
#	"${FILESDIR}/${PN}-2.74_bme_makefile.patch"
#)

src_prepare() {
	default
	# epatch and eapply_user fails with the complete patch
#	sed -i -e "s/(CXX)/(CXX) \$(LDFLAGS) \$(EXTFLAGS)/" src/makefile.common || die
#	sed -i -e "s/gcc/\$\(CC\) \$\(LDFLAGS\) \$\(EXTFLAGS\)/g" src/makefile.common || die
	# don't strip binaries
#	sed -i -e "s/strip/#strip/g" src/bme/makefile src/makefile.common || die
}

src_compile() {
	tc-export CC CXX
	cd src/bme
	emake || die "compile src/bme failed"
	cd ..
	emake || die "compile src failed"
}

src_install() {
	dobin linux/{gt2stereo,ins2snd2,mod2sng2,ss2stereo} || die

	dodoc authors readme.txt readme_resid.txt goat_tracker_commands.pdf

	doicon "${FILESDIR}/gt2stereo.xpm"
	make_desktop_entry gt2stereo GoatTracker gt2stereo "AudioVideo;Audio;"

	if use examples; then
		insinto "/usr/share/doc/${PF}/examples"
		doins examples/*.{ins,sng,prg}
	fi
}
