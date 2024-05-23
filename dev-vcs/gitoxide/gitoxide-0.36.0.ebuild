# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.8.7
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	anes@0.1.6
	ansiterm@0.12.2
	anstream@0.6.14
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.7
	anyhow@1.0.77
	arbitrary@1.3.2
	arc-swap@1.6.0
	arrayvec@0.7.4
	assert_matches@1.5.0
	async-attributes@1.1.2
	async-channel@1.9.0
	async-channel@2.1.1
	async-executor@1.8.0
	async-global-executor@2.4.1
	async-io@1.13.0
	async-io@2.2.2
	async-lock@2.8.0
	async-lock@3.2.0
	async-net@2.0.0
	async-std@1.12.0
	async-task@4.6.0
	async-trait@0.1.75
	atomic-waker@1.1.2
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.13.1
	base64@0.21.5
	base64@0.22.1
	basic-toml@0.1.7
	bitflags@1.3.2
	bitflags@2.4.1
	block-buffer@0.10.4
	blocking@1.5.1
	bstr@1.9.0
	btoi@0.4.3
	bumpalo@3.16.0
	bytes@1.5.0
	bytesize@1.3.0
	byteyarn@0.2.3
	cap@0.1.2
	cassowary@0.3.0
	cast@0.3.0
	cc@1.0.83
	cfg-if@1.0.0
	ciborium-io@0.2.1
	ciborium-ll@0.2.1
	ciborium@0.2.1
	clap@4.4.12
	clap_builder@4.4.12
	clap_complete@4.4.5
	clap_derive@4.4.7
	clap_lex@0.6.0
	clru@0.6.1
	cmake@0.1.50
	colorchoice@1.0.0
	concurrent-queue@2.4.0
	conpty@0.5.1
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	cpufeatures@0.2.11
	crc-catalog@2.4.0
	crc32fast@1.4.2
	crc@3.0.1
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-channel@0.5.10
	crossbeam-deque@0.8.4
	crossbeam-epoch@0.9.17
	crossbeam-queue@0.3.10
	crossbeam-utils@0.8.20
	crossbeam@0.8.3
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crosstermion@0.13.0
	crypto-common@0.1.6
	curl-sys@0.4.72+curl-8.6.0
	curl@0.4.46
	dashmap@5.5.3
	defer@0.2.1
	deranged@0.3.10
	derive_arbitrary@1.3.2
	diff@0.1.13
	digest@0.10.7
	displaydoc@0.2.4
	document-features@0.2.8
	dunce@1.0.4
	either@1.9.0
	encoding_rs@0.8.33
	env_logger@0.10.2
	equivalent@1.0.1
	errno@0.3.8
	event-listener-strategy@0.4.0
	event-listener@2.5.3
	event-listener@4.0.1
	expectrl@0.7.1
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	faster-hex@0.9.0
	fastrand@1.9.0
	fastrand@2.1.0
	filetime@0.2.23
	flate2@1.0.28
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	fs-err@2.11.0
	fs_extra@1.3.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@1.13.0
	futures-lite@2.1.0
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	getrandom@0.2.11
	gimli@0.28.1
	gix-actor@0.27.0
	gix-actor@0.28.1
	gix-attributes@0.19.0
	gix-bitmap@0.2.8
	gix-chunk@0.4.5
	gix-commitgraph@0.21.0
	gix-date@0.8.1
	gix-discover@0.26.0
	gix-features@0.35.0
	gix-features@0.36.1
	gix-fs@0.7.0
	gix-fs@0.8.1
	gix-glob@0.13.0
	gix-hash@0.13.3
	gix-hashtable@0.4.1
	gix-ignore@0.8.0
	gix-index@0.25.0
	gix-lock@10.0.0
	gix-lock@11.0.1
	gix-object@0.37.0
	gix-object@0.38.0
	gix-path@0.10.1
	gix-quote@0.4.8
	gix-ref@0.38.0
	gix-revwalk@0.8.0
	gix-sec@0.10.1
	gix-tempfile@10.0.0
	gix-tempfile@11.0.1
	gix-trace@0.1.4
	gix-traverse@0.33.0
	gix-utils@0.1.6
	gix-validate@0.8.1
	gix-worktree@0.26.0
	glob@0.3.1
	gloo-timers@0.2.6
	h2@0.4.4
	half@1.8.2
	hashbrown@0.12.3
	hashbrown@0.14.3
	hashlink@0.9.1
	heck@0.4.1
	hermit-abi@0.3.3
	home@0.5.5
	http-body-util@0.1.1
	http-body@1.0.0
	http@1.1.0
	httparse@1.8.0
	human_format@1.0.3
	humantime@2.1.0
	hyper-rustls@0.26.0
	hyper-tls@0.6.0
	hyper-util@0.1.3
	hyper@1.2.0
	idna@0.5.0
	imara-diff@0.1.5
	indexmap@2.1.0
	indoc@2.0.4
	instant@0.1.12
	io-close@0.3.7
	io-lifetimes@1.0.11
	ipnet@2.9.0
	is-docker@0.2.0
	is-terminal@0.4.10
	is-wsl@0.4.0
	is_ci@1.1.1
	is_terminal_polyfill@1.70.0
	itertools@0.10.5
	itertools@0.12.0
	itoa@1.0.10
	js-sys@0.3.66
	jwalk@0.8.1
	kstring@2.0.0
	kv-log-macro@1.0.7
	layout-rs@0.1.1
	lazy_static@1.4.0
	libc@0.2.153
	libsqlite3-sys@0.28.0
	libz-ng-sys@1.1.13
	libz-sys@1.1.13
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.12
	litrs@0.4.1
	lock_api@0.4.11
	lockfree-object-pool@0.1.6
	log@0.4.21
	lru@0.12.1
	lzma-sys@0.1.20
	maplit@1.0.2
	maybe-async@0.2.7
	memchr@2.7.1
	memmap2@0.7.1
	memmap2@0.9.3
	memoffset@0.7.1
	mime@0.3.17
	miniz_oxide@0.7.1
	mio@0.8.11
	native-tls@0.2.11
	nix@0.26.4
	ntapi@0.4.1
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.17
	num_cpus@1.16.0
	num_enum@0.5.11
	num_enum_derive@0.5.11
	num_threads@0.1.6
	object@0.32.2
	once_cell@1.19.0
	oorandom@11.1.3
	open@5.0.1
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.98
	openssl@0.10.62
	overload@0.1.1
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	pathdiff@0.2.1
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.13
	pin-project@1.1.5
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.28
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	plotters@0.3.5
	polling@2.8.0
	polling@3.3.1
	powerfmt@0.2.0
	pretty_assertions@1.4.0
	proc-macro-crate@1.3.1
	proc-macro2@1.0.75
	prodash@26.2.2
	prodash@28.0.0
	ptyprocess@0.4.1
	quote@1.0.35
	ratatui@0.25.0
	rayon-core@1.12.0
	rayon@1.8.0
	redox_syscall@0.4.1
	regex-automata@0.4.3
	regex-syntax@0.8.2
	regex@1.10.2
	reqwest@0.12.0
	ring@0.16.20
	ring@0.17.7
	rusqlite@0.31.0
	rustc-demangle@0.1.23
	rustix@0.37.27
	rustix@0.38.31
	rustls-ffi@0.8.2
	rustls-pemfile@0.2.1
	rustls-pemfile@1.0.4
	rustls-pki-types@1.3.1
	rustls-webpki@0.102.2
	rustls@0.20.9
	rustls@0.22.4
	rustversion@1.0.14
	ryu@1.0.16
	same-file@1.0.6
	scc@2.1.1
	schannel@0.1.23
	scopeguard@1.2.0
	sct@0.7.1
	sdd@0.2.0
	security-framework-sys@2.9.1
	security-framework@2.9.2
	serde@1.0.193
	serde_derive@1.0.193
	serde_json@1.0.108
	serde_urlencoded@0.7.1
	serial_test@3.1.1
	serial_test_derive@3.1.1
	sha1-asm@0.5.2
	sha1@0.10.6
	sha1_smol@1.0.0
	sharded-slab@0.1.7
	shell-words@1.1.0
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	signal-hook@0.3.17
	simd-adler32@0.3.7
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.4.10
	socket2@0.5.5
	spin@0.5.2
	spin@0.9.8
	stability@0.1.1
	static_assertions@1.1.0
	strsim@0.10.0
	strum@0.25.0
	strum_macros@0.25.3
	subtle@2.5.0
	symlink@0.1.0
	syn@1.0.109
	syn@2.0.47
	sync_wrapper@0.1.2
	sysinfo@0.30.2
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tar@0.4.40
	tempfile@3.10.0
	termcolor@1.4.0
	terminal_size@0.3.0
	thiserror-impl@1.0.56
	thiserror@1.0.56
	thread_local@1.1.7
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinytemplate@1.2.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-native-tls@0.3.1
	tokio-rustls@0.25.0
	tokio-util@0.7.10
	tokio@1.35.1
	toml_datetime@0.6.6
	toml_edit@0.19.15
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-forest@0.1.6
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	try-lock@0.2.5
	trybuild@1.0.86
	tui-react@0.22.0
	typenum@1.17.0
	uluru@3.0.0
	unicode-bidi@0.3.14
	unicode-bom@2.0.3
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	untrusted@0.7.1
	untrusted@0.9.0
	url@2.5.0
	utf8parse@0.2.1
	valuable@0.1.0
	value-bag@1.9.0
	vcpkg@0.2.15
	version_check@0.9.4
	waker-fn@1.1.1
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-futures@0.4.39
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-shared@0.2.89
	wasm-bindgen@0.2.89
	web-sys@0.3.66
	webpki-roots@0.26.1
	webpki@0.22.4
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.51.1
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows@0.44.0
	windows@0.48.0
	windows@0.51.1
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.40
	winnow@0.6.0
	winreg@0.50.0
	xattr@1.2.0
	xz2@0.1.7
	yansi@0.5.1
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
	zeroize@1.7.0
	zip@1.3.1
	zopfli@0.8.1
"

inherit cargo

DESCRIPTION="A command-line application for interacting with git repositories"
HOMEPAGE="https://github.com/Byron/gitoxide"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Byron/gitoxide"
else
	SRC_URI="
		https://github.com/Byron/gitoxide/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
	"
fi

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD Boost-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="virtual/pkgconfig"
DEPEND="
	dev-libs/openssl
	>=net-misc/curl-8.6.0
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/.*"

pkg_setup() {
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export OPENSSL_NO_VENDOR
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
