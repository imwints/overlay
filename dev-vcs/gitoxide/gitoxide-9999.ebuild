# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

DESCRIPTION="A command-line application for interacting with git repositories"
HOMEPAGE="https://github.com/Byron/gitoxide"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Byron/gitoxide"
else
	SRC_URI="
		https://github.com/Byron/gitoxide/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
	"
	KEYWORDS="~amd64"
fi

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD Boost-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"

BDEPEND="virtual/pkgconfig"
DEPEND="
	dev-libs/openssl
	>=net-misc/curl-8.6.0
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/.*"

pkg_setup() {
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export OPENSSL_NO_VENDOR
	export PKG_CONFIG_ALLOW_CROSS=1
}

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}
