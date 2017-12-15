# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

EGIT_REPO_URI="https://github.com/KhronosGroup/Vulkan-Hpp.git"
EGIT_COMMIT_DATE="${PV}"
KEYWORDS="~amd64 ~x86"

SLOT="0"
DESCRIPTION="C++ Bindings for Vulkan"
HOMEPAGE="https://github.com/KhronosGroup/Vulkan-Hpp"

LICENSE="Apache-2.0"

src_install() {
	doheader -r vulkan
}
