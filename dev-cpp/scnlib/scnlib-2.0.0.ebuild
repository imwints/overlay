# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="scanf for modern C++ "
HOMEPAGE="https://scnlib.dev/"
SRC_URI="https://github.com/eliaskosunen/scnlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

BDEPEND="
	dev-cpp/fast_float
	>=dev-cpp/simdutf-4.0.0:=
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_STANDARD=20
		-DCMAKE_CXX_EXTENSIONS=OFF
		-DSCN_BENCHMARKS=OFF
		-DSCN_BENCHMARKS_BINARYSIZE=OFF
		-DSCN_BENCHMARKS_BUILDTIME=OFF
		-DSCN_DOCS=OFF
		-DSCN_EXAMPLES=OFF
		# Unconditionally calls FetchContent for GTest
		-DSCN_TESTS=OFF
		-DSCN_USE_EXTERNAL_FAST_FLOAT=ON
		-DSCN_USE_EXTERNAL_SIMDUTF=ON
	)
	cmake_src_configure
}

