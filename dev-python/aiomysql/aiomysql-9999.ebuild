# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="aiomysql is a library for accessing a MySQL database from the asyncio"
HOMEPAGE="https://aiomysql.readthedocs.io/en/latest/"
#SRC_URI="https://github.com/aio-libs/${PN}/archive/v${PVR}.tar.gz -> ${PF}.tar.gz"
EGIT_REPO_URI="https://github.com/aio-libs/aiomysql.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/pymysql
"

src_prepare() {
	rm -rf tests docs

	default_src_prepare
}
