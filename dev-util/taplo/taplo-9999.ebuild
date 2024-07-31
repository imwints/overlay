# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.3

EAPI=8

inherit cargo

DESCRIPTION="Language server for Taplo"
HOMEPAGE="https://taplo.tamasfe.dev"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/tamasfe/taplo"
	inherit git-r3
else
	SRC_URI="
		https://github.com/tamasfe/taplo/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
	"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD CDDL ISC MIT MPL-2.0 openssl Unicode-DFS-2016"
SLOT="0"

BDEPENDS="
	dev-libs/openssl
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/taplo"

pkg_setup() {
	export OPENSSL_NO_VENDOR=1
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

src_install() {
	cargo_src_install --path crates/taplo-cli
}