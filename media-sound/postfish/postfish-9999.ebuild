# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit toolchain-funcs git-r3

DESCRIPTION="Digital audio post-processing, restoration, filtering and mixdown tool"
HOMEPAGE="https://svn.xiph.org/trunk/postfish/"
EGIT_REPO_URI="https://gitlab.xiph.org/xiph/postfish.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="sci-libs/fftw:3.0
	x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${P}-Makefile.patch )

src_compile() {
	emake ETCDIR="${EPREFIX}"/etc/postfish CC="$(tc-getCC)"
}

src_install() {
	# make install links binary again, using helpers instead
	dobin postfish
	#doman postfish.1
	insinto /etc/postfish
	doins postfish-gtkrc postfish-wisdomrc
	dodoc README
}
