# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools git-r3 xdg

RESTRICT="mirror"
DESCRIPTION="audio editor and live playback tool"
HOMEPAGE="http://www.metadecks.org/software/sweep/"
EGIT_REPO_URI="https://github.com/kfish/sweep.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="alsa libsamplerate mp3 oss pulseaudio speex vorbis"

DEPEND="media-libs/libsamplerate
	>=media-libs/libsndfile-1.0
	>=x11-libs/gtk+-2.0
	alsa? ( >=media-libs/alsa-lib-1.0.0 )
	libsamplerate? ( media-libs/libsamplerate )
	mp3? ( >=media-libs/libmad-0.15 )
	speex? ( media-libs/speex )
	vorbis? ( media-libs/libogg media-libs/libvorbis )"

src_prepare() {
	eapply_user
	eautoreconf
	sed -i -e "s/Application;AudioVideo;/AudioVideo;Audio;AudioVideoEditing;/" \
		-e "s/Icon=sweep.svg/Icon=sweep/" \
		"${S}/${PN}.desktop"
}

src_configure() {
	econf \
		$(if ! use alsa; then echo --disable-alsa; fi) \
		$(if ! use libsamplerate; then echo --disable-src; fi) \
		$(if ! use mp3; then echo --disable-mad; fi) \
		$(if ! use oss; then echo --disable-oss; fi) \
		$(if ! use pulseaudio; then echo --disable-pulseaudio; fi) \
		$(if ! use speex; then echo --disable-speex; fi) \
		$(if ! use vorbis; then echo --disable-oggvorbis; fi) \
		|| die "econf failed"
}

#	emake || die "make failed"
#}

#src_install() {
#	make DESTDIR="${D}" install || die "make install failed"
#}

pkg_postinst() {
	einfo
	einfo "Sweep can use ladspa plugins,"
	einfo "emerge ladspa-sdk and ladspa-cmt if you want them."
	einfo
}
