# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit cmake-utils

DESCRIPTION="Sets the root window name with useful information."
HOMEPAGE="https://github.com/nick-wallingford/${PN}"
SRC_URI="https://github.com/nick-wallingford/${PN}/archive/${PVR}.tar.gz -> ${PF}.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
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
