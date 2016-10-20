# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Sets the root window name with useful information."
HOMEPAGE="https://github.com/nick-wallingford/rootname"
EGIT_REPO_URI="https://github.com/nick-wallingford/rootname.git"

IUSE="battery"

LICENSE="AGPL-3"
SLOT="0"

DEPEND="x11-libs/libxcb"

src_configure() {
	local mycmakeargs=(
		-DBATTERY="$(usex battery)"
	)

	cmake-utils_src_configure
}

src_install() {
	dobin rootname
}
