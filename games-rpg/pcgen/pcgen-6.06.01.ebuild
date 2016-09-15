# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit games

DESCRIPTION="D&D character generator"
HOMEPAGE="http://pcgen.sourceforge.net/"
SRC_URI="mirror://sourceforge/pcgen/${P}-full.zip"

LICENSE="LGPL-2.1 OGL-1.0a"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.6"
DEPEND="app-arch/unzip"

S=${WORKDIR}/${PN}

src_prepare() {
	rm -vf pcgen.exe
	sed -i 's,\r,,' pcgen.sh
	sed "/dirname/ c\cd \"${GAMES_DATADIR}\/${PN}\"" pcgen.sh > "${T}"/${PN} || die
}

src_install() {
	dogamesbin "${T}"/${PN}
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r *
	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
}

pkg_postinst() {
	games_pkg_postinst
}
