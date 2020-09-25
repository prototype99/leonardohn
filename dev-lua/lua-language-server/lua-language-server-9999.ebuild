# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 ninja-utils

DESCRIPTION="Lua Language Server"
HOMEPAGE="https://github.com/sumneko/lua-language-server"
EGIT_REPO_URI="${HOMEPAGE}"
EGIT_SUBMODULES=( '*' )
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/lua:="
DEPEND="
	${RDEPEND}
	dev-util/ninja
"

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	pushd 3rd/luamake > /dev/null || die
	eninja -f ninja/linux.ninja || die
	popd > /dev/null || die
	3rd/luamake/luamake rebuild || die
}

src_install() {
	dobin bin/Linux/lua-language-server
}
