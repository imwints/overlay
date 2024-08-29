# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	aho-corasick@1.1.3
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.86
	async-trait@0.1.81
	auto_impl@1.2.0
	autocfg@1.3.0
	backtrace@0.3.73
	bitflags@1.3.2
	bitflags@2.6.0
	bstr@1.10.0
	bytes@1.7.1
	cc@1.1.15
	cfg-if@1.0.0
	clap@4.5.16
	clap_builder@4.5.15
	clap_complete@4.5.24
	clap_derive@4.5.13
	clap_lex@0.7.2
	cli-table-derive@0.4.6
	cli-table@0.4.9
	colorchoice@1.0.2
	const-random-macro@0.1.16
	const-random@0.1.18
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	crunchy@0.2.2
	csv-core@0.1.11
	csv@1.3.0
	dashmap@5.5.3
	dlv-list@0.5.2
	equivalent@1.0.1
	form_urlencoded@1.2.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	getrandom@0.2.15
	gimli@0.29.0
	glob@0.3.1
	globset@0.4.14
	hashbrown@0.14.5
	heck@0.5.0
	hermit-abi@0.3.9
	httparse@1.9.4
	idna@0.5.0
	ignore@0.4.22
	indexmap@2.4.0
	is_terminal_polyfill@1.70.1
	itoa@1.0.11
	lazy_static@1.5.0
	libc@0.2.158
	lock_api@0.4.12
	log@0.4.22
	lsp-types@0.94.1
	memchr@2.7.4
	miniz_oxide@0.7.4
	mio@1.0.2
	nu-ansi-term@0.46.0
	object@0.36.3
	once_cell@1.19.0
	ordered-multimap@0.7.3
	overload@0.1.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	proc-macro2@1.0.86
	quote@1.0.37
	redox_syscall@0.5.3
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	rust-ini@0.21.1
	rustc-demangle@0.1.24
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.209
	serde_derive@1.0.209
	serde_json@1.0.127
	serde_repr@0.1.19
	serde_spanned@0.6.7
	sharded-slab@0.1.7
	shlex@1.3.0
	signal-hook-registry@1.4.2
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.7
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.76
	sync_wrapper@0.1.2
	termcolor@1.4.1
	thread_local@1.1.8
	tiny-keccak@2.0.2
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tokio-macros@2.4.0
	tokio-util@0.7.11
	tokio@1.39.3
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.20
	tower-layer@0.3.3
	tower-lsp-macros@0.9.0
	tower-lsp@0.20.0
	tower-service@0.3.3
	tower@0.4.13
	tower@0.5.0
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	tree-sitter-cmake@0.5.0
	tree-sitter-language@0.1.0
	tree-sitter@0.23.0
	treesitter_kind_collector@0.2.0
	trim-in-place@0.1.7
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-width@0.1.13
	url@2.5.2
	utf8parse@0.2.2
	valuable@0.1.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.6.18
"

inherit cargo

DESCRIPTION="The Lsp for cmake"
HOMEPAGE="https://github.com/neocmakelsp/neocmakelsp"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/neocmakelsp/neocmakelsp"
else
	SRC_URI="
		https://github.com/neocmakelsp/neocmakelsp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
	"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 CC0-1.0 MIT Unicode-DFS-2016"
SLOT="0"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}
