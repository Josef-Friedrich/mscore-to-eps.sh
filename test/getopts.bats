#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec mscore-to-eps.sh
}

# -h

@test "_getopts -h" {
	run _getopts -h
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: mscore-to-eps.sh [-hnsv] [<path>]" ]
}

@test "_getopts --help" {
	run _getopts --help
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: mscore-to-eps.sh [-hnsv] [<path>]" ]
}

@test "_getopts --help=123" {
	run _getopts --help=123
	[ "$status" -eq 4 ]
}

# -n

@test "_getopts -n" {
	_getopts -n
	[ "$OPT_NO_CLEAN" -eq 1 ]
}

@test "_getopts --no-clean" {
	_getopts --no-clean
	[ "$OPT_NO_CLEAN" -eq 1 ]
}

@test "_getopts --no-clean=123" {
	run _getopts --no-clean=123
	[ "$status" -eq 4 ]
}

# -s

@test "_getopts -s" {
	run _getopts -s
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Convert MuseScore files (*.mscz, *.mscx) \
to the EPS file format." ]
}

@test "_getopts --short-description" {
	run _getopts --short-description
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Convert MuseScore files (*.mscz, *.mscx) \
to the EPS file format." ]
}

@test "_getopts --short-description=123" {
	run _getopts --short-description=123
	[ "$status" -eq 4 ]
}

# -v

@test "_getopts -v" {
	run _getopts -v
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "$VERSION" ]
}

@test "_getopts --version" {
	run _getopts --version
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "$VERSION" ]
}

@test "_getopts --version=123" {
	run _getopts --version=123
	[ "$status" -eq 4 ]
}
