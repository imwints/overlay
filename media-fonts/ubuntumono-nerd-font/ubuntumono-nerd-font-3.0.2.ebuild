# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A free and open-source typeface for developers"
HOMEPAGE="https://www.nerdfonts.com/"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/UbuntuMono.tar.xz -> ${P}.tar.xz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
