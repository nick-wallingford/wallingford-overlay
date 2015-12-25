# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

DESCRIPTION="Sets the root window name with useful information."
HOMEPAGE="https://github.com/nick-wallingford/${PN}"
SRC_URI="https://github.com/nick-wallingford/${PN}/archive/${PVR}.tar.gz -> ${PF}.tar.gz"

KEYWORDS="~amd64"

LICENSE="AGPL-3"
SLOT="0"

DEPEND="x11-libs/libX11"

src_install() {
	dobin rootname
}
