# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.3

EAPI=8

declare -A GIT_CRATES=(
	[dialoguer]='https://github.com/console-rs/dialoguer;47a9d4df729db7ffc1492bd0845be786e6f20153;dialoguer-%commit%'
	[monotrail-utils]='https://github.com/konstin/poc-monotrail;e0251f68c254f834180198b8677fcf85d4b6a844;poc-monotrail-%commit%/crates/monotrail-utils'
)

inherit cargo

DESCRIPTION="a Hassle-Free Python Experience"
HOMEPAGE="https://rye.astral.sh/"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/astral-sh/rye"
	inherit git-r3
else
	SRC_URI="
		https://github.com/astral-sh/rye/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
	"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD ISC MIT MPL-2.0
	Unicode-DFS-2016
"
SLOT="0"

BDEPEND="
	>=app-arch/zstd-1.5.5:=
	dev-libs/openssl
	sys-libs/zlib
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/rye"

pkg_setup() {
	export OPENSSL_NO_VENDOR=1
	export PKG_CONFIG_ALLOW_CROSS=1
	export ZSTD_SYS_USE_PKG_CONFIG=1
}

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_test() {
	local mytestargs=(
		--skip test_is_inside_git_work_tree
		# The following tests require network access.
		--skip test_basic_list
		--skip test_list_not_rye_managed
		--skip test_add
		--skip test_dotenv
		--skip test_config
		--skip test_init
		--skip test_publish
		--skip test_lint_and_format
		--skip test_version
		--skip test_empty_sync
		--skip test_autosync_remember
		--skip test_fetch
		--skip test_basic_tool_behavior
	)

	cargo_src_test -- "${mytestargs[@]}"
}

src_install() {
	cargo_src_install --path rye
}
