# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
[[ "${PV}" = "9999" ]] && inherit git-r3
inherit gnome2-utils

RESTRICT="mirror"
IUSE=""

DESCRIPTION="A free (as in freedom) tracker style MIDI sequencer for GNU/Linux"
HOMEPAGE="http://www.nongnu.org/tutka"
if [ "${PV}" = "9999" ]; then
	EGIT_REPO_URI="git://git.sv.gnu.org/${PN}.git"
	KEYWORDS=""
else	
	SRC_URI="http://mirror.easyname.at/nongnu/${PN}/${P}.tar.xz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND=">=media-libs/alsa-lib-0.9.0
	dev-qt/qt-creator
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtwidgets
	dev-qt/qtxml
	dev-qt/qtbluetooth
	dev-qt/qtconcurrent
	dev-qt/qtdbus
	dev-qt/qtmultimedia
	dev-qt/qtnetwork
	dev-qt/qtopengl
	dev-qt/qtprintsupport
	dev-qt/qtdeclarative
	dev-qt/qtscript
	dev-qt/qtsql
	dev-qt/qtsvg
	dev-qt/qttest
	dev-qt/qtx11extras
	dev-qt/qtxml
	x11-libs/libdrm"

DOCS=( AUTHORS NEWS README TODO )

#src_unpack() {
#	[[ "${PV}" = "9999" ]] && git-r3_src_unpack
#	default
#}

src_configure() {
	qmake || die "qmake failed"
}

#src_compile() {
#	emake || die "emake failed"
#}

#src_install() {
#	make INSTALL_ROOT="${D}" install || die
#	einstalldocs
#}

#pkg_postinst() {
#	gnome2_icon_cache_update
#}

#pkg_postrm() {
#	gnome2_icon_cache_update
#}
