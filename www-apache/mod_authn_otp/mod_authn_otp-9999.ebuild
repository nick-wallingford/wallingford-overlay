# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3 apache-module

EGIT_REPO_URI="https://github.com/archiecobbs/mod-authn-otp.git"
DESCRIPTION="Apache module for one-time password authentication"
HOMEPAGE="https://github.com/archiecobbs/mod-authn-otp"

LICENSE="Apache-2.0"
SLOT="0"

need_apache2_4

src_prepare() {
	default
	./autogen.sh || die "Autogen failed."
}

src_install() {
	default

	APACHE2_MOD_DEFINE="OTP"
	insinto "${APACHE_MODULES_CONFDIR}"
}
