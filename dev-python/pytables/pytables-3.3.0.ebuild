# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="Hierarchical datasets for Python"
HOMEPAGE="http://www.pytables.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PVR}.tar.gz -> ${PF}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
LICENSE="BSD"
IUSE="doc examples"

RDEPEND="
	app-arch/bzip2:0=
	dev-libs/c-blosc:0=
	>=dev-python/numpy-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/numexpr-2.5[${PYTHON_USEDEP}]
	>=sci-libs/hdf5-1.8.4:0=
	>=dev-python/cython-0.21[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	doc? ( dev-lang/python:2.7
		   dev-python/sphinx )"

S="${WORKDIR}/PyTables-${PVR}"

DOCS=( README.rst THANKS RELEASE_NOTES.txt ANNOUNCE.txt )

python_test() {
	${EPYTHON} tables/tests/test_all.py || die
}

python_compile() {
	make ANNOUNCE.txt
	distutils-r1_python_compile

	if use doc; then
		python2 ./setup.py build_sphinx
	fi
}

python_install_all() {
	if use doc; then
		HTML_DOCS=( build/sphinx/html/. )
		DOCS+=( doc/scripts )
	fi
	distutils-r1_python_install_all

	if use examples;then
		insinto /usr/share/doc/${PF}
		doins -r examples
		doins -r contrib
	fi
}
