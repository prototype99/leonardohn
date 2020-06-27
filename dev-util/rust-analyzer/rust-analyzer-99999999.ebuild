# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES=""

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/rust-analyzer/rust-analyzer"
DESCRIPTION="An experimental Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io"
LICENSE="Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-2-Clause BSD-3-Clause BSL-1.0 CC0-1.0 ISC MIT Unlicense Zlib"
RESTRICT="mirror"
SLOT="0"
IUSE=""

RDEPEND="dev-lang/rust[rls]"
DEPEND="${RDEPEND}"

CARGO_INSTALL_PATH="${S}/crates/rust-analyzer"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
