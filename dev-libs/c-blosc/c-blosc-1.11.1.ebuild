# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils
DESCRIPTION="Blocking, shuffling and lossless compression library"
HOMEPAGE="http://www.blosc.org/"
SRC_URI="https://github.com/Blosc/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="lz4 snappy static-libs test zlib zstd"

RDEPEND="
	lz4? ( >=app-arch/lz4-0_p120:0= )
	snappy? ( app-arch/snappy:0= )
	zlib? ( sys-libs/zlib:0= )
	zstd? ( app-arch/zstd )"
DEPEND="${RDEPEND}"

DOCS=( README_HEADER.rst README.rst README_THREADED.rst RELEASE_NOTES.rst RELEASING.rst ANNOUNCE.rst THANKS.rst THOUGHTS_FOR_2.0.txt )

src_configure() {
	local mycmakeargs=(
		-DBUILD_BENCHMARKS=OFF
		-DPREFER_EXTERNAL_LZ4=ON
		-DDEACTIVATE_LZ4=$(usex !lz4)
		-DDEACTIVATE_SNAPPY=$(usex !snappy)
		-DDEACTIVATE_ZLIB=$(usex !zlib)
		-DDEACTIVATE_ZSTD=$(usex !zstd)
		-DBUILD_STATIC=$(usex static-libs)
		-DBUILD_TESTS=$(usex test)
	)
	cmake-utils_src_configure
}
