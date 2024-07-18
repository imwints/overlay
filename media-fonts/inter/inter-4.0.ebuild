# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="The Inter font family"
HOMEPAGE="https://rsms.me/inter"
SRC_URI="https://github.com/rsms/inter/releases/download/v${PV}/Inter-${PV}.zip"
S="${WORKDIR}/extras/otf"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~riscv ~x86"

BDEPEND="app-arch/unzip"

FONT_SUFFIX="otf"
