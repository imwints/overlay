# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="Learn touch typing for free"
HOMEPAGE="https://tipp10.com/en/"
SRC_URI="https://gitlab.com/tipp10/tipp10/-/archive/v${PV}/tipp10-v${PV}.tar.bz2 -> ${P}.tar.bz2"

S="${WORKDIR}/tipp10-v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

DEPEND="
	>=dev-qt/qtbase-6.4:6[sql,widgets]
	>=dev-qt/qtmultimedia-6.4:6
"
