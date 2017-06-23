# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

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
	sed -i 's,\r,,' pcgen.sh || die
	sed 's,cd `dirname $0`,cd /usr/share/pcgen,' pcgen.sh > "${PN}" || die
	eapply_user
}

src_install() {
	dobin "${PN}"
	insinto /usr/share/"${PN}"
	doins -r characters data docs libs outputsheets pcgen-batch-convert.jar pcgen.jar plugins preview system
	einstall_docs
}
