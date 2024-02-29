# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/aristocratos/btop.git"
	inherit git-r3
else
	SRC_URI="https://github.com/aristocratos/btop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~x86"
fi

DESCRIPTION="A monitor of resources"
HOMEPAGE="https://github.com/aristocratos/btop"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="gpu"

src_configure() {
	local mycmakeargs=(
		-DBTOP_GPU=$(usex gpu)
		-DBTOP_RSMI_STATIC=false
		# Fortification can be set in CXXFLAGS instead
		-DBTOP_FORTIFY=false
	)
	cmake_src_configure
}
