# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit cmake-utils git-r3

DESCRIPTION="STM32 Discovery line linux programmer"
HOMEPAGE="https://github.com/texane/stlink"
EGIT_REPO_URI="https://github.com/texane/${PN}.git"
EGIT_COMMIT="55fddc2e55629a6d588976f087d5abbfb2f7b88f"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

LICENSE="BSD"
SLOT="0"
IUSE="gtk"

DEPEND=">=dev-util/cmake-2.8.7
virtual/libusb:1
gtk? ( x11-libs/gtk+:3 )"
