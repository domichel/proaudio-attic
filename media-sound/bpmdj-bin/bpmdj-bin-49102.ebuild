# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop java-pkg-2 xdg
MY_PN="bpmdj"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="BpmDj: Next Generation DJ-ing"
HOMEPAGE="https://bpmdj.yellowcouch.org/index.html"
SRC_URI="http://bpmdj.yellowcouch.org/files/deployed/${MY_P}.jar"

LICENSE="LGPL-2.1"
SLOT="8"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE=""

DEPEND=">=virtual/jdk-1.8:*"
RDEPEND="dev-java/openjdk:8[javafx]
	dev-java/openjfx:8"

S="${WORKDIR}"

pkg_setup() {
	JAVA_PKG_WANT_BUILD_VM="openjdk-${SLOT}"
	JAVA_PKG_WANT_SOURCE="${SLOT}"
	JAVA_PKG_WANT_TARGET="${SLOT}"

	java-pkg-2_pkg_setup
}

src_unpack() {
	echo "Nothing to do."
}

src_install() {
	java-pkg_newjar "${DISTDIR}/${A}" "${MY_PN}.jar"
	java-pkg_dolauncher "${MY_PN}" --jar "/usr/share/${PN}-${SLOT}/lib/${MY_PN}.jar" --pwd '${BPMDJ_CONFIG_DIR}' -pre "${FILESDIR}/${MY_PN}-gentoo_vm"
	doicon -s 256 "${FILESDIR}/${MY_PN}.png"
	make_desktop_entry "bpmdj" "BpmDj" "${MY_PN}" "AudioVideo;Audio;Player"
}
